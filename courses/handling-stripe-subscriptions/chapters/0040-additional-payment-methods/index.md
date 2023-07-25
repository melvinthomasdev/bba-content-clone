In addition to the traditional integration methods we discussed in the previous chapter, Stripe offers a range of alternative approaches to accept payments seamlessly. These methods provide flexibility and convenience for both merchants and customers, allowing businesses to offer various payment options that cater to their unique needs. In this chapter, we will explore two such methods: Payment links and Payment element.

[Stripe Payment links](https://stripe.com/docs/payment-links) is a simple and customizable URL that allows businesses to securely collect payments from customers without the need for a full website integration.

[Stripe Payment Elements](https://stripe.com/docs/payments/payment-element) is a UI component for the web that accepts 40+ payment methods, validates input, and handles errors.

## Stripe payment links

Stripe payment links are a straightforward way to create and share customized URLs that enable customers to make payments easily. This method is particularly useful when you want to collect payments without the need for complex website integrations or when you require a quick and simple solution to accept payments.

### Key Benefits

Stripe Payment Links offer several advantages for businesses:

- **Simplicity:** Payment links simplify the payment process for both businesses and customers. You can generate a payment link directly through the Stripe dashboard without requiring complex integrations.

- **Versatility:** Payment links support various payment scenarios, including one-time payments and recurring payments. You can customize the payment amount, currency, quantity of product and description to suit your specific needs.

- **Flexibility:** Payment links can be easily shared through multiple communication channels, allowing you to reach customers wherever they are. You can send payment links via email, SMS, chatbots, social media platforms, or embed them in your website or mobile app.

- **Security:** Stripe Payment Links leverage Stripe's robust security infrastructure, ensuring that payment transactions are handled securely.

### Creating a payment link

In the Dashboard, open the [Payment Links](https://dashboard.stripe.com/test/payment-links) page and click "Create test payment link",

<image>create-payment-link.png</image>

Select an existing product or click "Add a new product". If adding a new product, fill out the product details and click Add product.

<image>customize-payment-link.png</image>

Click Create link.

### Creating a payment link via Stripe API

To create a payment link, pass in a `line_items`. Each line item contains a `price` and `quantity`.

```bash
curl https://api.stripe.com/v1/payment_links \
  -u "sk_test_51MlsYOSAtMnnOhaHS...sdfs8iHIdsf5Tq127vrZKVo8:" \
  -d "line_items[0][price]"="prod_JJex2jDvjE1FT5" \
  -d "line_items[0][quantity]"=1
```

Payment links are similar to checkouts but it is designed for businesses with fewer customers. It requires more manual work in handling the customers. It provides a convenient way for businesses to create payment links without the need for extensive coding or integration. Checkouts are meant to be integrated into the website and support automating other aspects via code.

## Stripe Payment Element

Stripe Payment Element is a customizable and pre-built user interface (UI) component provided by Stripe to facilitate the integration of payment functionality into web applications. It offers a streamlined way for businesses to accept payments securely and seamlessly. With Stripe Payment Element, developers can easily embed a ready-to-use payment form directly into their website or application.

`PaymentElement` is similar to `CardElement` from the previous chapter but it is better than the `CardElement` in the following aspects.

- Accepts a broader range of payment methods using wallets like Google Pay, Apple Pay, etc and other payment methods, unlike `CardElement` which only accepts card payments.

- Provides much more customization ability to the developer.

### Steps to make a payment using `PaymentElement`

- Setup the [stripe-js](https://stripe.com/docs/stripe-js) library and
  [react-stripe-js](https://stripe.com/docs/stripe-js/react) library for making
  use of the UI components.
  ```js
  yarn add @stripe/react-stripe-js @stripe/stripe-js
  ```
- Create the stripe object, which is a reference to all of Stripe's front-end
  SDKs. Make use of the `loadStripe` helper from `stripe-js`, passing in the
  publishable key, to return a `Promise` which will resolve to this object.

- From the backend, fetch the ID of the subscription, `client_secret`, which is the unique key for individual paymentIntent, and the status of the subscription.

- Wrap the child components where Stripe object reference is needed, within the `Elements` provider from `react-stripe-js`, where the `stripe` prop will be set to `Promise` from the above step and options will be set to an object with `clientSecret` key set.

```js
import {Elements} from '@stripe/react-stripe-js';
import {loadStripe} from '@stripe/stripe-js';

// Make sure to call `loadStripe` outside of a component’s render to avoid
// recreating the `Stripe` object on every render.
const stripePromise = loadStripe('pk_test_51ND60EG5BMLabnXB52DW...Lp12gj0fT1aYLdbN3pg9k6z');

export default function App() {
  const options = {
    // passing the client secret obtained from the server
    clientSecret: '{{CLIENT_SECRET}}',
  };

  return (
    <Elements stripe={stripePromise} options={options}>
      <CheckoutForm />
    </Elements>
  );
};
```
- The next step is to create a `CheckoutForm` component where we get the reference of both the `stripe` object as well as elements using the `useStripe` and `useElements` hooks.

```js
import {useStripe, useElements, PaymentElement} from '@stripe/react-stripe-js';

const CheckoutForm = () => {
  const stripe = useStripe();
  const elements = useElements();

  const handleSubmit = async (event) => {
    const result = await stripe.confirmPayment({
      elements,
      confirmParams: {
        return_url: "https://example.com/order/123/complete",
      },
    });

    if (result.error) {
      console.log(result.error.message);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <PaymentElement />
      <button disabled={!stripe}>Submit</button>
    </form>
  )
};

export default CheckoutForm;
```
## Which method should you use?

When deciding on the appropriate Stripe payment method for your integration, several factors come into play. Stripe Checkout is an ideal choice if you seek a hassle-free, fully hosted solution that handles the entire payment process. It requires minimal development effort and suits scenarios where customization is not a priority. Stripe Payment Links, on the other hand, are great for simple, no-code payment collection via generated links, making them convenient for email or messaging-based payments. If you require more control over the payment form's appearance and behavior, Stripe Elements' CardElement allows you to create custom payment forms with secure card information collection. Lastly, Stripe PaymentElement offers a comprehensive solution for more advanced payment requirements, including additional payment methods. Read more about this topic [here](https://support.stripe.com/questions/choosing-between-payment-links-invoicing-checkout-and-payment-element)
