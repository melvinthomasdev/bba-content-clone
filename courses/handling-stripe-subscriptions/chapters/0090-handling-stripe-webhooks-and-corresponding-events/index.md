## Handling Stripe webhooks

Stripe payments are often very asynchronous in nature. Once we initiate the card
payment request, it may even take a day for Stripe to receive the actual payment
at their end.

Thus we should always rely on Stripe webhook events as the source of truth for
confirming anything related to Stripe payments.

The webhook endpoint has an associated URL, e.g.,
`https://bigbinary.com/stripe/webhook_events`. The Stripe notifications are
`Event` objects.

This `Event` object contains all the relevant information about what happened,
including the type of event and the data associated with that event.

The webhook endpoint uses the event details to take any required actions, such
as indicating that an order should be fulfilled.

## Use cases of webhooks

Stripe has both synchronous and asynchronous events. For example, a successful
request to create a customer immediately returns a `Customer` object.

Such requests don’t require webhooks, as the key information can be retrieved
via the response itself.

But some actions like creating payment intents, handling subscriptions, payout
notifications etc are asynchronous in nature.

We will be using webhook events to handle checkout sessions and subscriptions in
our application.

## Creating webhook endpoint

The first step is to add a webhook endpoint from our Stripe account. Stripe
webhooks work by making a `POST` request with JSON webhook data to our
designated endpoint when an event, or specific events we choose, are fired from
Stripe's end.

Let's add a webhook endpoint via
[Stripe Dashboard](/https://dashboard.stripe.com/test/webhooks).

<image>webhook.png</image>

Enter the details as shown below:

<image>create_a_webhook.png</image>

While adding a webhook endpoint, we should only select the events which we are
planning to handle in our application. This is to prevent unnecessary load on
our server. We can do it by clicking on the `Select events` button shown in the
image above and choosing the desired events.

Now, our Stripe account is configured to send events to our application's
webhook endpoint.

The next step for integrating Stripe webhooks is to create our own backend
webhook endpoint. Let's call our endpoint `webhook_events`. The endpoint should
be able to accept `POST` requests with JSON data.

### Key factors to remember and preferred solutions

We need to send back a `2xx` HTTP status response to Stripe as soon as we
receive an event from Stripe.

This kind of fast acknowledgement is required in order to make sure that Stripe
doesn't attempt to repeat the notification or more specifically try to hit our
endpoint again and again.

After multiple failures to send the notification over multiple days, Stripe
marks the event as failed and stops trying to send it to our endpoint.

After multiple days without receiving any `2xx` HTTP status code responses,
Stripe emails us about the misconfigured endpoint, and automatically disables
our endpoint soon after if left unaddressed.

In order to acknowledge Stripe events as soon as possible, what we can do from
the application perspective is to delegate all the time consuming processes,
that needs to be done based on the webhook event, to a separate worker/job.

So once we receive an event, we can immediately send back the `2xx` response and
then asynchronously complete other tasks in the worker. This will handle the
acknowledgment issue.

Next point we need to keep in mind is that, we need to verify each and every
event that hits our webhook endpoint.

When a webhook endpoint receives a response, we don't know the origin of the
response. Anyone could've made that request.

So in order to verify and make sure that the event was sent from Stripe itself,
we need to verify the signature, which Stripe sends in the `Stripe-Signature`
header. We will discuss about the verification part in the upcoming sections.

Another crucial point is regarding maintaining idempotency. Webhook endpoints
might occasionally receive the same event more than once from Stripe. We need to
guard against this scenario by making our webhook handlers idempotent.

In live mode, Stripe attempts to deliver our webhooks for up to three days with
an exponential back off.

In test mode, Stripe retries three times over a few hours. Webhooks can be
manually retried after this time in the Dashboard.

A point to note when going into implementation is that, some frameworks, like
say Ruby on Rails, have implicit protection against CSRF turned on.

But we can't verify the same for webhook events since these events are coming
from another server. Thus we need to exempt the webhooks route from CSRF
protection. In Rails we can do the following:

```ruby
protect_from_forgery except: :webhook_events
```

#### Steps to verify signature

Retrieve our webhook endpoint's secret from the Dashboard’s Webhooks settings or
by running `stripe-cli` in our terminal.

We need to store this secret as an ENV variable. Note that the webhook secret
for test and live API keys are different.

Let's make use of the official Stripe library to verify the signature. For
Rails, we make use of [stripe-ruby](https://github.com/stripe/stripe-ruby).

First, we need to get the signature from the `Stripe-Signature` header and get
the payload from the request body of the webhook event. For example, in Rails we
could read these from the `request` object:

```ruby
payload = request.body.read
header = request.env['HTTP_STRIPE_SIGNATURE']
```

Next, we need to pass in the payload, signature, and the webhook endpoint
secrets to the `construct_event` function from the Stripe library. In rails, we
can create a function like so:

```ruby
def verify_webhook_signature
  wh_secret = Figaro.env.stripe_webhook_secret
  Stripe::Webhook.construct_event(
    request.body.read,
    request.env['HTTP_STRIPE_SIGNATURE'],
    wh_secret
  )
rescue JSON::ParserError => e
  render status: 200, json: { error: 'Invalid payload' }
rescue Stripe::SignatureVerificationError => e
  render status: 200, json: { error: 'Invalid signature' }
end
```

On verification, if any failure occurs, an error will be thrown, like say JSON
parsing error when the payload is invalid or a signature verification error when
signature is invalid.

We need to catch it and discard the whole request by sending back a `2xx` HTTP
response in error scenarios. Here we need to send `2xx` response in order to
avoid getting duplicate events from Stripe.

## Designing idempotent webhook handlers

Say that we have a backend logic to send an email to our customer once we
successfully make a payment via checkout.

So what happens if we receive `checkout.session.completed` event more than once
from Stripe? Do we need to send the mail to our customer again and again?

No! We only need to send the mail once. In order to ensure that, we need to
create an idempotent design.

### Database design

Regardless of the application logic and its business use cases, we can always
have a common, business logic independent, design to handle webhooks.

We need to create a model named `WebhookEvent`. It can have the following schema
considering from the perspective of a PostgreSQL database, since we have used
`jsonb` datatype:

```bash
WebhookEvent
------------
id - primary key
data - jsonb
state - integer - can be handled as an enum with states like { pending: 0, processing: 1, processed: 2, failed: 3 }, where we can set default value as 0
external_id - string - this is the unique id stripe attaches to each event
processing_errors - string - if any error occurs we can store the error message here. This can be null.
timestamps - datetimes like created_at and updated_at
```

We need to make the `external_id` field a unique index, since no two webhook
events will have the same id. We will be checking this `external_id` to maintain
idempotency.

### Handling mechanism during implementation

**Controller logic**

The first line of handling happens in the webhook events controller. We can make
use of the following steps in order to handle the webhook event:

Before entering the main logic, the first thing we need to make sure is that we
verify webhook signature and ensure idempotency. We already went through the
steps to verify webhook signature.

Now in order to ensure idempotency, need to do is query our `WebhookEvent` table
and make sure that there doesn't exist any record with the same `external_id` as
the current webhook event.

If there already exists an entry, then that means this webhook event is a
duplicate one, and we can safely return a `2xx` HTTP response without going
further.

If the event is a new one, then we need to add a new entry into `WebhookEvent`
table. For the time being, we only need to insert the `data`, eg: in Rails it
would be something like `params.except(:source, :controller, :action).permit!`
and `external_id`, eg: in Rails this would be `params[:id]`, into the DB.

The next step is to invoke a worker, say `WebhookEventHandlerWorker`, which
would asynchronously handle the rest of processing, such that we can send back
an acknowledgement response of `2xx` back to Stripe without any delay after
invoking this worker.

**Worker logic**

Now the worker will take care of invoking a `StripeHandler` service, where we
handle different webhook events and reflect the changes into our database. The
following are the steps we need to take in the worker:

- Find the webhook event with given webhook event id, which we need to pass in
  as an argument to the worker.
- If the event is not already processed and if it exists, then we can set the
  status of the event to be processing.
- The next step is to try and invoke our `StripeHandler` service.
- If the handler is processed successfully then we can confirm that the event is
  processed.
- All other cases would indicate a failure case. Thus in that case we need to
  update the status with a failed state and also store those errors.

The implementation would look something like this in Rails:

```ruby
def perform(webhook_event_id)
  event = WebhookEvent.find(webhook_event_id)
  return { message: "Event already processed" } if event.processed?

  if event.blank?
    return { message: "No webhook event with given id in webhook event handler!" }
  end

  event.processing!

  begin
    service = StripeHandler.new(event)
    service.process
    event.processed!
  rescue StandardError => e
    event.update(state: :failed, processing_errors: e)
    puts "Couldn't process Stripe event", event&.errors&.full_messages&.to_sentence || e
  end
end
```

**Service logic**

We only send the webhook event object from our backend as an argument to this
service. We can use the following steps to process the service:

- First, we need to construct the stripe event from the event object data.
  Stripe library provides us with a `construct_from` method, to which, we can
  pass in `event.data` as an argument. Eg: In Rails, it would look something
  like this:

```ruby
stripe_event = Stripe::Event.construct_from(event.data)
```

- Once we get the stripe event object, we need to conditionally check the `type`
  of the event. Example, in Rails:

```ruby
case stripe_event.type
  when 'checkout.session.completed'
    # do checkout related processing
  else
    # Unhandled event
    Rails.logger.warn "Unhandled event #{stripe_event.type}"
end
```

- The `type` of event refers to the type of webhook event stripe has sent.
  Example: `checkout.session.completed`. What kind of events we are receiving,
  will depend upon whether we have requested only specific events or all events
  from Stripe dashboard in live mode or from stripe-cli in test mode.
- Based on the `type` of event, we can invoke our own custom logic to process in
  backend.

## Handling checkout session

In the first chapter, we got an overview of how we can handle checkout session.

Now let's deep dive into the implementation details and how to integrate webhook
events into it.

Note that, here too we will be using the same business logic that we have been
following, that is the customer can provide the email and payment info to get
access to the product.

So for handling the checkout session, first we need to check if a user with the
same email id exists in our database.

If such a user exists and the status of their subscription is active, then we
can send back a notice message saying
`Account already taken. Please use another email.`.

If such a user exists and doesn't have an active subscription, it means the user
is re-subscribing.

When passing the parameters to create a checkout session we can either set the
`customer` param or the `customer_email` param as we discussed in the chapter,
[Accepting payments using stripe](/handling-stripe-subscriptions/accepting-payments-using-stripe).

If there is already a user with the given email id, that user will have an
associated stripe customer ID in our database. In this case, we need to use the
`customer` option in checkout parameters to avoid duplicate customer creation at
Stripe's end.

If no user exists, then pass in the `customer_email` as currently provided
email. This will create a new Stripe customer once checkout session is
completed. This parameter should only be passed in during the first time
creation of a new user. For updates and related cases, we need to use `customer`
parameter.

Once payment is made successfully, we will receive a
`checkout.session.completed` event. Let's store the stripe event data object
into a `checkout_session` variable.

We need to verify whether `checkout_session.payment_status` is `paid` and
whether we have a user with an active subscription. If any of these conditions
fail, then the verification should fail, since we require payment to be success
and subscription to be active.

If we already have a user with the same stripe customer ID matching the
`checkout_session.customer` value, then we need to update the existing user
record, associated subscription, and other tables with the latest webhook data.

If no such user exists, then we can create a new `User` and populate the
associated tables with data from the webhook event.

Once checkout session is verified, then we can safely fulfill the order, which
in most cases would be sending out an email.

Here in our case, we could send out an email with the default login credentials,
which should include an email and a generated password.

## Handling subscription events

Mainly we only need to handle two cases which are subscription update and
deletion.

### Customer subscription updated event

- Get the `id`(Stripe ID) of the subscription object which we received from the
  webhook event.
- Retrieve the latest subscription details using that ID and expand the
  `customer` field.
- Find the user whose email matches the `customer` email in the retrieved
  subscription object.
- Update the user and its associated tables with latest data.

### Customer subscription deleted event

- Get the `id`(Stripe ID) of the subscription object which we received from
  webhook event.
- From the `Subscription` table find the subscription which has a matching
  stripe ID with `id`(Stripe ID) from the subscription object. In webhooks, we
  always match using Stripe ID, rather than local ID, since the webhook event
  object will only consist that ID.
- Set the `status` of that subscription as `canceled`.

## Setting up stripe-cli

[stripe-cli](https://stripe.com/docs/stripe-cli) is a command line tool from
Stripe, which let's us build, test, and manage our Stripe integration right from
the terminal.

This tool abstracts away the endpoint URL manipulation and provides us with
simple natural and easy to read/write syntax.

The very first step is to install `stripe-cli` in our system. This can be
installed directly via package manager.

If the tool is not available in our system, then make use of its
[docker image](https://hub.docker.com/r/stripe/stripe-cli).

```bash
# for mac
brew install stripe/stripe-cli/stripe

# for all variations of ubuntu and debian
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.bintray.com/stripe/stripe-cli-deb stable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install stripe
```

### Use cases

- Securely test webhooks without relying on third-party tunneling software.
- Trigger webhook events to easily test our integration.
- Receive API request logs locally.
- Create, retrieve, update, and delete API objects.

### Pairing with our Stripe account

After installing the Stripe CLI, we must pair it with our Stripe account. To do
so, run `stripe login` in the terminal.

We’ll be prompted to launch our browser and login to the Stripe Dashboard to
grant the Stripe CLI access to our account.

Pairing generates a pair of secret API keys - one test mode, one live mode —
that are valid for 90 days.

We can also manually delete the key under API Keys in the Dashboard, by clicking
on the `Revoke Key` button near each of the API keys.

### Configuring Stripe CLI

We can always type in `stripe --help` to see all the possible set of commands
provided by this tool. As for the configuration, the following are possible:

- Logging in with an existing API key. By default, a new API key is generated
  for the Stripe CLI. To use an existing API key instead, add the `--api-key`
  flag:

```bash
stripe login --api-key sk_test_key
```

- We can login to different projects by passing in the `--project-name` flag
  followed by the name of the project.

### Features

- Viewing real time API request logs from Stripe.

```bash
stripe logs tail
```

- We can make API requests directly through the Stripe CLI. Run
  `stripe resources` to see the complete list of resources available. Example:
  To create a `PaymentIntent`:

```bash
stripe payment_intents create --amount=19 --currency=eur
```

- Making raw API requests to the endpoints. This is same as invoking `curl`
  command, with the difference that we don't need to pass in the secret with
  each request.

```bash
stripe post /v1/payment_intents \
  -d amount=2000 \
  -d currency=usd \
  -d "payment_method_types[]=card"
```

## Testing webhooks locally

Stripe CLI allows us to listen, trigger, and forward webhook events from the
terminal.

So how does this come in handy? Say that in our application logic, we have a
webhook controller which invokes a worker when a particular webhook event is
received.

Say that the logic to generate such an event in our application is tightly
coupled with our front-end interactions.

Thus, if we want simulate such a webhook event, the only way is to trigger it
using `stripe-cli`.

But that alone is not good enough. Triggering only takes care of the part where
we initiate the webhook event.

Now we need to listen to that particular event in our server and invoke our
worker to perform further functionalities.

`stripe-cli` has solutions for all these scenarios. It comes packed with a lot
of goodies, which we will explore in the following sections.

### Listening for webhook events

Events are created only when specific actions occur at Stripe's end. So we might
not see any events until we make an API call or trigger an event directly.

This means, for example, the `checkout.session.completed` event is only
generated once we make successful payment from the Stripe hosted checkout page.

To listen to all events from stripe, we can execute the following command:

```bash
stripe listen
```

The `listen` command also allows us to filter events coming in to our CLI with
the `--events` flag.

This is useful if we only care about or want to test specific events. This flag
accepts a comma-separated list of events. In our case, we primarily only need to
track the checkout and subscription related events, like so:

```bash
stripe listen --events 'checkout.session.completed','customer.subscription.updated','customer.subscription.deleted'
```

### Triggering events

Sometimes we want to trigger a particular event without actually going through
the entire process of invoking that event.

Stripe can take care of some of the intermediatory steps and send the particular
event that we triggered and also it's associated events to our backend endpoint.

This is an example of how we can fake a `checkout.session.completed` event to
test locally:

```bash
stripe trigger checkout.session.completed
```

To check whether the trigger was successful, we could check the logs in the
shell where we invoked `stripe listen`, and check for the presence of a new
webhook event log.

### Forwarding events to server

When we are testing our applications locally, `stripe-cli` has no way of knowing
where or in which URL our backend server webhook endpoint is running. Thus we
need to explicitly forward to the webhook url like below code:

```bash
stripe listen --forward-to localhost:9001/webhook_events
```

### Configuring required events

We can configure from Stripe Dashboard, which all webhook events are to be sent
to our backend endpoint.

During live scenario, we should only send the necessary events, else it will
increase the load in our server.

Stripe contains a lot of webhook events. Remembering all of them is not
practical. Thus always refer the
[Stripe CLI wiki](https://github.com/stripe/stripe-cli/wiki/trigger-command#supported-events),
to view the list of supported events.
