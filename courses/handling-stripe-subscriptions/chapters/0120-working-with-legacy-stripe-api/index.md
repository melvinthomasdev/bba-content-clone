## Legacy Stripe API

As Stripe builds technology to support the future of payments, some of its older
APIs are no longer recommended and often deprecated.

Thus for a project which makes use of Stripe API, it's essential to upgrade or
update the logic used, when Stripe updates its APIs.

## Older APIs

The following are the APIs which are unsupported from Stripes side:

- Charges
- Sources
- Orders

## Alternatives For Legacy APIs

If we plan to upgrade the Stripe APIs from legacy to latest, then the following
modern alternatives can be used:

- To replace `Charges`, make use of either Stripe Checkout or migrate to Payment
  Intents API.
- To replace `Sources`, make use of Payment Methods API.
- To replace `Orders`, we don't have a direct replacement API from Stripe. But
  we can build the order API logic in house by availing the `TaxRates`,
  `Discounts`, `Checkout`, `PaymentIntents`, etc. `Orders` is a combination of
  these APIs.

## Backward Compatible Changes

Stripe considers the following changes to be backwards-compatible:

- Adding new API resources.

- Adding new optional request parameters to existing API methods.

- Adding new properties to existing API responses.

- Changing the order of properties in existing API responses.

- Changing the length or format of opaque strings, such as object IDs, error
  messages, and other human-readable strings. This includes adding or removing
  fixed prefixes such as ch\_ on charge IDs.

- Adding new webhook event types.

## API Changelog

The changelog is a list of backwards-incompatible updates in the Stripe API.

As described above, new additions and forward-compatible changes don’t need a
new API version and thus will not appear in this list.

As an example, let's take a look at the latest `2022-11-15` release's changelog:

- Charge no longer auto-expands refunds by default. You can expand the list but
  for performance reasons we recommended against doing so unless needed.
- The `charges` property on PaymentIntent has been removed. You can use the
  `latest_charge` property instead.

The API changelogs for each Stripe API version, can be found in more details in
their [API changelog section](https://stripe.com/docs/upgrades#api-changelog).

## API upgrades

## Stripe API upgrade policy

Stripe upgrades APIs in either backward-compatible or backward-incompatible way.
When Stripe changes the API in a backwards-incompatible way, Stripe releases a
new dated version, but to avoid breaking our code, it doesn’t change our version
until we’re ready to upgrade.

## Setting API version

The API version for the account gets set only during the first time we make a
Stripe API call.

When making the API calls we need to set the `Stripe-Version` header, to specify
the API version. But in order to make this process more streamlined and to
override the API version, assign the version to the `Stripe.api_version`
property when initializing the `Stripe` library in our backend.

In Rails, create a `config/initializers/stripe.rb` and add the following:

```
Rails.configuration.stripe = {
  publishable_key: ENV['stripe_secret_key'],
  secret_key: ENV['stripe_publishable_key']
}

Stripe.api_key = ENV['stripe_secret_key']
Stripe.api_version = '2022-11-15'
```

We can view the current API version by visiting the Stripe dashboard's
`Developers` tab, which in test mode would be in
[the developer test tab](https://dashboard.stripe.com/test/developers):
<image>dashboard-api-version.png</image>

The API version settings are set to our account. Our API version gets set the
first time we make a Stripe API request.

When performing an API upgrade, make sure that you specify the API version, like
mentioned above, that you're integrating against in your code instead of relying
on your account's default API version.

## Entities Affected By API Upgrade

After upgrading the API, the API calls we make without providing the
`Stripe-Version` header, will resolve to sending back responses in concurrence
with last set or default Stripe API version.

The upgrade has a definite chance of affecting the structure of objects received
with `Stripe.js` methods, in front-end side.

Similarly, the structure of objects sent to your webhook endpoints will also be
affected.

If an endpoint has an explicit version set, then webhook endpoints will remain
unaffected.

Automated Billing operations performed by Stripe, like generating an invoice for
a new subscription period, use our account's default API version.

## Reflecting Changes In Webhook Handlers

The first step in updating our webhook handlers to reflect the changes with
Stripe API upgrade, is to check the API changelog to see which objects will be
structured differently.

Once we have a good idea about which all properties in the response objects has
been updated, we then need to update our webhook code to handle both the old and
new version of each object.

Finally trigger the event in test mode and validate that your code works for the
new structure.

## Rolling Back API Version

For 72 hours after you’ve upgraded your API version, you can safely roll back to
the version you were upgrading from in your Dashboard.

The API version can be changed under the developer's tab in Dashboard, as we had
already mentioned in [setting API version](#setting-api-version) section in this
chapter.

After you've rolled back, webhooks that were sent with the new object structure
and failed will be retried with the old structure.

## How To Stay Informed?

Stripe sends information on new additions and changes to Stripe's API and
language libraries in the Stripe Developer Digest.

We can subscribe to it in the [Stripe developer website](https://stripe.dev/),
by providing the email, in the field, which is usually at the bottom of the
page:
<image>stripe-developer-digest-newsletter.png</image>
