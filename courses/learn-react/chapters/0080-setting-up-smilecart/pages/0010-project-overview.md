So far, we have learned the following concepts:

- What is React, and Why do we need it?
- What is a Component in React?
- How to use JSX to write Components?
- How to pass Props to a Component?
- How JSX gets converted to JavaScript?
- Limitations of JSX

We have also seen how to spin up a simple React application using `create-react-app`.

Now, let's dive deeper into React by building a simple e-commerce website. Let's name it SmileCart.

Here is a quick overview of what we are going to build.

The SmileCart application consists of the following pages:

- **Home page**: Where we will showcase all the products.

  <image>smile-cart-home-page.png</image>

- **Product page**: To display detailed information about a single product. This page will also have the option to add the item to the cart and buy it.

  <image>smile-cart-product-page.png</image>

- **Cart page**: Allows the users to view all the products they have added to their cart.

  <image>smile-cart-user-cart-page.png</image>

- **Checkout page**: Collects the contact information and shipping address from the user. Additionally, the page will display the total bill amount, and users will be able to place their order by clicking the **_Confirm order_** button.
  <image>smile-cart-checkout-page.png</image>

# Fork the template repo

To get started with the project, we've set up a React app with the necessary packages and configurations for you. You can fork the [smile-cart](https://github.com/bigbinary/smile-cart-frontend) repository to begin working on the project.

# Backend APIs

Given that this is a frontend course focusing on React, we've provided a set of APIs available through https://smile-cart-backend-staging.neetodeployapp.net as the backend. It supports the following endpoints:

## List products

To get a list of products, make a `GET` request to `/products`. By default, this API returns `10` products. However, you can obtain a maximum of `50` products by including the `page_size` parameter in the request.

The API supports searching and pagination. To search for a specific product by name, you can use the `search_term` parameter. For pagination, utilize the `page` and `page_size` parameters.

Here is an example with search and pagination parameters: https://smile-cart-backend-staging.neetodeployapp.net/products?search_term=shirt&page=1&page_size=10.

## Get product details

To retrieve the details of a specific product by its slug, make a `GET` request to `/products/:slug`.

Example: https://smile-cart-backend-staging.neetodeployapp.net/products/infinix-inbook-2.

## Place an order

To place a new order, make a `POST` request to `/orders`.

The `/orders` endpoint doesn't enforce data schema validation or data preservation. It simply returns a success status code without further processing.

## List countries

To get an array of country objects with their names and codes, make a `GET` request to `/countries`.

## List states of a country

To get an array of state objects with their names and codes for a selected country, make a `GET` request to `/states` with `country_code` as the request parameter. You can obtain `country_code` by looking into the response of the `/countries` API.

For example, to get a list of states of India, make a `GET` request to https://smile-cart-backend-staging.neetodeployapp.net/states?country_code=IN.
