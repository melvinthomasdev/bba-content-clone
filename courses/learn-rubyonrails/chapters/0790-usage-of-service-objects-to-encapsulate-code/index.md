In the previous chapter, we created a Sidekiq job to log tasks at the moment of their creation. Now, in this chapter, we will customize this message. For instance, if a task titled 'Update Rails Version' is created by Oliver Smith and assigned to Alice Smith, the message will be:

```
A task titled 'Update Rails Version' was created by Oliver Smith and is assigned to Alice Smith.
```

If the task is self-assigned, for example, by Oliver Smith, then the message will be:

```
A task titled 'Update Rails Version' was created and self-assigned to Oliver Smith.
```

We can modify `TaskLoggerJob` to craft the appropriate message as follows:

 ```ruby
 class TaskLoggerJob
  include Sidekiq::Job

  def perform(task_id)
    task = Task.find(task_id)
    task_owner = User.find(task.task_owner_id)

    if task.task_owner_id == task.assigned_user_id
      message = "A task titled '#{task.title}' was created and self-assigned to #{task_owner.name}."
    else
      assigned_user = User.find(task.assigned_user_id)
      message = "A task titled '#{task.title}' was created by #{task_owner.name} and is assigned to #{assigned_user.name}."
    end

    log = Log.create!(task_id: task.id, message:)
    puts log.message

  end
end
 ```

The primary function of the `TaskLoggerJob` is to log a message whenever a task is created. However, by incorporating the additional logic for customizing the message, the code has expanded and now encompasses more than one responsibility.

As the application grows, it's impractical to encapsulate multiple functionalities within a single controller, model, or job. This leads to difficulties in managing the code. Adhering to principles of clean architecture and maintainability, it's crucial to delegate distinct responsibilities to dedicated components, thereby simplifying the codebase and enhancing its testability. This is where the service objects come into play.

## Service Objects

Service objects are Plain Old Ruby Objects (PORO) designed to efficiently execute a single, specific action within your domain logic. They are the go-to solution for operations that fall outside the scope of what a model should be concerned with, such as sending SMS, delivering emails, making calls to external services, or parsing CSV files. They are organized within `app/services` directory of our application.

Let us now move the customization of the message to `LoggerMessageBuilderService`. Rails does not provide any built-in generators to create services. Currently, we can only manually create the service as well as its test file.

```bash
mkdir -p app/services
touch app/services/logger_message_builder_service.rb
```

Open the `logger_message_builder_service.rb` file and paste the following:

```ruby
# frozen_string_literal: true

class LoggerMessageBuilderService
  attr_reader :task

  def initialize(task)
    @task = task
  end

  def process!
    build_message
  end

  private

    def build_message
      if self_assigned?
        "A task titled '#{task.title}' was created and self-assigned to #{task_owner.name}."
      else
        "A task titled '#{task.title}' was created by #{task_owner.name} and is assigned to #{assigned_user.name}."
      end
    end

    def self_assigned?
      task.task_owner_id == task.assigned_user_id
    end

    def task_owner
      task_owner = User.find(task.task_owner_id)
    end

    def assigned_user
      assigned_user = User.find(task.assigned_user_id)
    end
end
```

Typically, at BigBinary, we structure a service with a `process` method serving as the entry point. Additionally, the use of the `!` (bang) operator is implemented to ensure exceptions are raised if either `task_owner` or `assigned_user` is not found. The importance of the bang method is covered in the [Using bang method](https://courses.bigbinaryacademy.com/learn-rubyonrails/using-bang-method/) chapter.

The `initialize` method in Ruby acts as a constructor, used to set up instance variables during object creation. This method is invoked implicitly even if no instance variables are initialized.

When an attribute needs to be accessed across multiple methods within the class, it's best practice to declare it as an instance variable within the `initialize` method. At BigBinary, we use the `attr_accessor` macro to facilitate access to instance variables throughout the class without having to prefix it with `@` symbol.

While building a service, it is crucial to modularize the code effectively and assign appropriately descriptive names to each method. This practice ensures that the code remains readable and maintainable. Moreover, a well-organized and clearly named codebase supports the DRY (Don't Repeat Yourself) principle, preventing redundancy and facilitating easier updates and maintenance.

Now, let's modify the `TaskLoggerJob` as follows:

```ruby
# frozen_string_literal: true

class TaskLoggerJob
  include Sidekiq::Job

  def perform(task_id)
    task = Task.find(task_id)
    message = LoggerMessageBuilderService.new(task).process!

    log = Log.create!(task_id: task.id, message:)
    puts log.message
  end
end
```

## Testing services

Another compelling reason for utilizing services is their ability to isolate business logic, allowing us to thoroughly test and ensure its correctness and reliability in various scenarios.

As mentioned earlier, there is no Rails generator for services.
So let's create the `services` directory within `test` and a testing file for `LoggerMessageBuilderService` in it:

```bash
mkdir -p test/services
touch test/services/logger_message_builder_service_test.rb
```

Open the file and paste the following into it:

```ruby
# frozen_string_literal: true

require "test_helper"

class LoggerMessageBuilderServiceTest < ActiveSupport::TestCase
  def setup
    @task_owner = create(:user, name: "Oliver Smith", id: 1)
    @assigned_user = create(:user, name: "Alice Jones", id: 2)
    @task_title_1 = "Check Assignments"
    @task_title_2 = "Prepare Report"
    @self_assigned_task = create(:task, title: @task_title_1, task_owner_id: 1, assigned_user_id: 1)
    @other_assigned_task = create(:task, title: @task_title_2, task_owner_id: 1, assigned_user_id: 2)
  end

  def test_should_return_self_assigned_message
    service = LoggerMessageBuilderService.new(@self_assigned_task)
    message = service.process!

    expected_message = "A task titled '#{@task_title_1}' was created and self-assigned to #{@task_owner.name}."
    assert_equal expected_message, message
  end

  def test_should_return_other_assigned_message
    service = LoggerMessageBuilderService.new(@other_assigned_task)
    message = service.process!

    expected_message = "A task titled '#{@task_title_2}' was created by #{@task_owner.name} and is assigned to #{@assigned_user.name}."
    assert_equal expected_message, message
  end
end
```

## When should you use a service?

Identifying scenarios when a service is the appropriate solution is crucial.

- Controller Responsibilities: If your code is primarily involved in handling routing, parameters, or other controller-specific functions, then it is not suitable to use a service. Such code inherently belongs within the controller layer of your application.

- Shared Code Across Controllers: When there is shared code among different controllers, refrain from utilizing a service. Instead, employ a concern to encapsulate shared functionality effectively. We will be talking about concerns in an upcoming chapter.

- Specific Business Actions: Conversely, when the code represents a distinct business action, such as "generate a PDF", or "send an email", a service is highly appropriate. Such operations, which do not logically fit within either controllers or models, are ideal candidates for service object implementation.

- Testing Requirements: If a piece of code, even a small one, demands thorough testing due to its critical nature or complexity, it's beneficial to encapsulate it in a service. Moving logic into a service allows for more focused and isolated tests, ensuring that the functionality is reliable and works as expected without being intertwined with other components of the application.

Now, let's commit the changes:

```bash
git add -A
git commit -m "Added service to customize task logger message."
```
