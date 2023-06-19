## Accepting payments using stripe

Stripe allows two ways to accept payment online. Either we can send the customer
to some other page where the customer can make the payment or the application
can host the page itself.

[Stripe Checkout](https://stripe.com/docs/payments/checkout) allows us to send
customers to a stripe-hosted page.

[Stripe Elements](https://stripe.com/en-in/payments/elements) provides us with
the necessary tools to host the checkout page in the application itself.

Both the solutions have their own advantage and disadvantages. Let's look at
these two solutions more closely.

## Stripe Checkouts

[Stripe Checkout](https://stripe.com/docs/payments/checkout) allows us to send
our customers to a Stripe-hosted checkout page.

### Features

- Works out of the box on mobile devices with a responsive UI.
- Works out of the box on all platforms since Stripe has tested it on various
  platforms.
- Accepts different kinds of cards, with localized support for further actions
  during payment like SCA, 3D-secure, etc based on location.
- Supports google pay, apple pay, etc and its presence can be controlled using
  the stripe checkout API itself.
- Allows basic level customization and branding on the page.
- Real-time card validation and built-in error messaging system.
- Allows applying discounts, collecting taxes, addressing auto-completion, etc.
- The brand name of Stripe gives peace of mind to the folks who already know
  about Stripe.
- Since this page is hosted by Stripe it is considered very secure.

### Things to watch out for

The Stripe-hosted checkout page does not allow customers to change their email
to prevent duplication of subscriptions from being created by accident for
existing customers and prevent unexpected updates to the `customer` object
during Checkout but allows the creation of customers with the same email
address. This could be a problem in some cases. Let's take an example.

Say our app determines customer's access to our product based on whether the
payment has been made or not. Customer do not need to register or create an
account to make the payment. The customer provides the email address and credit
card information and a payment is made.

Currently, the customer has access to our product. Later the customer cancels
the subscription, thus disallowing access to the product since only actively
subscribed customers will have access to the product. Thus we can use this email
to uniquely identify a customer.

So what happens the next time the customer tries to re-subscribe? If the
customer provides the same email on the Stripe checkout page, then a new
customer will be created, with that same email, in Stripe.

This action will store two customers at Stripe's end, where one is already in
cancelled state and the other one is in an active state, and both will have the
same email. This is the way Stripe handles customer creation on the checkout
page.

But this can cause a lot of confusion given that email is often considered as a
unique entity, which is used to uniquely identify a customer, in most backend
operations.

This shows that we have to implement a strategy, in order to avoid creating
multiple customers with the same email at Stripe's end. Let's try to devise a
strategy that can overcome this hurdle in the least complicated manner.

As the first line of defense, we need to figure out whether the customer is
subscribing for the first time or not. Why? Because if the customer is
re-subscribing, then there would already be an existing customer object at
Stripe's end. If it's the first time, there won't be any such customer at
Stripe's end.

If the customer is subscribing for the first time, then a checkout session can
be created by providing the email that the customer had provided. We will look
into how to implement a checkout session in this manner in the upcoming section.

This will ensure that Stripe automatically pre-populates the email field in the
Stripe hosted checkout page and disables it, such that the customer can't change
the email from the hosted checkout page.

If the customer is re-subscribing then we don't need to create a new customer at
Stripe's end. Rather we can tell stripe that the current customer is same as the
one already in Stripe, since their emails are same.

We can let Stripe know that the current customer is the same as the one already
existing at Stripe's end by passing `Stripe's Customer ID` when creating the
checkout session itself. We will look into the implementation details in the upcoming section regarding this case.

Another caveat is that the amount of customization that we can do on the Stripe
hosted checkout page is limited to a few buttons and colors. So branding is also
limited.

### Steps to create a checkout session

- At client side we need to install the npm package
  [stripe-js](https://github.com/stripe/stripe-js), and in backend, depending on
  our stack, the corresponding official library needs to be setup.
  ```bash
  # client side
  yarn add @stripe/stripe-js
  # server side for Rails, add the following into Gemfile and do bundle install
  gem "stripe"
  # server side for Node.js
  yarn add stripe
  ```
- The next step is initialization. During the initialization step, we need to
  provide the API key and secret to the stripe object, which can be exported and
  used for all stripe related operations. For `Rails` in
  `initializers/stripe.rb`, add the following content:

  ```ruby
  # Here we are using the Figaro gem to handle env variables
  Rails.configuration.stripe = {
    publishable_key: Figaro.env.stripe_publishable_key,
    secret_key: Figaro.env.stripe_secret_key
  }

  Stripe.api_key = Figaro.env.stripe_secret_key
  Stripe.api_version = '2022-11-15'
  ```

  For `Node.js`, we can use the following initializer in each of the components:

  ```js
  import Stripe from "stripe";

  const stripe = new Stripe(process.env.stripe_secret_key, {
    apiVersion: "2022-11-15",
  });
  ```

- Create the products and their corresponding prices from the Stripe dashboard
  or using [stripe-cli](https://stripe.com/docs/stripe-cli). We will have to
  store the Stripe allotted IDs for `Prices` in our server for further
  interactions, like say subscribing to a particular product with a particular
  price.
- Optional step: Configure the customer portal. The customer portal allows the
  user to cancel the plan, update credit card info, update subscription
  quantities, etc. These features can be directly implemented in the application
  itself without much hassle or can be delegated to Stripe's own customer
  portal. Since this abstracts away a lot of the Stripe functionalities from the
  developer, we won't be implementing this feature.
- Create a checkout session. Here basically we need to create a checkout session
  ID in our backend and send it to our client and redirect to the Stripe hosted
  checkout page using that ID. The ID will help Stripe understand things like,
  which URL Stripe must redirect once checkout is successful or not, is the
  payment a subscription or a one-time payment, which item is being checked out,
  etc. Let's see an example of how it's done in the Rails backend:

  ```ruby
  checkout_options = {
    success_url: "#{Figaro.env.webapp_url}/checkout/success?session_id={CHECKOUT_SESSION_ID}",
    cancel_url: "#{Figaro.env.webapp_url}/",
    payment_method_types: ['card'],
    mode: 'subscription',
    line_items: [{
      quantity: 1,
      price: price_id_from_label
    }]
  }

  session = Stripe::Checkout::Session.create(checkout_options)

  redirect session.url, :see_other
  ```

- Optional step: If we want to avoid customer duplication at Stripe's end when
  the customer re-subscribes using Stripe hosted checkout form, then we need to
  conditionally add the already existing customer's Stripe ID to the checkout
  options. If no customer already exists, then we can pass in the email. We can
  add a logic similar to the one shown below before creating the checkout
  session:

  ```ruby
  checkout_options.merge!(if existing_customer.present?
                            { customer: existing_customer.stripe_customer_id }
                          else
                            { customer_email: checkout_params['email'] }
                          end)
  ```

- Monitor and provision the checkout, and provide access to the application.
  Think `asynchronous`! Stripe checkouts or more accurately card payments, are
  often not synchronous. Therefore we need to leverage Stripe webhook events to
  make sure that the customer has indeed made the payment and provision further
  access to our products/applications based on the event response.

## Stripe Elements

[Stripe Elements](https://stripe.com/en-in/payments/elements) are prebuilt UI
components provided by Stripe for the developers to integrate into their own UI.
These components allow the developers to have more control over each and every
step, rather than delegating all control to Stripe-hosted UI's. Let's take a
look into what makes Stripe Elements a popular choice among some developers.

### Features

- Provides real time validation as customer types, including fields like card
  details and address.
- Allows maximum customization and control over look and feel of the payment
  form.
- Allows localization features like dynamically detecting which inputs are
  needed based card's country and location.
- Easy to plug and play into our existing UI codebase.
- Most important point is that it provides a great level of control for the
  developers over how each Stripe action, like say Checkout, is handled.

### Things to watch out for

- It's sometimes not straightforward to manage the stylesheets and update it
  dynamically, specifically for the `CardElements` and all.
- The reason is that these card elements etc, for being secure, are displayed in
  an HTML `iframe`, which won't allow any styles to trickle down from parent to
  it. It has its own style context, called the `options` object, which can be
  passed to card elements.
- For taking further steps which require more action from customers side like
  say accessing 3D-secure payment in SCA compliant countries during checkout
  etc, we need to handle the logic in our own website itself.
- The overall UI/UX of the page needs to be taken care of from our side, so that
  the page remains responsive across all devices.
- All cases of errors need to be handled and notified to the user from our side
  itself.

### Steps to make a payment using stripe elements

- Setup the [stripe-js](https://stripe.com/docs/stripe-js) library and
  [react-stripe-js](https://stripe.com/docs/stripe-js/react) library for making
  use of the UI components.
  ```js
  yarn add @stripe/react-stripe-js @stripe/stripe-js
  ```
- Create the stripe object, which is a reference to all of Stripe's front-end
  SDKs. Make use of the `loadStripe` helper from `stripe-js`, passing in the
  publishable key, to return a `Promise` which will resolve to this object.
- Wrap the child components where Stripe object reference and card payment is
  needed, within the `Elements` provider from `react-stripe-js`, where the
  `stripe` prop will be set to `Promise` from the above step.
- The Elements provider allows us to use `Card` components and access the Stripe
  object in any nested component. Usually, the provider is rendered at the root
  of the App, in order to make it available everywhere in the app.

  ```js
  import { Elements } from "@stripe/react-stripe-js";
  import { loadStripe } from "@stripe/stripe-js";

  // Make sure to call `loadStripe` outside of a component’s render to avoid
  // recreating the `Stripe` object on every render.
  const stripePromise = loadStripe(
    "pk_test_51JN8RDS4ArgcNIller....z50iOJ613G2000VINY9qmK"
  );

  const App = () => {
    return (
      <Elements stripe={stripePromise}>
        <MyCheckoutForm />
      </Elements>
    );
  };
  ```

- The above way of importing and using the `loadStripe` method is valid. But it
  can be optimized by dynamically importing the `@stripe/stripe-js` library. It
  allows you to defer loading the library until it is actually needed, reducing
  the initial loading time of your application. This can be particularly useful
  if the Stripe library is not used on every page or in every scenario of your
  application.

```js
const stripeJs = () => import("@stripe/stripe-js");
const { loadStripe } = await stripeJs();
```

- The next step is to create a `CheckoutForm` component where we get the
  reference of both the stripe object as well as elements using the `useStripe`
  and `useElements` hooks.
- In the checkout form, we need to create a stripe `paymentMethod`, by passing
  in the reference to mounted `CardElement` and our billing details.
- A `PaymentMethod` contains reusable payment method details for creating
  payments, e.g: card expiration date or billing address. It does not include
  transaction-specific information, e.g: amount, currency.

  ```js
  import { CardElement, useStripe, useElements } from "@stripe/react-stripe-js";

  const CheckoutForm = () => {
    const stripe = useStripe();
    const elements = useElements();

    // Get a reference to a mounted CardElement. Elements knows how
    // to find your CardElement because there can only ever be one of
    // each type of element.
    const cardElement = elements.getElement(CardElement);

    // Use your card Element with other Stripe.js APIs
    const { error, paymentMethod } = await stripe.createPaymentMethod({
      type: "card",
      card: cardElement,
    });

    return (
      <form onSubmit={handleSubmit}>
        <CardElement />
      </form>
    );
  };
  ```

- Once `paymentMethod` object is successfully created, the next step is very
  much dependent on the business logic of our application. Here we need to
  create a new `customer` and attach a `subscription` for the `price` chosen.
  This should be done in the backend. We need to pass in the collected email for
  storing to our own DB, ID of the payment method, and the price chosen.
- From the backend, we will receive the ID of the subscription, `client_secret`,
  which is the unique key for individual `paymentIntent`, and the status of the
  subscription.
- If the subscription `status` is `requires_action`, then the next step is to
  confirm the card payment by making use of the `client_secret`.
  ```js
  const cardPaymentStatus = await stripe.confirmCardPayment(client_secret);
  ```
- This confirmation is to make sure that we take care of steps like 3D-secure
  for SCA compliance. If the subscription `status` was already `paid`, then we
  can provision access to product directly. For all other `status`, we should
  disallow user access to product and wait for webhook events for confirmation.

## Stripe Checkout vs Stripe Elements

Let's talk about an example of Stripe action, which is collecting payment.
Ultimately from a functionality point of wise, both Stripe Checkout and Elements
achieve the same goal.

Stripe Elements provides more control over UI and allows to keep the customer
within the application for doing all sorts of stripe-related activities rather
than redirecting to another page.

Stripe Checkout functions a bit differently because it appears on another page.
But ultimately they all do the same thing: Take money from the customer and put
it in your account and perform other stripe-related side effects. The following
factors need to be considered when using either of them.

### Factors

- Site's design: Take a moment to evaluate what kind of form best suits your
  website's current design. Will it be overcrowded if we add a checkout form to
  the website? How much time are you going to spend making the checkout form
  usable to the customer and responsive?
- Type of customers: In order to get maximum conversion rate, we have to think
  from the customer's perspective. Will having Stripe logo and clean UI like the
  Stripe hosted Checkout page increase the conversion rate with the current
  customer? Will redirecting away from the current application to Stripe hosted
  Checkout page wary the customer?
- The best way to figure this out is to test them on some customers/pool of
  developers and see which one is more effective. But since we don't have that
  option most of the time, the best choice is to make use of the Stripe hosted
  checkout page.

### Notable differences between the two

- Stripe Elements overcomes one major caveat of Stripe Checkout, which is
  handling the `email` field. On the Stripe hosted checkout page the email can
  be edited at times.
- Using Stripe elements we have full control over our fields.
- Also stripe elements help with custom branding and other UI related
  enhancements.
- Stripe hosted Checkout page saves a lot of development time and reduces the
  chances of failure due to some coding mistake from developers side. The Stripe
  hosted checkout page is a work of art and a lot of effort was put into
  creating such a responsive and beautiful page. Thus we can use it without
  getting tensed about UI/UX.
- Stripe checkout page is very secure and gracefully handles all error
  scenarios. Also, it provides a lot of goodies like applying discounts, tax
  calculation, address fields with auto-completion, payments with google/apple
  pay, etc out of the box.
