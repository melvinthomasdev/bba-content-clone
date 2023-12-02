## Features

In this chapter, we'll add a feature to **Display** and **Add Comments** on the
`Task`'s show page. We are going to make the following changes in our
application:

- Both assignee and the owner can add comments on their tasks.

- All added comments will be displayed in descending order of the time at which
  they were added. i.e. the most recently added comment will be shown at the
  top.

- The comments list will include the date and time at which the comment was
  posted.

Here is how the feature will look like when implemented:
<image alt="Comments feature">comments-feature.png</image>

## Technical design

The implementation of this feature is fairly straightforward:

- We will be creating a new model, named `Comment`, having these fields: a
  non-empty text content, a reference to the `User` who made the comment, and a
  reference to its parent `Task`.

- We will open an API route for creating comments.

- We don't need a separate API for listing comments. We can include the comments
  in `Task`'s `show` action.

- We will update the `Jbuilder` for `show` action in `TasksController` to
  include the comments data in tasks JSON.

- In frontend, we will add a new component, named `Comments`, to display the
  comments section. This will include a textarea to enter comment content, a
  button to post it via API and a list to display the previously created
  comments.

- We will include the `Comments` component at the bottom of the `Show` component
  as per the design.

Let's now implement the feature.

## Creating Comment model

We'll create a new model, `Comment`. Run the following command in the terminal:

```bash
bundle exec rails generate model Comment content:text task:references user:references
```

Here we have generated the `migration` script as well `Comment` model.

By passing argument `content:text`, our migration file will be pre-populated
with the script to add `content` to the `comments` table having data type as
`text`.

Now if we observe, every comment would belong to a `Task` and as well to the
`User` who is adding the comment. Passing `task:references` and
`user:references` as the arguments to the `generate model` command automatically
adds the required associations and foreign key constraints.

This is how the `comment.rb` file would look after the required associations are
added:

```ruby
class Comment < ApplicationRecord
  belongs_to :user # Each comment belongs to a single user
  belongs_to :task # Each comment belongs to a single task
end
```

Now open the last migration file under the `db/migrate` folder. It should be as
follows:

```ruby
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
```

`t.references :user` adds column `user_id` to the comments table and by passing
option `foreign_key: true`, a foreign key constraint is added.

Run the migration using `rails db:migrate` for the changes to take effect:

```bash
bundle exec rails db:migrate
```

Now, let's first add a constant for the maximum length of the content. Then we
will add the presence and length validations to the content field the same way
we did in Task's title field.

We can do so by adding the following lines of code in the `Comment` model:

```ruby {2,7}
class Comment < ApplicationRecord
  MAX_CONTENT_LENGTH = 511

  belongs_to :user # Each comment belongs to a single user
  belongs_to :task # Each comment belongs to a single task

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }
end
```

Now similarly we have to make changes in the `Task` and `User` models to
introduce associations for comments. Note that each task can have many comments:

```ruby {2}
class Task < ApplicationRecord
  has_many :comments, dependent: :destroy

  # previous code

  private

    # previous code
end
```

```ruby {2}
class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  # previous code
  private

    # previous code
end
```

`dependent: :destroy` is a callback which makes sure that when a `task` is
deleted, all the comments added to it are deleted as well. Similarly, the same
callback is passed in the `User` model, which would delete all the comments by a
user when the user is deleted.

## Adding tests for the Comment model

To test comments, we can make use of `factory-bot` as we did in the previous
chapter. First, we need factories to generate tasks and comments.

Create `test/factories/task.rb` and populate it with the following content:

```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :assigned_user, factory: :user
    association :task_owner, factory: :user
    title { Faker::Lorem.sentence[0..49] }
  end
end
```

The dummy records that we are creating using `factory-bot` are based on the
database models in our application. Models can also contain associations with
other models. For thorough testing of the application we also need to create the
associated records.

For example, in this case, while creating a dummy `task` record, we also need to
create the associated `assigned_user` and `task_owner` records. We can do so
using the `factory-bot` by adding the association name and specifying the
factory name which should be used to create the associated records.

Hence, in the `task` factory we have added the association names and specified
the `user` factory to be used to create those records.

Note that, we are only selecting the first 50 characters generated by the
`Faker` bot for task title so that the validation for title length holds true.

Also, create `test/factories/comment.rb` and populate it with the following
code:

```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    task
    content { Faker::Lorem.paragraph }
  end
end
```

You might have noticed that we are not assigning values for some fields. Also,
keen readers might have realized that these fields are model associations. And
you are right. This is how we define associations in a factory.

FactoryBot is capable of automatically generating associations for entities. So
if we generate an instance of `comment`, an instance of `user` and `task` will
be auto-generated, given their factories are defined. Therefore we don't need to
manually define `users` and `tasks` and assign them to it dynamically.

Now, populate `test/models/comment_test.rb` with the following content:

```ruby
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = build(:comment)
  end

  # embed new test cases here...
end
```

Let's test whether our comment validations are correct or not:

```ruby
def test_comment_should_be_invalid_without_content
  @comment.content = ''
  assert @comment.invalid?
end

def test_comment_content_should_not_exceed_maximum_length
  @comment.content = 'a' * (Comment::MAX_CONTENT_LENGTH  + 1)
  assert @comment.invalid?
end
```

Now since we have tested the validations, let's make sure that a valid comment
is getting created. For such test scenarios where we need to check whether the
DB data has been created/updated, we can make use of `assert_difference`, where
we check the difference between previous `count` and current `count` of items in
the table:

```ruby
def test_valid_comment_should_be_saved
  assert_difference 'Comment.count' do
    @comment.save
  end
end
```

The above test validates that after saving the comment count gets increased
by 1.

Now let's test whether the association between `User` and `Comment` are properly
validated or not:

```ruby
def test_comment_should_not_be_valid_without_user
  @comment.user = nil
  assert @comment.invalid?
end
```

And similarly, association between `Task` and `Comment`:

```ruby
def test_comment_should_not_be_valid_without_task
  @comment.task = nil
  assert @comment.invalid?
end
```

## Adding route for Comments

Now let's add routes for `create` action of Comments:

```ruby {4}
Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    # ---Previous Routes---
    resources :comments, only: :create
  end

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

Here `only: :create` specifies to create only one route which would be for the
create action. Hence, a route of the format `/comments` is created, to which we
can send a `POST` request and Rails will redirect it to the `create` action of
the `comments` controller.

## Adding Comments controller

Let's add a controller for comments:

```bash
bundle exec rails generate controller Comments
```

We'll only be adding the `create` action in our controller as we have defined a
route only for this action:

```ruby
class CommentsController < ApplicationController
  before_action :load_task!

  def create
    comment = @task.comments.new(comment_params.merge(user: current_user))
    comment.save!
    render_json
  end

  private

    def load_task!
      @task = Task.find_by!(id: comment_params[:task_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :task_id)
    end
end
```

We do not need to send a json or a success message along with the response when
a comment is created successfully.

## Adding Comments to the task show page

We'll make a slight change to the show action in the Tasks controller to load
all the comments of the loaded task so that we can render those comments on the
task's show page. Modify `show` action in tasks controller as follows:

```ruby
def show
  authorize @task
  @comments = @task.comments.order('created_at DESC')
end
```

Here, we are using `order('created_at DESC')` since we need to display the
latest comments first.

We need to update the `Jbuilder` for show action to include comments along with
other task details.

To do so update `app/views/tasks/show.json.jbuilder` view with the following
lines of code:

```ruby {12-17}
json.task do
  json.extract! @task,
    :id,
    :slug,
    :title

  json.assigned_user do
    json.id @task.assigned_user.id
    json.name @task.assigned_user.name
  end

 json.comments @comments do |comment|
    json.extract! comment,
      :id,
      :content,
      :created_at
  end

  json.task_owner do
    json.extract! @task.task_owner,
      :name
  end
end
```

Now let's add React code for the `Comment` section.

Let's create the comments API first:

```bash
touch app/javascript/src/apis/comments.js
```

Open the file and add the following code to it:

```javascript
import axios from "axios";

const create = payload => axios.post(`/comments`, payload);

const commentsApi = {
  create,
};

export default commentsApi;
```

To list the comments, add an index.js file:

```bash
mkdir -p app/javascript/src/components/Comments
touch app/javascript/src/components/Comments/index.jsx
```

Inside `Comments/index.jsx` add the following contents:

```jsx
import React from "react";

import Button from "components/Button";

const Comments = ({
  comments,
  loading,
  newComment,
  setNewComment,
  handleSubmit,
}) => {
  return (
    <>
      <form onSubmit={handleSubmit} className="mb-16">
        <div className="sm:grid sm:grid-cols-1 sm:gap-1 sm:items-start">
          <label
            className="block text-sm font-medium
            text-nitro-gray-800 sm:mt-px sm:pt-2"
          >
            Comment
          </label>
          <textarea
            placeholder="Ask a question or post an update"
            rows={3}
            className="flex-1 block w-full p-2 border border-bb-border
            rounded-md shadow-sm resize-none text-bb-gray-600
            focus:ring-bb-purple focus:border-bb-purple sm:text-sm"
            onChange={e => setNewComment(e.target.value)}
            value={newComment}
          ></textarea>
        </div>
        <Button type="submit" buttonText="Comment" loading={loading} />
      </form>
      {comments?.map((comment, index) => (
        <div
          key={comment.id}
          className="px-8 py-3 my-2 leading-5 flex justify-between
          border border-bb-border text-md rounded"
        >
          <p className="text-bb-gray-600" key={index}>
            {comment.content}
          </p>
          <p className="text-opacity-50 text-bb-gray-600">
            {new Date(comment.created_at).toLocaleString()}
          </p>
        </div>
      ))}
    </>
  );
};

export default Comments;
```

Now, fully replace `Show.jsx` with the following content:

```jsx
import React, { useEffect, useState } from "react";
import { useParams, useHistory } from "react-router-dom";

import tasksApi from "apis/tasks";
import commentsApi from "apis/comments";
import Container from "components/Container";
import PageLoader from "components/PageLoader";
import Comments from "components/Comments";

const Show = () => {
  const [task, setTask] = useState([]);
  const [pageLoading, setPageLoading] = useState(true);
  const [newComment, setNewComment] = useState("");
  const [loading, setLoading] = useState(false);
  const { slug } = useParams();

  let history = useHistory();

  const updateTask = () => {
    history.push(`/tasks/${task.slug}/edit`);
  };

  const fetchTaskDetails = async () => {
    try {
      const {
        data: { task },
      } = await tasksApi.show(slug);
      setTask(task);
    } catch (error) {
      logger.error(error);
    } finally {
      setPageLoading(false);
    }
  };

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      await commentsApi.create({ content: newComment, task_id: task.id });
      fetchTaskDetails();
      setNewComment("");
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTaskDetails();
  }, []);

  if (pageLoading) {
    return <PageLoader />;
  }

  return (
    <Container>
      <div className="flex justify-between text-bb-gray-600 mt-10">
        <h1 className="pb-3 mt-5 mb-3 text-lg leading-5 font-bold">
          {task?.title}
        </h1>
        <div className="bg-bb-env px-2 mt-2 mb-4 rounded">
          <i
            className="text-2xl text-center transition duration-300
             ease-in-out ri-edit-line hover:text-bb-yellow"
            onClick={updateTask}
          ></i>
        </div>
      </div>
      <h2
        className="pb-3 mb-3 text-md leading-5 text-bb-gray-600
       text-opacity-50"
      >
        <span>Assigned To : </span>
        {task?.assigned_user.name}
      </h2>
      <h2 className="pb-3 mb-3 text-md leading-5 text-bb-gray-600 text-opacity-50">
        <span>Created By : </span>
        {task?.task_owner?.name}
      </h2>
      <Comments
        comments={task?.comments}
        setNewComment={setNewComment}
        handleSubmit={handleSubmit}
        newComment={newComment}
        loading={loading}
      />
    </Container>
  );
};

export default Show;
```

Now the comments can be seen in the task show page.

Inside the `Comments` component we are using `textarea` which is an HTML form
element to allow a user to add a comment. HTML input elements such as `input`,
`textarea` and `select` maintain a state of their own which updates based on the
user input.

Whereas in React, the state is a property of the components. Hence it is better
to combine the state of `textarea` with the React state which will make React's
state the `single source of truth`.

This way, React handles the responsibility of rendering the `textarea` element
and controlling it's value thus making `textarea` a `controlled component`.

To do so, we have passed the value of `newComment` from `showTask` component's
state to `textarea` element's value prop and `setNewComment` function as a
callback function to the `onChange` prop of `textarea` element.

Now, any change in the `textarea` input will invoke the `setNewComment` function
which will update `Show` component's state and set the value of `newComment`.
Updated value of `newComment` will be reflected in the `textarea` input.

Once the submit button is clicked, `handleSubmit` function inside `ShowTask.jsx`
will handle the comment post request.

The post request will be sent to the `comments_path` and on that route
`comments_controller`'s `create` action will handle that request.

Now a user can comment on the particular task.

## delete vs destroy methods

`delete` will only delete the current object record from the database but not
its associated records from the database.

`destroy` will delete the current object record along with its associated
records from the database.

Let's understand more, by doing an example from the Rails console. We will be
using Rails sandbox console so that all changes we do in the example rolls back
when we exit the console.

Open Rails sandbox console using the below command:

```bash
bundle exec rails console --sandbox
```

First let's create a new task:

```bash
irb(main):001:0> user_id = User.first.id
irb(main):002:0> task = Task.create(title: 'Read Ruby articles', assigned_user_id: user_id, task_owner_id: user_id)
```

We have taken `id` of the first user in `user_id` variable and used it while
creating the task.

Now create a new comment for this task. Remember while creating the comment we
are setting `task_id` as the `id` of the above created task, which we can access
through `task.id`:

```bash
irb(main):003:0> Comment.create(content: 'nice', task_id: task.id, user_id: user_id)
```

Let's try to delete this task using `delete` method:

```bash
irb(main):004:0> Task.find_by_id(task.id).delete
```

Running the above command will throw the following error:

```bash
SQLite3::ConstraintException: FOREIGN KEY constraint failed (ActiveRecord::InvalidForeignKey)
/Users/ruby/gems/3.0.0/gems/sqlite3-1.4.2/lib/sqlite3/statement.rb:108:in `step': FOREIGN KEY constraint failed (SQLite3::ConstraintException)
```

We are getting the above error because the task we have created above is
associated with the comment. `delete` will not delete associated records from
the database.

If we want to delete this task then first we have to delete its associated
comment from the comments table.

Here we can use the `destroy` method since it will also delete the associated
records from the database.

```bash
irb(main):005:0> Task.find_by_id(task.id).destroy
```

Once the above command is run, the task will be deleted successfully along with
its associated comment.

The usage of `delete` or `destroy` matters, based on the use case and context.

If multiple parent objects share common children object, then calling destroy on
specific parent object will destroy the children objects which are shared among
all parents.

So use the `delete` method when no association is there for the entity to be
deleted. In other cases where we have to destroy the associations too, use the
`destroy` method.

`destroy` also runs callbacks on the model while `delete` doesn't. For example
`before_destroy` and `after_destroy` callbacks.

Similarly we have `delete_all` and `destroy_all` methods. These methods behave
the same as `delete` and `destroy` methods but the only difference is that they
execute on all records matching conditions instead of one record.

Let's run the following command to exit from the console:

```bash
irb(main):006:0> exit
```

Let's commit changes made in this chapter:

```bash
git add -A
git commit -m "Added comments to tasks"
```
