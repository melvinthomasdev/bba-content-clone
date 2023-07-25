## General design for database

Database designs always vary from application to application. But when designing
a database to handle Stripe related functionalities, we can generalize some
parts in the schema. These can be cherry-picked into most of the applications
which make use of Stripe in the backend.

## Schema design for subscription

<image>designing-database-for-subscription.png</image>

## Conventions followed

- All `metadata` values should be stored as `jsonb` data. This would allow us to
  read the binary data when needed, in JSON format.
- We will denote fields representing ID's from Stripe with a `stripe_` prefix.
  Example: We have a `Subscription` table. Thus the ID for that table when
  referenced in other tables would be generally called `subscription_id`.
- Thus in order to avoid the confusion between distinguishing the ID that Stripe
  allots to subscription at Stripe's end and our backend ID, we prefix Stripe
  ID's like so `stripe_subscription_id`.
- Only the essential data, which needs to be often read and updated, needs to be
  stored as separate fields in a table. All other non-priority data can be moved
  into `metadata` field.

## User table

This user model will handle all customer specific details. Depending on the
business logic, the use case of the `email` field would vary, like so:

- In the cases where we only allow the user to subscribe once user is
  authenticated, this `email` would act as the authentication email. The email
  we provide in Stripe hosted checkout session can be stored separately in
  `BillingDetails` and can be considered as the `billing_email`.
- In the case where user can subscribe to product by making the payment rather
  than after logging in, we need to consider this `email` as both authentication
  as well as billing email.
- The reason is that we generate an email with default login credentials for
  user to log in once payment is successful. Thus we need to make use of this
  `email` to create those credentials.

Other than the `email` field, most often the rest of the fields would be
`Devise` specific fields, Stripe customer ID, Stripe customers currency, etc.
Rest of the stripe related data should belong in `metadata`.

## Subscription table

In most applications, the most straightforward way to allow access to our
product, would be to check the `status` field of a user's subscription, and
verify whether it's value is `active` or not.

The importance of `current_period_start` and `current_period_end` comes up if we
decide to show notifications to user when their subscription period will end and
stuff like that.

Other than these fields, there are few other fields which are needed to track
the cancellation of a subscription.

Both immediate and billing period end cancellation methods can make use of this
`Subscription` schema itself.

### Implementation

- Every `User` would have one `Subscription`. This is the most common scenario.
- The `status` field in subscription can be maintained as an `Enum` type in
  model. This would enable us to update the `status` much more easily in
  webhooks and all.
- The `default_payment_method` a field from Stripe will come in handy when the
  application is in a phase where it can accept payments from say
  google/apple-pay, etc. Thus that field is kept as nullable.

## Price table

The price model helps in tracking all products and prices the subscription
provides. Here, by products, we mean Stripe products.

The reason why we don't have a `Product` table is because the price is already a
unique identifier for a product from Stripe's perspective.

Thus we only need to keep track of the Stripe allotted product ID rather than
storing other details about the product.

Let's think about example UI's where let's say the user is trying to cancel an
existing subscription and we are trying to show a preview of the existing
subscription and related details before cancelling or even let's say that we are
trying to show the user what product they have subscribed to and what are the
features they get etc.

In that case, the `Price` model comes in handy. The `amount` and `description`
fields are pretty self explanatory for a table named `Price`.

Here the `label` field is used to help us identify the selected price model when
communicating between client and server as described in the "modelling
subscription" chapter.

### Implementation

- Depending on the business logic keeping `subscription_id` and
  `stripe_price_id` as composite unique index would be a good step in avoiding
  conflicts.
- If there are any important product related info, then storing them as
  `metadata` would do.

## BillingDetails table

So when making checkout payments, Stripe collects address and details like tax
info, card info, etc as part of the billing process. Let's focus on the address
part here.

The address can come in handy in cases where we want to say ship a product to
the user.

Thus the importance of the field `type` is to set the type of use case for the
address collected via billing details.

If the `type` is say `shipping`, then we need to provide the address. With other
`type`, depending on the business logic, we make association with address
optional.

### Implementation

- Each billing detail should have one optional association with the `Address`
  table.

## Address table

The `country` is mandatory whenever collecting address. The reason is that, from
Stripe's perspective, it will collect address depending on the location of the
payee.

In some locations, Stripe would only collect the `country`. But in some
locations it would try to collect more details.

For some regions address collection is mandatory from Stripe's end.

Thus even if we have provided an option to disable address collection or set it
to `auto`, then also `country` detail would be collected. All other fields in
this table are nullable.

### Implementation

- Sometimes the user might provide extra lines of info as part of the address
  collection. Stripe denotes them by `line1` and `line2`. We can store that in
  `metadata`.

## Discount table

The tricky thing about discounts is that, it can be applied to either a
subscription or a customer at Stripe's end.

Thus discount will have an association with both subscription as well as user
models.

Here we are tracking the `start` date that the coupon was applied and `end` date
which is required if the coupon has a `repeating` duration.

Since we can apply a promotion code to apply a particular discount, it is
essential to track the mapping between promo code and its corresponding
discount.

Thus we need its ID, which can be expanded, and store it into `promotion_code`
field. This field can be kept nullable.

### Implementation

- The discount table should optionally belong to a subscription or a user or
  both. It's optional because not in all cases does a subscription or user have
  a discount.

## Coupon table

All coupons ultimately apply a discount. Thus a coupon should belong to a
discount.

Here one of the key fields is the field named `valid`. It tracks whether the
coupon is currently valid or not.

So if we ever have to write a logic to apply a coupon, then the first thing we
need to do is check of validity. Other than that, all other fields are important
keys of the Stripe Coupon object. Except `currency` and `amount_off`, all other
fields are nullable.

### Implementation

- A coupon should belong to a discount. All discounts will have a coupon. Thus
  it can't be an optional association.

## WebhookEvents table

The whole idea of this table is to ensure idempotency to webhook events and also
to track failed webhook event processing.

So once the webhook event hits our backend webhook endpoint, we delegate the
processing and other heavy work to a worker. Thus we need to keep track of the
failed jobs.

Here the `state` field helps us to understand the progress of processing the
webhook event. It can take in values like `pending`, `processing`, `processed`,
and `failed`.

In the `failed` state we will also store the string error messages in the
`processing_errors` field, so that we can view or log it.

Other than that, the most important field is the `external_id` field, which we
will be using to check the idempotency. We can refer to the webhook section to
get a better idea about its handling.

### Implementation

- This table doesn't have any associations with other tables and works
  independently.
- The `state` field can be implemented as an `Enum` data type.
