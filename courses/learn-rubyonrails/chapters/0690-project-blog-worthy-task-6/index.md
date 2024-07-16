In task 5 of our side project, we integrated the `User` and `Organization`
models into our application. Now, in this task, we will implement the
functionality for users to upvote and downvote posts and necessary tests.

## Task 6

- In the task listing page, modify the post card component to feature an upvote
  button, a downvote button and a net vote count. The net vote count should have
  a value of `upvotes` - `downvotes` and must dynamically change when a user
  clicks on the upvote or downvote button. Make sure the upvotes and downvotes
  values change on the Rails' side as well.
  <image alt="Post listing page">post-listing-with-voting.png</image>
- Implement the necessary logic to toggle the `is_blog_worthy` field in the
  `posts` table to `true` when the net vote count exceeds a defined threshold.
  If the net vote count falls short of this threshold, please ensure that the
  `is_blog_worthy` field is set back to `false`. To define the constant
  threshold value, you may use the Rails initializers. If the implementation of
  this logic ought to be done via some side effects, then you may prefer to
  opt-in for Active Record callbacks.
- When the `is_blog_worthy` field is assigned a value of `true`, a tag
  indicating `blog-worthy` must be displayed on the front-end side. For example,
  if the threshold is set to 15 and the net vote becomes 16, then the tag should
  be shown as in the figure below.
  <image alt="Post listing page">post-listing-with-blog-worthy-tag.png</image>
- Finally, add the necessary tests for models and controllers. Make sure your
  application is thoroughly tested. To ensure thorough testing, it is imperative
  to maintain a test coverage of 100% for all model and controller codes.
