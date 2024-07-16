## What is authorization?

Authorization is a process in which we allow or restrict access to certain
resources.

Let's assume that task-1 is assigned to Oliver and task-2 is assigned to Eve.
The way the code is right now, Oliver can see Eve's tasks and Eve can see
Oliver's task. That's not right.

So, let us introduce authorization to our application.

## Features

By the end of the chapter, our application will have the following changes.

- Only the tasks assigned to, or created by the logged in user, will be
  displayed in their dashboard.
- Only the creator or assignee will be allowed to view the details of a `Task`.
  For others, the request will result in authorization error.
- Only the creator of a task will be allowed to delete it.
- Only the creator is allowed to change title or to reassign the task.

## Technical design

We will be using [Pundit](https://github.com/varvet/pundit) gem to do the
authorization work.

Pundit helps us in managing role based authorization using policies defined in
simple Ruby Classes.

- We will create a new Ruby class named `TaskPolicy` and define the
  authorization conditions in it.
- Pundit associates methods in this class with our controller actions. It
  executes the method corresponding to the action when a request is received. If
  its result is false, access is denied and an error is thrown. Otherwise the
  action will be executed as normal.
- This approach doesn't work for our index action. We need it to run for every
  authenticated user. The requirement is to narrow down the results to only the
  ones that are relevant to the user.
- We can use the policy scopes of pundit to filter the tasks. It will let us add
  additional conditions on the method we use to fetch tasks from database.
  Therefore the result will contain only those tasks that the requesting user is
  authorized to see.

Let us see this in action.

## Pundit gem installation

Add the this line to the Gemfile:

```ruby
gem "pundit"
```

Now, install the gem:

```bash
bundle install
```

Include `Pundit` in the `ApplicationController` class like this:

```ruby{2}
class ApplicationController < ActionController::Base
  # previous code
  include Pundit::Authorization
end
```

## Introducing policies

Policies contain the authorization for an action. Let's create a policy:

```bash
mkdir app/policies
touch app/policies/task_policy.rb
```

Open `task_policy.rb` and add following lines of code:

```ruby
class TaskPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def show?
    # some condition which returns a boolean value
  end
end
```

Pundit makes the following assumptions about this class:

- The class has the same name as that of model class, only suffixed with the
  word "Policy". Hence, the name TaskPolicy.
- The first argument is a `user`. In your controller, Pundit will call the
  `current_user` method, which we had defined in `ApplicationController`, to
  retrieve what to send into this argument.
- The second argument is that of a model object, whose authorization you want to
  check.
- The class implements some kind of query method, in this case `show?`. Usually,
  this will map to the name of a particular controller action.

## Adding policy checks in TaskPolicy

Now let's look at the required code for class `TaskPolicy`:

```ruby
class TaskPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  # The show policy check is invoked when we call `authorize @task`
  # from the show action of tasks controller.
  # Here the condition we want to check is that
  # whether the record's creator is current user or record is assigned to the current user.
  def show?
    task.task_owner_id == user.id || task.assigned_user_id == user.id
  end

  # The condition for edit policy is the same as that of the show.
  # Hence, we can simply call `show?` inside the edit? policy here.
  def edit?
    show?
  end

  # Only owner is allowed to update a task.
  def update?
    task.task_owner_id == user.id
  end

  # Every user can create a task, hence create? will always returns true.
  def create?
    true
  end

  # Only the user that has created the task, can delete it.
  def destroy?
    task.task_owner_id == user.id
  end
end
```

Now, let's add the authorize method to our controller actions. The required code
is added as follows:

```ruby
class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update destroy]

  def index
    tasks = Task.all.as_json(include: { assigned_user: { only: %i[name id] } })
    render_json({ tasks: })
  end

  def create
    task = current_user.created_tasks.new(task_params)
    authorize task
    task.save!
    render_notice(t("successfully_created", entity: "Task"))
  end

  def show
    authorize @task
  end

  def update
    authorize @task
    @task.update!(task_params)
    render_notice(t("successfully_updated", entity: "Task")
  end

  def destroy
    authorize @task
    @task.destroy!
    render_json
  end

  private

    def task_params
      params.require(:task).permit(:title, :assigned_user_id)
    end

    def load_task!
      @task = Task.find_by!(slug: params[:slug])
    end
end
```

We have added the line `authorize @task` to `show, update and destroy` actions
after initializing our `@task` instance variable.

The authorize method automatically infers that `Task` will have a matching
`TaskPolicy` class, and instantiates this class, handing in the current user and
the given record (@task in this case).

It then infers from the action name, that it should call the respective action
of class `TaskPolicy`.

For example, the instance created by the authorize @task inside the show action,
will call the `show?` action of Policy class.

From a high level overview, pundit `authorize` method in `TasksController#show`
action, works something similar to below mentioned code:

```ruby
unless TaskPolicy.new(current_user, @task).show?
  raise Pundit::NotAuthorizedError, "not allowed to show? this #{@task.inspect}"
end
```

This raises an exception. But Pundit allows us to rescue the exception with a
method of our choice. So, let's add the exception handling for `Pundit` inside
the `application_controller.rb` file like this:

```ruby {3, 9-11}
class ApplicationController < ActionController::Base
  # previous code
  rescue_from Pundit::NotAuthorizedError, with: :handle_authorization_error

  private

    # previous code

    def handle_authorization_error
      render_error("Access denied. You are not authorized to perform this action.", :forbidden)
    end
end
```

So whenever an action in TaskPolicy returns false it means the authorization has
failed. When an authorization fails then we are raising an exception. The
exception is rescued by method `handle_authorization_error`.

Let's say there exists a task with slug of `task-slug` and a user with name
"Oliver". Task with slug of `task-slug` is neither created by Oliver nor
assigned to Oliver. Oliver logs in by entering his email and password. Now
Oliver, enters the URL `localhost:3000/tasks/task-slug/show`.

Since Oliver is not authorized to view the task because of the above
assumptions, rather than throwing him an error (the red page), Pundit raises an
exception and rescues it by calling the method `handle_authorization_error`.

Let's define `authorization.denied` message in our `en.yml` file:

```yaml {2-3}
en:
  authorization:
    denied: "Access denied. You are not authorized to perform this action."
```

Let's use the `authorization.denied` translation string. Update the
`application_controller.rb` file like this:

```rb {5}
class ApplicationController < ActionController::Base
  # rest of the code

  def handle_authorization_error
    render_error(t("authorization.denied"), :forbidden)
  end
```

## Introducing policy scope

If you closely observe, we did not make a change to our index action. As index
action returns a collection of records, we need to apply a condition on a
collection, and we do that by using `Policy Scope`.

As we want to have our index view to display only the tasks which are either
created by the current_user or assigned to the current_user, we will define a
class called a policy scope. This class is nested inside the class `TaskPolicy`:

```ruby
class TaskPolicy

 #------previous code -------

 #------add new lines here----
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(task_owner_id: user.id).or(scope.where(assigned_user_id: user.id))
    end
  end
end
```

Pundit makes the following assumptions about this class:

- The class has the name Scope and is nested under the policy class.

- The first argument is a user. In your controller, Pundit will call the
  current_user method to retrieve what to send into this argument.

- The second argument is a scope which is a collection of records.

- Instances of this class respond to the method resolve.

- This method contains the query run on the scope defined and then returns a
  result which is a collection and can be iterated over.

The corresponding change we make in the index action of Tasks controller is as
follows:

```ruby
def index
  #------new line added here------
  tasks = TaskPolicy::Scope.new(current_user, Task).resolve
  #-----end of added line-------
end
```

Let's observe what's going on here-

- Pundit creates an instance of class Scope (nested inside the class TaskPolicy)
  passing along the `current_user` and the `Task` model (our `scope` in this
  case) as parameters which get set in the `@user` and `@scope` instance
  variables respectively inside the initialize method.

- Now this instance calls the method `resolve` where we run a query on our scope
  and it returns a collection of tasks which only have the tasks that are either
  created by or assigned to the current_user.

Now to make it easier Pundit provides syntactic sugar where we can replace the
line `TaskPolicy::Scope.new(current_user, Task).resolve` simply with the syntax
`policy_scope(Task)`. It works exactly the same way as described before.

Now, replace your index method with the following lines:

```ruby {2-4}
def index
  tasks = policy_scope(Task)
  tasks_with_assigned_user = tasks.as_json(include: { assigned_user: { only: %i[name id] } })
  render_json({ tasks: tasks_with_assigned_user })
end
```

Now, we have added authorization to all our actions in task controller. But what
if we forgot to call authorize function in every action? Or if someone changed
the code and removed it by accident?

It would be a serious security loophole.

To catch such errors in a fail-fast way, `Pundit` provides us some helper
methods.

Add these lines to our `TasksController`:

```ruby {2,3}
class TasksController < ApplicationController
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :load_task!, only: %i[show update destroy]
  # previous code...
```

In addition to `before` filters, you can also run filters after an action has
been executed. The `after` filters are registered via `after_action`.

These Rails filters help us keep the code DRY.

The above code will ensure we get an error if `policy_scope` or `authorize`
methods were not called during execution of the action. Refer the
[official documentation of Pundit](https://github.com/varvet/pundit#ensuring-policies-and-scopes-are-used)
for a better insight on `verify_authorized` and `verify_policy_scoped` methods.

The reason we call `verify_authorized` and `verify_policy_scoped` with
`after_action` is because we can only check whether policies have been applied
or not, only after the policies have had an opportunity to act i.e. that the
controller action has run completely. Thus we can only use the `after` filter.

You can learn more about how Pundit helps in ensuring policies and scopes are
used from the
[official documentation](https://github.com/varvet/pundit#ensuring-policies-and-scopes-are-used).

We have successfully implemented authorization in our application.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added pundit task policy"
```
