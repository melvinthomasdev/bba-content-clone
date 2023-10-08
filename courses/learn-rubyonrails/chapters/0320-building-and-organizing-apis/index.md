## How to name routes

Since we use a Rails backend, and as Rails enforces some conventions in place
while writing the routes, we need to follow the same principle everywhere while
defining routes.

So what are these conventions? It's RESTful naming of routes. We already went
through this section in the
[Chapter regarding RESTful routes](/learn-rubyonrails/restful-routes-in-ruby-on-rails).
You should always refer to that section while naming your routes, until the
naming standards occur naturally to you. It's important to remember this while
defining API's.

## Organizing APIs

As the application grows huge, the number of API's to interact with the server
will also increase nearly proportional to the routes that we define. Sticking
onto the principle of modularity and reusability, we will be creating all our
API's in `app/javascript/src/apis` directory, which we had created in an
[earlier chapter](/learn-rubyonrails/setting-up-react-environment#axios-headers-and-defaults).

## Building an API

We at BigBinary strictly follow these conventions while creating the API's. Try
to positively reinforce these points whenever you create an API, by referring
this section(maybe bookmark this section).

The following are the steps that you need to keep in mind:

- Step 1: Always try to name the API connector file aligned with the resource
  that the particular API will be interacting with. So if there is a
  `registrations` resource in our server, then we can name the file
  `apis/registrations.js`. But why plural? The reason is that there are two
  types of resources in Rails. Since registrations are mostly defined as
  `resources registrations`, we should name the file too using plural
  `registrations.js`. If the route defined in Rails was say `resource profile`,
  that is with singular `resource`, then we should name the file as
  `apis/profile.js`.

  If the resource name is in snake_case then make sure to use the same name in
  snake_case for API connector files in the frontend. For example, if the
  resource is `resource :draft_order` then the API connector file name should be
  `apis/draft_order.js`. Doing so makes it easier to search for the respective
  API connectors for a resource and vice-versa.

- Step 2: We use Axios for making API calls. Thus import it.

- Step 3: The functions we define in the API file, should be resourceful. Which
  means the function names should adhere somewhat similar to the actions for a
  particular route. Eg: For registrations, let's say we have a create and
  destroy action. Then the functions we define in `apis/registrations.js` should
  be named `create` and `destroy`. If there are custom routes/member/collection,
  then you can update the name accordingly. But key point is to keep it
  resourceful.

- Step 4: If we need an API to interact with the `index` action, then prefix
  it/name it with the `fetch` keyword. This is a standard that we follow in
  BigBinary. The `index` action usually returns a list of items. Thus we use the
  `fetch` keyword to denote such a case. How's this useful? In a huge project,
  we just need to search with the `fetch` prefix to reach the functions which
  interact in some manner with the `index` action. Also if there is a need for a
  wrapper function say within your React component, which invokes these API's,
  then name it something like `fetchDetails`, `fetchItems`, `fetchData`,
  `fetchTasks` etc. Hopefully you get the general idea.

- Step 5: If there are more than one parameter in API actions(this is how we
  will term those API functions), then use named parameters. The reason is that,
  we don't need to follow an order for the params, when invoking the function.
  Also, if you need to send certain data to server, then encapsulate it within
  an object called `payload`. You will get a better idea when you start using
  these API's.

- Step 6: Once you create the functions/actions in API, you need to export them.
  So how to do it? Create a variable named as `resourceNameApi`, which is an
  object consisting of all the actions defined. Eg:
  `const registrationsApi = { create, destroy };`. Now we default export this
  variable only, like this: `export default registrationsApi`. This is done to
  enhance the intellisense. Now we can simply type in `registrationsApi`, and if
  your text editor is configured properly, then it will auto-import the API.
  Cool right?

- Step 7: When adding a new action, make sure you add it to `resourceNameApi`
  variable that we export from the API.

Phew! That was a lot of steps. But this occurs naturally once you practice
writing API's a bit and use them.

## How to effectively use these conventions

In a big project, it's not an easy task to know exactly how every unit works
together and what all interactions takes place. So the most effective way to
understand a project is to lookup the `config/routes.rb` file. It will show a
high level overview of what all routes are there, what all controllers will be
there, how the API's would be named in the frontend side etc. After looking into
the routes, we can search globally with the resource name prefix(remember
`registrations`?) and limit the search to JavaScript files to pinpoint where
exactly these API's are invoked from etc.

If you wish to take a look at how an API request is processed in Rails then you
can refer to
[this in-depth chapter about request-response cycle in Rails](/learn-rubyonrails/request-response-cycle-in-rails).

There is **nothing to commit** in this chapter.
