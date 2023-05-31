## Cancelling a subscription

In our application, the ability to cancel a subscription should be authorized to
only users who have logged in.

From the user's perspective cancelling the subscription means that they don't
want to spend any more money on our product.

Access to our product is purely based on the existence of an active
subscription.

Thus after cancellation, we'd be disallowing the user, the access to the
application itself.

We can also, based on the business logic, disallow the user to login from then
on, until they re-subscribe.

Let's say that in the following examples, we need to disallow users from logging
in until they re-subscribe.

## Ways to cancel a subscription

### Immediate Cancellation

Immediate Cancellation is the most straightforward way to cancel a subscription.

When the user clicks the `cancel subscription` button, we need to immediately
cancel the subscription at Stripe end and also disallow the user access to the
product.

As soon as a customer's subscription is canceled, no further invoices are
generated for that subscription.

We can configure the cancellation to prorate if the cancellation is done in
between a paid billing period and optionally invoice for any outstanding
prorations and metered usage.

If we don't choose to apply either of those, then all metered usage is discarded
and the customer will not be credited for any potential prorations.

For prorating and invoicing during cancellation, Stripe allows us to pass in
`prorate` and `invoice_now` parameters while making the API call.

In simpler terms, in our application, when immediately cancelling a
subscription, we won't be crediting any cash back to the customer, even if
they're only a few days in through the subscription period.

This is to avoid a lot of hassle, like making sure that the prorated amount from
our end is getting credited to the customer's bank, handling credit scenarios
where they might've made payment through google/apple pay, etc.

**What happens at Stripe end?**

When we cancel the subscription immediately, at Stripe's end the subscription
moves to cancelled state, but the customer details will remain. We can make
further API calls to actually delete the customer as a whole too.

Since Stripe retains the customer transaction details, subscription activation
period details, payment details etc, keeping the customer object intact in
Stripe can be beneficial in the long run and for future applications like say
running analytics on the customer data or even providing discounts to customers
based on their activity/credit-score when they resubscribe, etc.

**Reflecting changes in our Database**

Note that, we will be discussing in detail how to handle webhooks in the
upcoming chapters.

When the subscription is cancelled at Stripe's end, Stripe will send a
`customer.subscription.deleted` webhook event.

We need to catch that event and find the corresponding DB subscription object,
based on `stripe_subscription_id`.

Once we have the DB subscription object reference, set the `status` as
`canceled`.

Again, if we notice, we are not deleting the `User` details.

We keep those details in our backend for future use cases like creating an admin
dashboard to show graphs and other stats related to the user base.

Also another, often missed out point is that Stripe uses the keyword `canceled`
over `cancelled` for marking an entity as cancelled, based on American English.
So when storing such data in our DB, we need to make sure we store it exactly
like how Stripe sends it to avoid further confusion during manipulation.

**Steps to cancel**

- From the client we only need to send the subscription ID to backend.
- Find the subscription object based on that ID.
- Invoke the Stripe subscription `delete` API call passing in the
  `stripe_subscription_id` from the subscription object.
- Await cancellation the webhook event to reflect other changes like updating
  the `status` of the subscription in the DB.

### Cancellation at end of billing period

Stripe also allows us to cancel a subscription at the end of the billing period,
which is the duration of time the customer has already paid for.

In order to perform this action from the implementation perspective, we need to
update the Stripe subscription with `cancel_at_period_end` value of `true`.
Rest, Stripe will take care.

**What happens at Stripe end?**

When we cancel the subscription at end of the billing period, the customer will
have an active subscription till the end of the billing period.

If it was a monthly plan and they cancelled this way during halfway, then the
customer's subscription will be active till the end of the month.

One point to note is that when a subscription has been scheduled for
cancellation at end of the billing period, it can be reactivated at any point up
to the end of the period by disabling cancellation at period end for that
subscription.

All the pending proration amounts, if any, are charged automatically, in a final
invoice when the subscription cancels at the end of the billing period.

**Reflecting changes in our database**

The DB handling can be done in a very similar fashion to how we do it during
immediate cancellation, except that we have an additional step, which is
updating the `cancel_at_period_end` to `true` in the corresponding subscription
`metadata`.

A `customer.subscription.updated` event is immediately triggered once we
initiate the Stripe API call. That event reflects the change in the
subscription's `cancel_at_period_end` value.

When the subscription is actually canceled at the end of the period, a
`customer.subscription.deleted` event occurs.

**Steps to cancel**

- Repeat the first steps we followed during immediate cancellation.
- Invoke the Stripe subscription `update` API call passing in the
  `stripe_subscription_id` from the subscription object, and also set the key
  `cancel_at_period_end` as `true`.
- Await the webhook event to reflect other changes like updating the `metadata`
  of the subscription in the DB and finally provisioning access to the product
  for the corresponding user.

## Automatic cancellations by Stripe

Stripe sends a `customer.subscription.deleted` event when a customer's
subscription is canceled immediately.

If the `customer.subscription.deleted` event's request property isn't null, that
indicates the cancellation was made by our request, as opposed to being done
automatically based upon our subscription settings.

Cases that trigger automatic cancellation:

A subscription may cancel automatically after up to four unsuccessful attempts
to bill the customer.

Once the customer has an active subscription, stripe will try to bill the
customer based on the billing interval.

But Stripe does have a retry limit on the attempts to bill the customer. This
retry limit can be set in billing settings from Stripe dashboard itself, as we
had discussed in chapter 3.

When a customer disputes a charge for a subscription, the subscription continues
to cycle, which can create more disputed charges.

A dispute, also known as a chargeback, inquiry, or retrieval, occurs when a
cardholder questions our payment with their card issuer.

But we can configure Stripe to cancel the subscription immediately or at the end
of the billing period from Stripe dashboard billing settings.

The following are the billing settings available for handling disputes:
<image>manage-disputes-billing.png</image>

If we have set such a configuration to cancel immediately, then Stripe will
automatically cancel the subscription in cases where such disputes are raised.

If we want time to work through the dispute process before the cancellation
occurs, then we can make subscription only cancel at end of billing period by
setting `cancel_at_period_end` to `true`.

It's preferred to cancel the subscription immediately in cases of disputes, such
that we can mark that customer as the one who disputed and disallow access to
product.

## Resubscribing after cancellation

### For cancelling immediately

From the perspective of the business logic of our application, where email and
payment info are the only entities that are needed during subscription:

- The customer needs to go through the checkout process once again and make the
  payment as if it's done for the first time.
- It will be like a fresh start from the customer's perspective, but we will
  have historical data of that customer in Stripe end as well as in our backend.
- An email with the default credentials will be sent to the user's email, once
  we make sure that the payment has been made with the help of webhook events.

### For cancelling at period end

We need to first finalize our business logic to make sure whether the user can
resubscribe during the period of cancellation.

Example: If the user cancels a monthly plan halfway through the month and tries
to resubscribe after like 4 days of cancellation, then we can restart the
existing subscription without any hassle.

If we plan to disallow the user from re-subscribing once they initiate a
cancellation request, then we could send an email saying that re-subscription is
only possible after a particular date, which would be the date when subscription
gets cancelled.

The above plan is pretty useless.

The whole point of cancellation at period end is to provide an opportunity for
the customer to resubscribe before plan gets cancelled.

To reactivate the subscription, we should update the subscription by making it
not cancel at end of billing period ie: setting the value of
`cancel_at_period_end` to `false`.

From the application perspective once user enters a valid email, where that
email has an associated subscription that has been initiated to cancel at end of
billing period, but hasn't been cancelled yet, then we could send a mail to the
provided email with a confirmation on whether they actually want to resubscribe.

If they confirm, we could change subscription to not cancel at end of billing
period by setting `cancel_at_period_end` to `false` for that user's
subscription.

## Summary from application perspective

Here we are going to list out the summary of steps that can be taken in an
example application while cancelling a subscription.

Users can cancel their subscription at any point in time. In the application,
cancellation of subscription should disallow users from accessing the product
and its features.

We preserve historical data in both Stripe end as well as in our own backend for
future applications like analytics.

We make use of immediate cancellation without crediting any prorations back to
the customer. We make use of the webhook events, like
`customer.subscription.{deleted, updated}`, to reflect changes in our database.
