## Modelling product and prices in Stripe

Let's say we have a product called **FitDiet** which includes customized meal
plans and exercises. We want to sell the following subscription plans to our
customers.

- Monthly standard plan worth $19
- Monthly pro plan worth $39
- Yearly standard plan worth $190
- Yearly pro plan worth $390

To model the above subscription plans in Stripe we will first need to create a
[product](https://stripe.com/docs/billing/prices-guide). Because of the way
Stripe works, we will create a single product called "FitDiet" and this single
product will have four pricing plans.

## Creating a product

We can create a product in Stripe via
[Dashboard](https://dashboard.stripe.com/test/products) or
[Product API](https://stripe.com/docs/api/products/create). For our application,
we will create a single product with four different prices in Stripe.

Log into stripe [Dashboard](https://dashboard.stripe.com/test). Then click
[products](https://dashboard.stripe.com/test/products) link and click on the
`Add product` button.

<image alt="Products">products.png</image>

Enter the product details along with `Monthly standard plan` pricing details as
shown below and save them: Here we will enter the product name and product
description and we will also provide information about the first pricing plan
which is the "Standard pricing" of $19 per month.

<image alt="Create a product">create_a_product.png</image>

Next, we will add a `Yearly standard plan`. To add a new price, click on the
`Add another price` button.

<image alt="Add a price">add_price.png</image>

Enter the pricing details as shown below and save them:

<image alt="Create a price">create_a_price.png</image>

To add `Monthly pro plan` and `Yearly pro plan` pricing to the `FitDiet` product
follow the same steps as mentioned above.

After creating the product and prices successfully in Stripe, store the
`product` and `price IDs` for later use. We can get it by navigating to the
product page in Stripe Dashboard as shown below:

<image alt="Product Details">product.png</image>

## Creating a product and prices via Stripe API

If we want to create products and prices using API then we need a Stripe
`API key` or `Secret Key` from the
[Stripe Dashboard](https://dashboard.stripe.com/test/apikeys). For our case,
the `API key` is `sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3`.

Now, let's see how we can send a `POST` request to create a
[product](https://stripe.com/docs/api/products/create) with name `FitDiet` and
`active` status.

```bash
$ curl https://api.stripe.com/v1/products \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "name"="FitDiet" \
> -d "active"="true"
```

Once the product is created successfully the response will contain product ID.
For our case the product ID is `prod_JJex2jDvjE1FT5`. Now we will create a
`Monthly standard plan` of price `$19` via
[create price API](https://stripe.com/docs/api/prices/create).

```bash
$ curl https://api.stripe.com/v1/prices \
> -u sk_test_51IUPamDdkrcdQOlhs2b...VV2OQeFjRe1004Oahe9N3: \
> -d "product"="prod_JJex2jDvjE1FT5" \
> -d "unit_amount"=1900 \
> -d "currency"="usd" \
> -d "recurring[interval]=month"
```
