In side project task 1, we created a Rails application and added a `Post` model
to it. In this task, we will be experimenting with the Rails console and
validations.

## Task 2

Add the following validations to the `Post` model:

1. Validate the presence of the `title` field. Also, make sure that it has a
   maximum length of 125 characters.
2. Add custom validation to ensure that the net vote, i.e, `upvotes` -
   `downvotes`, does not acquire a negative value.
3. Validate the presence of the `is_blog_worthy` field. If you want to validate
   the presence of a boolean field, you will want to use
   `validates_inclusion_of :field_name, in: [true, false]`.

Now, open up the Rails console to experiment with the validations

1. Create a post with an empty title. Ensure that the entry is invalid.
2. Create a post with a title exceeding the maximum character limit. Ensure that
   the entry is invalid.
3. Add/update a post with downvotes more than upvotes. Ensure the entry is
   invalid.
4. Create a post with valid values and ensure no unexpected errors are thrown.
