By premature optimization in API calls we mean fetching information we do not
need yet. In simple terms, preparing for something which we do not require. For
example, in our application we are not fetching all the task details in the
`Dashboard` component and storing it in a global state so that the information
can be reused in the application without making more API calls.

One could argue that fetching the task details inside the `Show` component is
not required as we are already fetching the list of tasks and displaying them in
a table. Clicking on a task inside the table routes the application to `Show`
component. We could have passed the task details to `history.push` during
routing and accessed them inside the `Show` component.

In the previous chapter we added a new feature to add comments for a task and
display them in the `Show` component. If we were to pass the task information
using history API and access it inside the `Show` component, then it would
require us to fetch all the task details inside the `Dashboard` component itself
including the comments for each task and other details which we do not even need
while displaying the list of tasks in `Dashboard`. So that we can pass these
details during routing and access them inside the `Show` component.

Now you must be able to guess why we didn't do so. It's not a good practice to
fetch unnecessary information beforehand as it only increases the size of the
response. We would have needed to fetch the entire task information for each
task. Hence it is better to make an extra API call inside the `Show` component
for fetching all the relevant information.

Another reason why we shouldn't fetch data beforehand is that the data can
change in the database after it has been fetched. If we pre-fetch the data then
we will end up with stale data in this case.

Consider another scenario where an unauthenticated user can view the task title
but other details should only be visible once the user logs in. In such a case
as well it is not wise to fetch the entire task information and save it in state
and once the user logs in then show the entire task information.

Even if you don't show the sensitive information in your app and save it in
state, an unauthenticated user can still view that information in the API
response in the network tab of your developer console.

Hence you should only fetch the relevant data(i.e. only the data which is
required to build your UI) in the API call.

## Sending back response data from create or update actions

After creating or updating a record, developers often send back the record
information. This should be avoided as we are trying to maintain a separation of
responsibility.

In Rails, the `create` and `update` actions of a controller are used to create
and update records respectively and the `show` action responds back with the
record data. If there is a need to access a record after it has been created or
updated then a separate API should be called which will call the relevant `show`
action in your server side and provide the required data.

## Avoid the premature optimization mindset

Now if you are thinking along the path that making one more extra API call is
costly, then you are thinking of prematurely optimizing. Premature optimization
is often not necessary at the early stages of an application we don't have
enough data points to accurately suffice the need for optimizing a particular
logic. We can only gather these data points once actual customers start using
our application. The first and foremost aim should be to write clean code and
have separation of concerns. This will make it easier to refactor code in future
for optimization purposes too.
