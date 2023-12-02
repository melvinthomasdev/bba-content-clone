## Working with a subscription

## Subscription Lifecycle

In order to work with subscriptions, we first need to understand what exactly is
the flow of a successful or failed subscription. Once we understand the flow, we
can work on further steps like provisioning access to the products and so on.

### Successful subscription flow

The following is the flow of events for a successful subscription from the
implementation perspective:

- The subscription is created with status incomplete.
- An invoice is created with status open for the subscription.
- This first invoice is `paid`.
- The subscription status is set to `active` and the invoice status is set to
  `paid`.

At this point, it’s safe to provision your product for your customer.

### Failed subscription flow

The pseudo-code for a failed subscription flow looks like this:

- Payment fails for the initial checkout session based payment or automatic
  charge attempt.
- Has successful payment been made within 23 hours for the failed attempt?
- If the payment has been made, then Stripe updates subscription to be `active`
  and invoice to be `paid`.
- If no payment has been made, then Stripe updates subscription status to
  `incomplete_expired` and the invoice becomes void.
- If a first-time payment was made, then Stripe tries to automatically collect
  recurring payments for the subscription.
- After completing the above steps, Stripe tries to automatically attempt to
  invoice the customer on the recurring invoice dates associated with the active
  subscription.
- If payment fails for automatic attempts, then Stripe will update the
  subscription to `past_due` and attempt to recover payment based on the retry
  rules that we set in Stripe dashboard. We will discuss retry rules in the next
  section.
- If payment recovery fails, then we can cancel the subscription from our side
  using API calls.
- Or if we want to continue attempting to bill the customer every month, even
  when previous invoice payments have failed, then set subscription status as
  `unpaid` and don't cancel the subscription.

## Retrying failed payments

When a payment fails, Stripe retries collecting it according to the rules
defined under `Manage failed payments` in your
[Subscriptions and emails settings](https://dashboard.stripe.com/settings/billing/automatic).
Stripe doesn’t retry collecting payment:

- If the connected account is no longer attached (Connect only).
- If you can’t use the payment method.
- If you’re using bank debit methods. To avoid bank fees, Stripe doesn't retry
  invoice payments made with ACH debit, BECS debit, or SEPA debit.

We can choose the schedule of retries, or we can allow Stripe's Smart Retries
feature to optimize the schedule and number of retries.

First let's talk about Smart Retries.

Using machine learning, Smart Retries chooses optimal times to retry failed
payment attempts to increase the chance of successfully paying an invoice.

The Smart Retries feature attempts to retry the customer's charge up to four
times within a customizable period.

We can override this behavior, for all invoices, in our Dashboard's automatic
collection settings by disabling Smart Retries and defining our own custom retry
rules.

### Handling payment failures

**Prevent failed payments**

In order to avoid failures in payments due to problems with the already provided
payment info of the customer, Stripe provides us the option to send an email
regarding keeping payment info up to date.

We can send mail for two of the following cases by toggling either of them or
both in dashboard:

- Send emails about upcoming renewals - this email will be sent 7 days before a
  customer's subscription renews.
- Send emails about expiring cards - this email will be sent 1 month before a
  customer's card on file expires. If this feature is enabled and a card is
  added during the month of expiry, then the email will be sent within 24 hours.

We are also provided with the option to send a webhook event for upcoming
renewal events, before n-days of the renewal.

**Manage failed payments**

Stripe allows us to configure the steps we'd like to take when charging a
customer's payment method fails.

This is how the dashboard would look like:

<image alt="Manage failed payments">manage-failed-payments-billing.png</image>

We can delegate the retry logic to Smart Retries feature in Stripe or we can set
our own custom retry schedule which can be set to retry 1,3,5 or 7 days after
the previous attempt.

If the payment attempt or retries fail, then we toggle the option named
`Customer emails` to send email regarding card payment fails.

Another important setting over here is, what to do when all retries for a
particular payment fails. In that case for a subscription we can either leave
the subscription as is, mark as `canceled`, `unpaid`, or leave it `past_due`.
Similarly for an invoice, we can leave it as is or mark as `uncollectible`.

## Provisioning access to product based on subscription

The most straightforward way to provide customer access to a product from the
implementation perspective is to check whether the status of the subscription is
`active` or not.

We have to make use of Stripe webhook events like
`customer.subscription.updated` or `payment_intent.failed` to explicitly check
whether the subscription is still active or not, and orient our backend logic to
take into account the subscription status and allow access to the product.

If our application uses Stripe checkout, then we don't need to explicitly create
a subscription nor customer on Stripe end, since Stripe itself takes care of
that.

If we weren't using Stripe checkout, then we'd have to leverage both the
Subscription and Customer API's to complete the first-time payment process.

Which means, in this case, we would have to invoke the `create` API call using
these API's for creating the Customer as well as the Subscription during the
first-time payment process.

Steps to provision access to product for first time subscription, if using
Stripe checkout:

- Complete the checkout session from Stripe.
- Listen to the `checkout.session.completed` webhook event from Stripe.
- Check if the `status` of the subscription object received is `active` or not.
- If subscription `status` is `active`, then allow access to our product.

If not using Stripe checkout, then the steps are as follows:

- Create a new Customer at Stripe's end if not already exist.
- Create a Subscription for that Customer.
- Initiate the payment using Stripe elements.
- Once payment is successfully made Stripe will send a
  `payment_intent.succeeded` webhook event.
- Then check the subscription status from that webhook object and allow access
  to our product as we did during handling the checkout session webhook event.

## Upgrading and Downgrading Subscriptions

Let's take an example where Oliver uses monthly billed plans, where he uses a
$10 plan for half a month and then decides to switch to a $20 plan.

The first thing Stripe will check is whether the billing periods of the current
subscription and switched subscription are same or not.

If billing periods are same, then the invoice will be charged, with or without
prorations, on the same billing dates.

However, take the case where we switch the customer from a monthly plan to a
yearly plan.

In that case, the billing date is updated to the billing date of the switched
subscription.

So in the above scenario, where Oliver switched to another monthly plan itself,
the billing would only take place at the start of the next month, given that
both plans have same billing period.

In simpler terms, we have to pay the rest of the amount for switching to the
newly expensive plan only after the current month gets over, rather than
immediately.

There are two ways to bill Oliver during that switch:

- Bill the full amount of the new plan when a new invoice is generated. This
  means we don't need any proration behavior. From the implementation
  perspective, we can do this by setting `proration_behavior: 'none'` while
  switching the subscription.
- Or apply the proration explicitly and immediately. Here we need to set the
  proration behavior to always_prorate.

### How prorations work?

In Stripe, the term **proration** is used to denote the amount that needs to be
collected, when say switching from one plan to another.

In the above example, the customer upgrades from a $10 per month subscription to
a $20 subscription, and the customer is charged the prorated amounts for the
time spent on each option.

Assuming the change occurred halfway through the billing period, the customer is
billed an additional $5: -5 USD for unused time on the initial price, and 10 USD
for the remaining time on the new price.

The prorated amount is calculated as soon as the API updates the subscription to
a new plan. The current billing period’s start and end timestamps are used to
calculate the cost of the subscription before and after the change.

Let's take one more example to solidify our understanding on how a proration is
calculated by Stripe. Say Oliver subscribed to a $30 plan whose billing period
is 30 days.

Let's say that he used 1 day from that plan and is switching to a yearly plan
priced at $60.

Then stripe will charge him for the n-number of days he used the current plan,
using an amount calculated from the current plan and charge for the rest of the
m-number of days based on the pricing of the newly switched plan.

Here Oliver will be charged $1 for the 1-day he used in $30 plan and for the
rest of the 29 days, the amount will be calculated from $60 plan, and a final
bill will be generated either immediately or at the end of the current billing
period, depending on our configuration of the subscription.

We will take a look into how to configure the billing of a subscription in the
following sections.

### Attempting immediate payment

It can get confusing at times if we let Stripe decide the billing date when
switching between plans.

The sanest way to bill the customer during a switch is to immediately attempt
the payment.

Meaning, that if they're switching from a $10 plan to a $20 plan, then
immediately attempt payment for the prorated amount, without taking into
consideration the billing period.

Stripe does this automatically if the billing periods of the plans differ.

Example: If we switch from a monthly plan to an yearly plan, then payment will
be attempted immediately at the moment of switch.

But what if we want to switch from a monthly standard plan to a monthly pro
plan?

Usually Stripe will attempt the payment only at the next billing period. But
this can often create problems if the customers card declines payment during
next billing period.

So it's better to attempt immediate payment and make sure the customer is able
to pay for the features of the new plan.

In order to attempt immediate payment at all times, we need to set the proration
behavior to always invoice. From the implementation perspective, we need to set
`proration_behavior` to `always_invoice`.

### Previewing a plan before switching

Let's say that in our application, we are attempting immediate payment with
proration.

Therefore from a customer's point of view, it's essential to show them the
amount that they need to pay extra when switching to a more expensive
subscription plan.

We can preview the effects of switching a subscription, including a preview of
what proration will take place, by retrieving the upcoming invoice.

Because Stripe prorates to the second, prorated amounts can change between the
time they’re previewed and the time the update is made.

To ensure that the actual proration is calculated exactly the same as the
previewed proration, we should pass a proration date, which should be the
DateTime at which we make the API call to retrieve upcoming invoice, parameter
when doing the actual subscription update.

The recommended way to get only the prorations being previewed is to consider
only the items whose starting period is same as the subscription proration date,
of the upcoming invoice object.

### Steps to switch the subscription

The following is the pseudo-code for switching to another subscription:

- Retrieve the subscription details using the subscription ID(subId), which will
  most probably be associated with the `current_user` in DB.
- Now invoke the subscription update API:
- Set the `proration_behavior` to `always_invoice` for immediate payment
  attempt.
- Set the `items` to the ID of the `items` data in the retrieved subscription
  and the `price` to be the ID of the new price to be switched to.
- Await the response from Stripe webhook for the event
  `customer.subscription.updated` and check the `status` of the subscription
  object. If `status` is `active`, then we have switched the subscription.
