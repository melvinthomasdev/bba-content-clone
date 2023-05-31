For side project task 4, we integrated the capability to create and view posts
into our application. In this new task, we will add a `User` and `Organization`
model to the application and implement the necessary functionalities for them.

## Task 5

Let's incorporate the following functionalities into the application:

- Create an `Organization` model with a `name` attribute. Migrate the database
  and add an entry for a sample organization through the Rails console.
- Add a `User` model with attributes `name`, `email` and `password_digest`. It
  is recommended that candidates utilize the `bcrypt` gem for secure password
  hashing. Additionally, include a foreign key referencing the `Organization`
  model within the `User` model. So, every user should belong to an
  organization.
- In the `Organization` model, the `name` attribute should not be NULL. In the
  `User` model, proper validations for `name`, `email`, `password` and
  `password_confirmation` should be added.
- Modify the `Post` model by adding foreign keys that reference both the `User`
  and `Organization` models. This will ensure that each post has an author and
  an associated organization.
- Modify the post listing page to show the name of the author just below the
  title and above the description on each post card.
  <image>post-listing-with-user.png</image>
- Add the author's name in the modal that shows details about the post.
  <image>show-post-with-user.png</image>
- You can now implement the Sign-up, Login, and Logout functionalities similar
  to what we had in the granite application.
- Please ensure that the post listing page displays only the posts created by
  authors who belong to the same organization as the currently logged-in user.
