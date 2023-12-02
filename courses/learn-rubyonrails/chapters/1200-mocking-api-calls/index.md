In this chapter, we will see what mocking requests or method calls mean, why it
is required in the first place and how to `mock` requests. Before jumping into
our topic let's first understand more about some basic terminologies which we
will be using throughout the chapter like `stub` and `mock`.

## What is a stub?

A `stub` provides a predetermined answer about the methods which are called on
them. They return some hardcoded information for the stubbed methods so that
method's dependencies and time-consuming operations can be avoided. The stubbed
methods do not affect other un-stubbed methods. We have already seen that by
using `stub` we can even stub ENV variables, in
[this](/learn-rubyonrails/deep-diving-into-unit-testing#env-variables-and-flaky-tests)
section.

An example for `stub` would look like this:

```ruby
def test_update_the_env_value
  Rails.stub :env, "production" do
    assert_equal Rails.env, "production"
  end
  assert_equal Rails.env, "test"
end
```

In the above-mentioned test, we have changed the value of `Rails.env` to
`production` only for the block. Outside the `stub` block, all the variables are
unchanged.

## What is mock?

The `mock` is also a kind of `stub` which provide information about the methods
which are called on them but with the added responsibility of verification of
the calls it gets. Mocks are created with some expectations according to the
calls they are expected to receive. They can throw an exception if they receive
a call they don’t expect. The purpose of mocks is to verify that certain
expectations are met and whether the defined results are used or not.

In `Minitest`, we can initialize a mock object with the command
`Minitest::Mock.new`. We can use a method called `expect()` to set a method name
and value which is expected to be called by the test method.

Let's see an example for `mock` like this:

```ruby
def test_confirms_the_payment_status
  booking = Minitest::Mock.new
  booking.expect :payment_completed?, true
  confirm_order(booking)
  booking.verify
end
```

In the above example, we have mocked a `booking` object which is expecting a
call to `payment_completed?` method. We have passed this `booking` object to a
function called `confirm_order` which calls and verifies the payment like this:

```ruby
def confirm_order(booking)
  assert booking.payment_completed?
end
```

At last, we can also verify if `payment_completed?` was invoked and if any
errors have occurred during that invocation using `verify` method.

If we don't call the expected method that is `payment_completed?`, `verify`
method will raise an error like this:

<image alt="Mock error example">mock-test-error.png</image>

## Difference between stub and mock

We can use several stubs in one test, but generally, there is only one mock per
test. In the case of `stub`, we define the primary object's value with the
required results and then test the functionality. Whereas in the case of `mock`
we set up expectations in the primary object, test the functionality, and then
we can verify that the correct methods had been invoked or not.

The job of `stub` and `mock` is almost same, that is to return the defined
values. But `mocks` can also check how all the defined values are being used.

## Why mocking API calls are required?

While building applications we often use external services or APIs. Testing
these external services can be a very difficult task because test results are
now dependent on many external variables.

The test suite can fail because of connectivity issues. Tests can fail if the
external API server is down. The test suite can be very slow as speed is now
also dependent on the response time of the external server.

Due to the above-mentioned reasons, we should not make requests to the external
API while testing. The test suite should be run in isolation. That's where
mocking API calls help us. We can `mock` the external API calls so that we can
test the application and also run the test suite in isolation. We will be using
a mocking library that is `Webmock` to mock the external API requests. We will
`mock` the requests by stubbing the results and using these mocked requests we
can run our test suite in isolation without any external dependency.

## Webmock

`Webmock` is a library for stubbing and setting expectations on HTTP requests in
Ruby. Using `Webmock` we can match the requests based on method, URI, headers,
and body and return the required response. Let's check some of the examples
where HTTP requests are stubbed.

- Stubbing request based on method and URI:

```ruby
stub_request(:get, "www.example.com").
  to_return(body: "success", status: 200)
```

- Stubbing request based on request body and headers:

```ruby
stub_request(:post, "www.example.com").
  with(body: "webmock", headers: { 'auth-token' => 1 }).
  to_return(body: "success", status: 200)
```

- Stubbing request with regular expression in body:

```ruby
stub_request(:get, "www.example.com").
  with(body: /webmock$/).
  to_return(body: "success")
```

- Stubbing requests with regular expression in URI:

```ruby
stub_request(:any, /example/).
  to_return(body: "success")
```

If a test invokes this `stub_request` as shown in the above examples and makes a
request with the matching configuration than rather making an actual request,
the stub method will return the predefined results. Using this `stub_request`
method we can stub any external service and can run our test suite in isolation.
This decreases the number of dependencies for the test suite and increases the
test suite speed.

There are many other options that can be used with the `stub_request` method. To
read more about other available options that can be used with the `stub_request`
method please refer to the [docs](https://github.com/bblimke/webmock) from the
official `Webmock` repo.

## Mock API in a DRY fashion

Let's say our test suite is using an API in many different requests with
different configurations. Rather than defining a stub method for each request,
we can define a `mock` method for the API. In this mock method, we will set some
expectations for the request's configuration and return the stubbed response.
Any test invoking this `mock` method with the required expectations can request
for a stubbed response. In this way, we can keep the code DRY. Any test which
wants to make the external API requests can just invoke these `mock` methods in
a single line.

Let's understand with an example. Let's say we have a service that is making
requests to `Stripe` API to know the status of payments. While testing this
service we don't want to make actual requests to the `Stripe` server. We will be
mocking this `Stripe` API request.

Let's first define a method called `stripe_payment_status_response` like this:

```ruby
def stripe_payment_status_response(user,result)
{
  # Actual response object
}
end
```

We have defined a method that returns a response just like an actual response.
We have also passed the `user`, and `result` arguments so that we can update the
response object accordingly.

Let's define the `mock` method like this:

```ruby
def mock_stripe_payment_status(user, result, method, status)
  body = stripe_payment_status_response(user, result)
  stub_request(method, payment_status_url)
    .to_return(body: body.to_json,
      status:
    )
  body
end
```

In the above-mentioned `mock` method, we are expecting a `user` object, `result`
type, `method` type, and `status` code. According to the passed arguments, we
will be updating the response object using the `stripe_payment_status_response`
method. After that, we have stubbed the request according to the given method
and will return the mocked response object or data.

Now, any test which wants to use `Stripe` API for knowing payment status can
just invoke the above-mentioned `mock` method with required expectations or
arguments.

For example:

```ruby
def test_should_place_the_order_after_successful_payment
  mock_stripe_payment_status(@user, "success", "get", 200)
  @fetch_payment_status_service.process
  assert @user.orders.last.placed
end
```

In the above mentioned example, we have invoked the `mock` method with the
required arguments. Now when the service will make a request to get the payment
status from `Stripe`, the mocked response will be returned and we can run the
test successfully in isolation.

There can be cases when we overuse `mocks` and `stubs`. In such cases, the test
suite can fall out of sync with the production code. It can result in a
situation when tests pass successfully but the system fails. We should be
careful while using `stubs` and `mocks`.

For understanding these test cases better, go through the following example
which mocks Google Calendar APIs:
https://gist.github.com/yedhink/911578e30be70e54bbc1f419ab08f0ac

For more details refer:

- https://stackoverflow.com/questions/3459287/whats-the-difference-between-a-mock-stub

- https://www.martinfowler.com/bliki/TestDouble.html

- https://github.com/bblimke/webmock
