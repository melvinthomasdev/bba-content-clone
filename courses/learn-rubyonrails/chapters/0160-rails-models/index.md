## What are models?

In simple terms, models are Ruby classes that can hold the value of a single row
in a database table. Since they all inherit `ActiveRecord::Base` through
`ApplicationRecord` class, they are equipped with all the `ActiveRecord` methods
which enables them to interact with the database.

Unlike most other frameworks, we won't be rewriting all the fields in a Rails
model definition. The fields are the column names in the mapped table. Rails
will dynamically add the fields with their value it creates an instance of the
model.

So, if there aren't any custom logic or configuration, the model definition will
be an empty class.

## Creating Task model

In one of the previous chapters, we had added a migration script that creates a
new `tasks` table. The table contained a single column, `title` apart from the
special columns (`created_at`, `updated_at`).

Now we can define our `Task` model. Run this command in the terminal opened at
project's root folder:

```bash
touch app/models/task.rb
```

The file `task.rb` is now created. Open file `app/models/task.rb` and add
following lines and save it:

```ruby
class Task < ApplicationRecord
end
```

We are done! We have created our first model, `Task`.

## Model and database mapping

Let's understand the mapping of a model to the database by considering our
`Task` model as example:

1. The model `Task` in the application maps to the `tasks` table in database.
2. The instance(object) of `Task` represents a database row in the `tasks`
   table.
3. When we created `tasks` table in database using migration in the previous
   chapter, we had added fields like `title`.
4. Thus the attribute `title` of the `Task` model maps to the corresponding
   `title` column of the `tasks` table in the database.

## Auto generating model definitions

Actually, we don't need to manually code all these migration and Task definition
boilerplate every time we create a new model. Rails provides us with commands to
generate models and migrations in one go:

```bash
bundle exec rails generate model Task title:string
```

If you run this command now, it will exit without making any changes to our
files:

```sh
% rails generate model Task title:string
Running via Spring preloader in process 20194
      invoke  active_record
The name 'Task' is either already used in your application or reserved by Ruby on Rails.
Please choose an alternative or use --skip-collision-check or --force to skip
this check and run this generator again.
```

This is because we already have created the files. Leave it for now. We will use
this command when we generate our next model.

This command will generate model, migration, and test files for us and we
wouldn't have to write any code. Also, this will keep the linguistic convention,
that Rails uses for naming, intact. i.e. table will be named plural and the
model will be singular.

The migration generation command and model generation command have different use
cases. Migrations are atomic and thus needn't maintain one-to-one mapping with
model files. But that's not the same case when coming to models. If we are
generating a new model then we need a migration to add it to database. That's
why the latter command generates both in one go.

Now, let us commit the changes we have made before proceeding to the next
chapter.

```bash
git add -A
git commit -m "Added Task model"
```