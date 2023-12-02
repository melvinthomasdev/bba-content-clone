We can refund charges made to our account, either in whole or in part. Refunds
use our available Stripe balance – this doesn’t include any pending balance. If
our available balance doesn’t cover the amount of the refund, Stripe debits the
remaining amount from our bank account.

If Stripe can’t debit the remaining amount from our bank account, our refunds
may go into a pending status until we add funds to our Stripe balance. We can
view a list of all your pending refunds in the Dashboard.

## Issuing refunds

Refunds can be issued using the `API` or the `Stripe Dashboard` and are
processed immediately. Once issued, refunds can’t be cancelled.

We can issue more than one refund against a charge, but you can’t refund a total
greater than the original charge amount.

**Using Dashboard**

Let's start issuing a refund using the **Dashboard**.

First, we need to go to the payment to be refunded on the
[payments overview](https://dashboard.stripe.com/payments) page. Select the
payment we need to refund and click on `Refund`.

<image alt="Refund Payment">refund.png</image>

By default, full refund will be issued. For a partial refund, we can enter a
different amount. Select a reason for the refund and click `Refund`.

<image alt="Issue Refund">issue_refund.png</image>

**Using API**

To refund a payment using the `API`, we have to create a `Refund` and provide
the ID of the `charge` or `PaymentIntent` to be refunded.

Let's see how can we create a `Refund` using
[Stripe Refund API](https://stripe.com/docs/api/refunds/create).

```bash
curl https://api.stripe.com/v1/refunds \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d charge=ch_3KtYTl2eZvKYlo2C0YIS3rgI
```

Note, in a scenario where status of `PaymentIntent` is `requires_capture`, we
can't process a refund. Instead, we need to cancel the `PaymentIntent`.

## Cancelling a PaymentIntent

We can cancel a PaymentIntent if we no longer intend to use it to collect
payment from the customer. Cancelling a PaymentIntent is optional, and it’s okay
to keep a PaymentIntent in an incomplete status like `requires_confirmation` or
`requires_payment_method`. Incomplete PaymentIntents are useful in understanding
the conversion rate at checkout.

A PaymentIntent can only be cancelled when it has one of the following statuses:
`requires_payment_method`, `requires_capture`, `requires_confirmation`, or
`requires_action` – a PaymentIntent can’t be cancelled while it’s actively
processing or after it has succeeded.

Let's see how we can cancel a `PaymentIntent` using the
[cancel API](https://stripe.com/docs/api/payment_intents/cancel).

```bash
curl https://api.stripe.com/v1/payment_intents/pi_3JPjdsLyyYrd44Ag1uGEWz9d/cancel \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -X POST
```
