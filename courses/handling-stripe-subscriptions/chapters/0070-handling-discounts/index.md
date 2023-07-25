## Applying discounts to a new subscription

We all must have seen `promotion codes` or `discount codes` like `FLAT5PROMO` or
`FLAT30` when we purchase things from e-commerce websites. They are used by
customers to get a discount on the total invoiced amount on their purchase.

In Stripe,
[coupons](https://stripe.com/docs/billing/subscriptions/coupons#creating-coupons)
and
[promotion codes](https://stripe.com/docs/billing/subscriptions/coupons#promotion-codes)
are two distinct entities. Coupons are a discount entity that is responsible for
reducing the total invoice amount charged to a customer when they buy a
subscription and these are not accessible to customers directly.

Promotion codes are customer-facing entities, that are accessible to customers
directly, and they are created on top of `coupons`. A promotion code can not be
created without a coupon.

We know it is a bit confusing, so let's first start by properly understanding
what `coupons` are.

### Coupons

Let's say, we want to give a `50%` discount to all new customers who will
subscribe to our plans mentioned in the
[Modelling product and prices in Stripe](/handling-stripe-subscriptions/modelling-product-and-prices-in-stripe)
section on their first subscription.

Coupons can be created with a percentage or a fixed amount discount. Coupons
that use `amount off` also need to pass a currency. This currency needs to match
the one on the price of the subscription for you to apply the coupon.

To apply a discount on a subscription we will first need to create coupons in
Stripe.

Now, the question is how we can create coupons in Stripe?

**Creating coupons**

We can
[create coupons](https://stripe.com/docs/billing/subscriptions/coupons#creating-coupons)
via **[Stripe Dashboard](https://dashboard.stripe.com/test/coupons)** or
**[Stripe API](https://stripe.com/docs/api#coupons)**.

Let's start creating coupon via **Dashboard**:

We have already registered for the Stripe account. Now, login to Stripe
[Dashboard](https://dashboard.stripe.com/test/dashboard) and then navigate to
[Coupons](https://dashboard.stripe.com/test/coupons) page.

<image>coupons.png</image>

Click on the **Create a test coupon** button and enter the details as shown
below:

<image>create_a_coupon.png</image>

We have our first coupon, let's see how we can create **promotion codes**.

### Promotion codes

[Promotion codes](https://stripe.com/docs/api/promotion_codes) are
customer-facing codes that are created on top of coupons and can be shared
directly with our customers.

For instance, we have a customer **Oliver** who wants to subscribe to our
**Monthly Standard Plan**. Let's see how we can create a promotion code in a
[Dashboard](https://dashboard.stripe.com/test/coupons).

Navigate to coupons Dashboard and click on the `First purchase discount` coupon.

We could see the `Promotion Codes` section and click on the
`Add a promotion code` button.

<image>add_promotion_code.png</image>.

Enter promotion code details as shown below and save it.

<image>create_promotion_code.png</image>

### Enabling promotion code in Checkout session

Let's say, we have a customer **Oliver** who wants to subscribe to our
`Monthly Standard Plan`. We want to give him an option to select a promotion
code on the
[Stripe checkout session](https://stripe.com/docs/billing/subscriptions/checkout)
page.

To understand how we can enable the selection of promotion code, let's see the
[API request](https://stripe.com/docs/api/checkout/sessions/create) we are
sending to create a checkout session in our application.

```bash
$ curl https://api.stripe.com/v1/checkout/sessions \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "payment_method_types[]"="card" \
> -d "line_items[0][price_data][unit_amount]"=1900 \
> -d "line_items[0][price_data][currency]"="usd" \
> -d "line_items[0][price_data][product]={{PRODUCT_ID}}" \
> -d "line_items[0][price_data][recurring][interval]=month" \
> -d "line_items[0][quantity]"=1 \
> -d "mode"="subscription" \
> -d "allow_promotion_codes"="true" \
> -d "success_url"="https://example.com/success" \
> -d "cancel_url"="https://example.com/cancel"
```

Now, the question is what this request is doing and what parameters we are
using? We need to pass parameter `allow_promotion_codes` with value `true` to
enable selection of promotion code on the Checkout Page and also we can refer
[create checkout session API](https://stripe.com/docs/api/checkout/sessions/create)
to get more understanding.

When Oliver subscribes, we will enable the selection of promotion code by
sending the
[create checkout session API](https://stripe.com/docs/api/checkout/sessions/create)
request as shown above.

<image>checkout_session_with_promotion_code.png</image>

Oliver has a promotion code `FIRSTSUBSCRIPTIONPROMO` that we have created in the
[Promotion Codes](#promotion-codes) section. Once he enters the promotion code,
we will see that the total amount invoiced is reduced by 50%.

<image>checkout_session_with_promotion_code_applied.png</image>

After, subscribing successfully Oliver will be charged `$9.5` immediately. But
for future months he will be charged `$19` because the coupon associated with
the promotion code `FIRSTSUBSCRIPTIONPROMO` has a duration `once` which means
coupon is applicable only for one time in a subscription.

## Applying discounts to an existing subscription

We have already discussed what are
[coupons](https://stripe.com/docs/billing/subscriptions/coupons#creating-coupons)
and
[promotion codes](https://stripe.com/docs/billing/subscriptions/coupons#promotion-codes)
in detail. Now, we will see how we can apply coupons to an existing
subscription.

### Applying coupons

Let's say, Oliver has subscribed to the **Monthly Standard Plan** without
discount on January 1, 2021, and he was billed `$19` immediately. He has also
paid recurring charges of the amount of `$19` for February, March, and April.
Our application **FitDiet** has got first `1000` subscribers, and we have
decided to give them a `10%` discount on the subscription for the upcoming 2
months.

First, we will need to create a coupon `Flat 10%`. We will follow the same steps
mentioned in the [create coupons](#creating-coupons) section to create it.

<image>flat_10_coupon.png</image>

After creating the coupon, navigate to the
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page and click
on the `Update subscription` button on which we want to apply the coupon.

<image>subscriptions.png</image>

After the subscription page is rendered successfully, click on `Add Coupon`
button and select `Flat 10%` coupon from the dropdown.

<image>add_10_coupon.png</image>

Once the coupon is applied successfully, we will see future invoice amount is
reduced to `$17.10` and then click on the `Update subscription` button.

### Applying promotion codes

Instead of applying a `Flat 10%` coupon directly to Oliver's subscription, we
will send him a promotion code `FLAT10PROMO`, so that he can apply it to his
subscription.

We will follow the steps mentioned in the
[promotion codes](/handling-stripe-subscriptions/handling-discounts#applying-discounts-to-a-new-subscription)
section to create it.

<image>flat_10_promotion_code.png</image>

We can apply promotion code on an existing subscription via
[subscription update API](https://stripe.com/docs/api/subscriptions/update)
only.

Let's see how Oliver can apply the promotion code to his existing subscription
via our application.

First, we will need to get the Stripe `API Key`, `Subscription ID`, and
`Promotion Code`.

To get Stripe API key `sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3`
follow the steps mentioned in the
[Setting up Stripe account](/handling-stripe-subscriptions/setting-up-stripe-account)
section.

To get `Subscription ID`, navigate to
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page, click on
the desired subscription and copy subscription ID.

<image>subscription.png</image>

To get `Promotion Code`, navigate to
[coupons](https://dashboard.stripe.com/test/coupons) page, click on the desired
coupon and copy `promotion code API ID`

<image>flat_10_coupon_details.png</image>

Now, let's see the
[subscription update API](https://stripe.com/docs/api/subscriptions/update)
request we are sending to apply promotion code via our application.

```bash
$ curl https://api.stripe.com/v1/subscriptions/sub_JJnCr4PJF6cZCb \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -X POST
> -d "promotion_code"="promo_1IhAIAHjDjtSi1tHPmjvLNxY"
```

## Applying discounts to a customer

Instead of applying
[coupon](https://stripe.com/docs/billing/subscriptions/coupons#creating-coupons)
to a subscription, we can apply it to a customer also.

Let's say, we have an existing customer Oliver. We have analyzed that he is a
valuable customer, and we have decided to give him a `$5` discount on his
purchases. We will create a coupon `Flat 5` in Stripe and will apply it to a
customer.

Now, we will create a coupon in Stripe with a 5% discount and duration
`forever`.

<image>create_flat_5_coupon.png</image>

Now, let's see how we can apply a coupon to a customer via
[Dashboard](https://dashboard.stripe.com/test/customers).

Navigate to [customers](https://dashboard.stripe.com/test/customers) page and
click on the customer on which we want to apply the coupon. After the customer
page is rendered successfully, click on the `Actions` button and then click on
the `Apply coupon` button.

<image>apply_coupon_to_customer.png</image>

Select the `Flat 5` coupon and then the coupon will be applied to a customer
successfully.

Now, let's create a new subscription for Oliver. Navigate to
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page and then
click on the `Create Subscription` button. Enter subscription details as shown
below.

<image>create_yearly_subscription.png</image>

We have selected **Yearly Standard Plan** worth of `$190/year` but the invoiced
amount is `$185`. Now, the question is why subscription amount is reduced?

Oliver is having `Flat 5` coupon so when we created a subscription for him that
discount also got applied to it. If we click on the `Override discount` button
then we will see a list of available coupons.

<image>applicable_coupons.png</image>

If we want to override the customer then we will need to select other coupons
from the list of available coupons.

When a coupon is added to a customer then it will be applied on all his future
recurring charges. For this reason, Stripe recommends adding coupons to
subscriptions, not customers, unless we want to discount all recurring charges
for a customer, even on subscriptions added later.

## Deleting discounts

We can delete coupons in Stripe via
[Dashboard](https://dashboard.stripe.com/test/coupons) or
[discount API](https://stripe.com/docs/api/discounts). However, deleting a
coupon does not remove the applicable discount from any existing subscription or
customer. Deleting a coupon prevents it from applying to future subscriptions or
customers, though.

### Deleting a subscription discount

Let's say we want to delete `FLAT 10%` via
[Dashboard](https://dashboard.stripe.com/test/coupons). This coupon is applied
to Oliver's **Monthly Standard Plan**. Navigate to
[coupons](https://dashboard.stripe.com/test/coupons) page and select the coupon
we want to delete. Click on the `Delete coupon` button as shown below.

<image>delete_subscription_coupon.png</image>

Let's verify whether the discount is still applied to Oliver's **Monthly
Standard Plan** or not? Navigate to
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page and click
on Oliver's subscription. We will see that the subscription next invoice amount
is still `$17.10`. Deleting a coupon does not remove the applicable discount
from Oliver's subscription.

### Deleting a customer discount

Let's say we want to delete customer discount `FLAT 5` via
[Dashboard](https://dashboard.stripe.com/test/coupons). This coupon is applied
to Oliver's **Yearly Standard Plan** worth `$190` and that's why Oliver has paid
`$185`.

Navigate to [coupons](https://dashboard.stripe.com/test/coupons) page and select
the customer coupon we want to delete. Click on `Delete coupon` button as shown
below.

<image>delete_customer_coupon.png</image>

Let's verify whether discount is still applied to Oliver's **Yearly Standard
Plan** or not? Navigate to
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page and click
on the Oliver's subscription. We will see that the subscription next invoice
amount is still `$185`. Deleting coupon does not remove the applicable discount
from Oliver's subscription.

<image>yearly_standard_subscription.png</image>
