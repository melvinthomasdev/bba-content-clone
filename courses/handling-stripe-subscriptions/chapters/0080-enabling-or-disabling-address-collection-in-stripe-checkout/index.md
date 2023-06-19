## Enabling or disabling address collection in Stripe Checkout

[Stripe Checkout](https://stripe.com/docs/payments/checkout) can be customized
in various ways. We can customize the look and feel of Checkout, show policies
and contact information, localize the language of the Checkout page. To get more
understanding on customization refer
[Stripe documentation](https://stripe.com/docs/payments/checkout/customization).

We have already discussed Stripe Checkout in this
[chapter](/handling-stripe-subscriptions/accepting-payments-using-stripe#stripe-checkouts).
Now, we will discuss how we can enable or disable address collection in
Checkout.

Here is the [API request](https://stripe.com/docs/api/checkout/sessions/create)
we are sending to create a checkout session in our application.

```bash
$ curl https://api.stripe.com/v1/checkout/sessions \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "payment_method_types[]"="card" \
> -d "line_items[][quantity]"=1 \
> -d "line_items[][price]"="price_1N8zXtS..." \
> -d mode=subscription \
> -d success_url="https://example.com/success" \
> -d cancel_url="https://example.com/cancel"
```

Now, the question is how we can enable or disable address collection?

Stripe Session Checkout create
[API](https://stripe.com/docs/api/checkout/sessions/create) supports parameter
`billing_address_collection`, its default value is `auto`, and it means that
Checkout will only collect the billing address when necessary.

Let's say the above API request is sent without `billing_address_collection`
parameter. Now, when a Checkout page is rendered we will only see the country or
region field as shown below:

<image>checkout_session_without_address.png</image>

To enable address collection of customer's billing address we will need to pass
`billing_address_collection` parameter with value `required` as shown below:

```bash
$ curl https://api.stripe.com/v1/checkout/sessions \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "payment_method_types[]"="card" \
> -d "billing_address_collection"="required" \
> -d "line_items[][quantity]"=1 \
> -d "line_items[][price]"="price_1N8zXtS..." \
> -d mode=subscription \
> -d success_url="https://example.com/success" \
> -d cancel_url="https://example.com/cancel"
```

When a checkout session page is rendered we can see the address field as shown
below:

<image>checkout_session_with_address.png</image>

To disable address collection we will either need to pass
`billing_address_collection` parameter with value `auto` or send API request
without it.

## Limitations

Stripe restricts enabling or disabling of the address collection based on our
Stripe account country. We can see our account details via
[Dashboard settings](https://dashboard.stripe.com/settings/account) as shown
below:

<image>account_settings.png</image>

Let's assume Stripe account's country is `India`. When customer checkouts to the
session page, collection of address details is mandatory which means even if we
pass `billing_address_collection` with the value `auto`, then also a customer
will ask to enter billing address details.
