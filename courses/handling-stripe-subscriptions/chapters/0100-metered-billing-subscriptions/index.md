## What exactly is metered billing?

In this, customers are charged on the basis of their consumption. For example,
we have an email SaaS business like `Twilio`, in which customers are charged on
the basis of the total emails they have sent at the end of the month. Like other
subscription models, in
[metered billing](https://stripe.com/docs/billing/subscriptions/metered-billing)
we will need to define our product and prices.

## Modelling product and prices

Let's say, we have an application called **Emailio**, and we have a product
called **EmailService**. We want to sell following email subscription plans to
customers:

- Basic option
  - Tier one: 15 USD per month for 2,000 emails.
  - Tier two: An additional 0.00100 USD for each email after 2,000.
- Premium option
  - Tier one: 75 USD per month for 10,000 emails.
  - Tier two: An additional 0.00075 USD for each email after 10,0000.

Let's see how we can create a product in Stripe.

### Creating a product

Let's start creating product in `test mode` via
[Dashboard](https://dashboard.stripe.com/test/products):

Log into stripe [Dashboard](https://dashboard.stripe.com/test). Then, navigate
to [products](https://dashboard.stripe.com/test/products) page and click on the
`Add product` button.

<image>products.png</image>

Enter the product details along with `Basic option` pricing details as shown
below and save them:

<image>create_email_product.png</image>

<image>email_basic_pricing.png</image>

Now, let's see how we can add `Premium option` pricing in the `EmailService`
product.

### Creating a price

Like products, we can also create prices via
[Dashboard](https://dashboard.stripe.com/test/products) or
[Prices API](https://stripe.com/docs/api/prices/create)

Let's navigate to the products dashboard and click on the **EmailService**
product. Now, to add a new price, click on the `Add another price` button. Enter
the pricing details as shown below and save them:

<image>create_email_premium_price.png</image>

After creating the product and prices successfully in Stripe, store the
`product` and `price IDs` for later use. We can get it by navigating to the
product page in Stripe Dashboard as shown below:

<image>email_product.png</image>

### Creating a product and prices via Stripe API

Before diving deep, we will need to get Stripe's `API key` or `Secret Key` from
the [Stripe Dashboard](https://dashboard.stripe.com/test/dashboard). For
example, our account has `API key` or `Secret Key` with value
`sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3`.

Now, let's see how we can send a `POST` request to create a
[product](https://stripe.com/docs/api/products/create) with name `EmailService`
and `active` status.

```bash
$ curl https://api.stripe.com/v1/products \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "name"="EmailService" \
> -d "active"="true"
```

Once the product is created successfully, copy product ID like
`prod_JMSinqTga2GPAW` from the above API response. After this, we will create a
`Basic option` with `$15` per month for 2,000 emails and an additional
`$0.00100` for each email after 2,000 using
[create price API](https://stripe.com/docs/api/prices/create) with the
parameters as shown below:

```bash
$ curl https://api.stripe.com/v1/prices \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "product"="prod_JMSinqTga2GPAW" \
> -d currency=usd \
> -d "tiers[0][flat_amount]"=1500 \
> -d "tiers[0][unit_amount_decimal]"=0 \
> -d "tiers[0][up_to]"=2000 \
> -d "tiers[1][unit_amount_decimal]"=0.100 \
> -d "tiers[1][up_to]"=inf \
> -d tiers_mode=graduated \
> -d billing_scheme=tiered \
> -d "recurring[usage_type]"=metered \
> -d "recurring[interval]"=month \
> -d "expand[]"=tiers
```

Now, we will create another pricing for `Premium option` as shown below:

```bash
$ curl https://api.stripe.com/v1/prices \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "product"="prod_JMSinqTga2GPAW" \
> -d currency=usd \
> -d "tiers[0][flat_amount]"=7500 \
> -d "tiers[0][unit_amount_decimal]"=0 \
> -d "tiers[0][up_to]"=10000 \
> -d "tiers[1][unit_amount_decimal]"=0.07500 \
> -d "tiers[1][up_to]"=inf \
> -d tiers_mode=graduated \
> -d billing_scheme=tiered \
> -d "recurring[usage_type]"=metered \
> -d "recurring[interval]"=month \
> -d "expand[]"=tiers
```

We have successfully modelled product and prices in Stripe, let's understand how
subscription is created for `metered billing`.

## Metered billing subscription

With metered billing, customers are charged on the basis of their usage at the
end of the subscription cycle. Let's first understand how `usage` is calculated
in Stripe.

### Usage recording and billing

We need to record customer usage in our application. Then we create
[usage records](https://stripe.com/docs/billing/subscriptions/metered-billing#reporting-usage)
for each customer in Stripe. Stripe adds them at the end of each billing cycle
to determine how much to bill for.

Stripe can calculate usage records in various ways. We have selected
`Charge for metered usage by` with option `Sum of usage values during period`
while creating prices in the [Creating a price](#creating-a-price) section, and
it is a default value when usage is `metered`.

`Sum of usage values during period` means that Stripe will sum all the usage
records at the end of billing cycle. For example, we have a customer **Oliver**
who has subscribed to our `Basic option` on _April 24, 2021_. We will record his
usage in Stripe on weekly basis using the
[usage records API](https://stripe.com/docs/api/usage_records/create#usage_record_create-action).
Let's assume following is the usage details of Oliver for 4 weeks:

- Week 1: 200 emails usage recorded.
- Week 2: 500 emails usage recorded.
- Week 3: 1000 emails usage recorded.
- Week 4: 2500 emails usage recorded.

Now Stripe will check the usage records for the customer Oliver and bill him
accordingly. Total quantity is 4200 and for `Basic option` he will be charged
flat `$15` for the `2000` emails and `$2.2` for the `2200` emails. So the total
amount charged to him will be `$17.2`.

Now the question is what will happen if no usage is recorded for Oliver. He will
be only charged subscription flat amount that is `$15`.

There are other options in Stripe to calculate usage. Let's discuss them in
detail:

- `Most recent usage value during period`: If this usage type is selected while
  creating the price then Oliver will be charged on the basis of week 4
  recording. He will owe `$15.2`.
- `Most recent usage value`: Let's assume no usage is recorded for the billing
  cycle _May 24, 2021,_ to _June 24, 2021,_ for Oliver, and we have selected
  this option while creating the price. Then, Stripe will check the most recent
  usage recorded until now and in this case it will be week 4, then Oliver will
  owe `$15.2`.
- `Maximum usage value during period`: In this the total bill is calculated on
  the usage record with the largest usage quantity for the billing period. In
  week 4, maximum usage is recorded for Oliver, so he will be charged `$15.2`.

Let's see how we can create subscription of Oliver via
[Dashboard](https://dashboard.stripe.com/test/subscriptions) with default usage
type.

### Creating a subscription

Navigate to [subscriptions](https://dashboard.stripe.com/test/subscriptions)
page and then click on the `Create Subscription` button. Enter subscription
details as shown below and save them.

<image>create_metered_subscription.png</image>

We have selected **Basic option** and the invoiced amount will be calculated on
the basis of usage as shown in the _Invoice Summary_ section.

Now navigate back to
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page and open
the above created subscription. We will see the next invoice billing amount as
`$15` because no usage is recorded for Oliver till now.

<image>metered_billing_usage.png</image>

Also, copy the subscription item ID as shown below for later use.

<image>subscription_item_id.png</image>

### Reporting usage via API

We have already subscribed Oliver to the `Basic option`. Let's see how we can
record his usage for the first week from our application using the
[usage records API](https://stripe.com/docs/api/usage_records/create#usage_record_create-action).

But before diving deep, let's first understand how we will tell Stripe that the
price is configured with `aggregate_usage=sum` and that we want to write usage
as it occurs. We will pass parameters `action` with default value `increment`
and `timestamp` with value `1619340726`.

Following is the POST request that we will be sending from our application:

```bash
$ curl https://api.stripe.com/v1/subscription_items/si_JMUVMwb0jAMFZ2/usage_records \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -X POST \
> -d quantity=100 \
> -d timestamp=1619340726 \
> -d action=increment
```

After successfully reporting usage, we will navigate back to
[subscriptions](https://dashboard.stripe.com/test/subscriptions) page and open
the subscription for which you want to see the usage details and click on
`View usage` button.

<image>view_usage.png</image>

We will see the current usage events as shown below:

<image>current_usage.png</image>
