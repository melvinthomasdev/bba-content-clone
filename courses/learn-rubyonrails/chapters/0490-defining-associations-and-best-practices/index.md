## What is an association in Rails?

In Rails, an association can be defined as a relationship between two Active
Record models. For example, in the Granite application, a task created by a
user. And each user can create multiple tasks thus building a relationship
between the `User` and `Task` models.

We will establish this relationship with the help of an association later in
this chapter.

## Types of associations

Rails support six types of associations:

### belongs_to association

A `belongs_to` association sets up a connection with another model, such that
each instance of the declaring model belongs to one instance of the other model.
For example, in a school database that has a student table and a group table,
each record in the student table belongs to a record in the group table.

A `belongs_to` association for the above example can be declared as follows:

```ruby
class Student
  belongs_to :group
end
```

Note, that the name of a belongs_to association must always be a singular term.
This is because a belongs_to association creates a relationship with a single
record. Rails knows this and infers the class name from the association name
itself. If the association name is wrongly pluralized, then the inferred class
will be wrongly pluralized too.

The corresponding migration would look like this:

```ruby
class CreateResults < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
```

In the above migration `t.references :group` will add a column named `group_id`
to the students table, which will store the primary key of the corresponding
group record. By passing option `foreign_key: true`, a foreign key constraint is
added and `null: false` will ensure that a foreign_key is present.

You can pass certain options to the belongs_to association. Here we will discuss
some important and frequently used options. These are as follows:

1. **class_name:** If the name of the other model cannot be derived from the
   association name, you can use the :class_name option to supply the model
   name. For example, if a student belongs to a cohort, but the actual name of
   the model containing students is group, you'd set things up this way:

```ruby
class Student < ActiveRecord::Base
  belongs_to :cohort, class_name: "Group"
end
```

In other words when you use an alias of the model name to name the association,
then you should pass the actual model name in the class_name option to make
Rails aware of the related model.

However, you shouldn't do so unless you have a strong reason for it. It is a
Rails convention to name the association after the model.

2. **foreign_key:** By convention, Rails assumes that the column used to hold
   the foreign key on this model is the name of the association with the suffix
   `_id` added. The :foreign_key option lets you set the name of the foreign key
   directly if you are using an alias for the association name like this:

```ruby
class Student < ActiveRecord::Base
  belongs_to :cohort, class_name: "Group", foreign_key: "group_id"
end
```

Keep in mind that doing so will not create a foreign key column called
student_id inside the result table. It can only be done using a migration.

3. **primary_key:** Rails assumes that the id column is used to hold the primary
   key of its tables. Suppose the primary key of the groups table is stored in
   the `g_id` instead of the `id` column then you can use the :primary_key
   option to specify `g_id` whose value should be used as the primary key like
   so:

```ruby
class Student < ActiveRecord::Base
  belongs_to :group, primary_key :g_id
end
```

4. **optional:** Consider a scenario where a student isn't a part of a group. In
   that case, you can declare an optional association. For the optional
   association to work, there shouldn't be a not null constraint on the
   `foreign_key` column in the table for the declaring model. For such cases you
   can declare the association like this:

```ruby
class Student < ActiveRecord::Base
  belongs_to :group, optional: true
end
```

4. **polymorphic:** Passing true to the `:polymorphic` option indicates that
   this is a polymorphic association. Polymorphic associations are discussed in
   detail later in this chapter.

### has_one association

A `has_one` association sets up a one-to-one relationship with another model,
such that each instance of the declaring model contains one instance of the
other model. For example, in a school database that has a student table and a
result table, each record in the students table contains a record in the results
table.

A `has_one` association for the above example can be declared as follows:

```ruby
class Student
  has_one :result
end
```

The name of a has_one association must always be a singular term. Because a
has_one association creates a relationship with a single record of the other
model.

The corresponding migration would look like:

```ruby
class CreateResults < ActiveRecord::Migration
  def change
    create_table :students do |t|
    end

    create_table :results do |t|
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
```

The above migration will create a `student_id` column in the results table which
will store the primary key of the corresponding student record.

Note that the foreign key column will always be present inside the table for the
class declaring the belongs_to association. In this case it is the `results`
table.

You can also pass certain options to the has_one association. Some important
options which you might need to pass often are as follows:

1. **class_name:** This option is used to specify the name of the model class
   when it cannot be inferred from the association name. For example, if a
   student has one "final result", but the actual name of the model containing
   the final result is "Result", you'd set things up this way:

```ruby
class Student < ActiveRecord::Base
  has_one :final_result, class_name: "Result"
end
```

You should always name the association after the model as it is the Rails
convention.

2. **primary_key:** By convention, Rails assumes that the column used to hold
   the primary key of a model is id. You can override this and explicitly
   specify the primary key with the :primary_key option.

   For example, if the students table has id as the primary_key but it also has
   a st_id column. The requirement is that the results table should hold the
   `st_id` column value as the foreign key and not id value. This can be
   achieved like this:

```ruby
class Student < ApplicationRecord
  has_one :result, primary_key: :st_id
end
```

3. **foreign_key:** By convention, Rails assumes that the column used to hold
   the foreign key on the other model is the name of this model with the suffix
   `_id` added. For example, if the name of the foreign key column in the
   results table is `st_id` instead of `student_id` then :foreign_key option
   lets you set the name of the foreign key directly like this:

```ruby
class Student < ActiveRecord::Base
  has_one :final_result, foreign_key: :st_id
end
```

Keep in mind that doing so will not create a foreign key column called
student_id inside the result table. It can only be done using a migration.

4. **dependent:** This option controls what happens to the associated record
   when its owner is destroyed:

   - `dependent: :destroy` causes the associated object to also be destroyed.

   - `dependent: :delete` causes the associated object to be deleted directly
     from the database (so callbacks will not execute).

   - `dependent: :nullify` causes the foreign key to be set to NULL. Callbacks
     are not executed.

   - `dependent: :restrict_with_exception` causes an exception to be raised if
     there is an associated record.

   - `dependent: :restrict_with_error` causes an error to be added to the owner
     if there is an associated object.

5. **as:** Setting the :as option indicates that this is a polymorphic
   association. Polymorphic associations are discussed in detail later in this
   chapter.

6. **through:** The :through option specifies a join model through which to
   perform the query. We will learn more about this option in the
   [`has_one :through` associations](/learn-rubyonrails/defining-associations-and-best-practices#has-one-through-association)
   which we have discussed in detail later in this chapter.

### has_many association

A has_many association establishes a one-to-many relationship with another
model. You'll often find this association on the other side of a belongs_to
association. This association indicates that each instance of the model has zero
or more instances of another model. For example, a one-to-many relationship
between students and projects can be declared using a has_many association like
so:

```ruby
class Student < ActiveRecord::Base
  has_many :projects
end
```

The association name should be plural because a parent record can have multiple
associated records.

The corresponding migration would look like this:

```ruby
class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
```

The above migration will create a foreign key column called `student_id` in the
projects table which will store the primary key of the corresponding student
record.

Note that the foreign key column will always be present inside the table for the
class declaring the belongs_to association. We don't need to mention anything in
student table migration because Student should be created first before projects
are created.

You can pass certain options to the has_one association. Some important options
which you might need to pass often are as follows:

1. **class_name:** This option is used to specify the name of the model class
   when it cannot be inferred from the association name. For example, if a
   student has many assignments, but the actual name of the model containing
   assignment is "Project", you'd set things up this way:

```ruby
class Student < ActiveRecord::Base
  has_many :assignments, class_name: "Project"
end
```

You should always name the association after the model as it is the Rails
convention.

2. **foreign_key:** By convention, Rails assumes that the column used to hold
   the foreign key on the other model is the name of this model with the suffix
   \_id added. For example, if the name of the foreign key column in the results
   table is `st_id` instead of `student_id` then :foreign_key option lets you
   set the name of the foreign key directly like this:

```ruby
class Student < ActiveRecord::Base
  has_many :projects, foreign_key: :st_id
end
```

Keep in mind that doing so will not create a foreign key column called
student_id inside the result table. It can only be done using a migration.

3. **primary_key:** By convention, Rails assumes that the column used to hold
   the primary key of a model is id. You can override this and explicitly
   specify the primary key with the :primary_key option.

   For example, if the students table has id as the primary_key but it also has
   a st_id column. The requirement is that the results table should hold the
   `st_id` column value as the foreign key and not id value. This can be
   achieved like this:

```ruby
class Student < ApplicationRecord
  has_many :result, primary_key: :st_id
end
```

4. **dependent:** This option controls what happens to the associated record
   when its owner is destroyed:

   - `dependent: :destroy` causes the associated objects to also be destroyed.

   - `dependent: :delete_all` causes the associated objects to be deleted
     directly from the database (so callbacks will not execute).

   - `dependent: :nullify` causes the foreign key to be set to NULL. Callbacks
     are not executed.

   - `dependent: :restrict_with_exception` causes an exception to be raised if
     there is an associated record.

   - `dependent: :restrict_with_error` causes an error to be added to the owner
     if there is an associated object.

5. **as:** Setting the :as option indicates that this is a polymorphic
   association. Polymorphic associations are discussed in detail later in this
   chapter.

6. **through:** The :through option specifies a join model through which to
   perform the query. We will learn more about this option in the
   [`has_many :through` associations](/learn-rubyonrails/defining-associations-and-best-practices#has-many-through-association)
   associations which we have discussed in detail later in this chapter.

### The has_and_belongs_to_many association

A `has_and_belongs_to_many` association creates a direct many-to-many connection
with another model. This association indicates that each instance of the
declaring model refers to zero or more instances of another model. For example,
consider a hospital where a doctor can have many patients and a patient can have
many doctors too. This many-to-many relationship can be declared using a
`has_and_belongs_to_many` association like this:

```ruby
class Doctor < ApplicationRecord
  has_and_belongs_to_many :patients
end

class Patient < ApplicationRecord
  has_and_belongs_to_many :doctors
end
```

The association name should always be plural because there can be multiple
related entities.

A many-to-many relationship is established with the help of a join table. A join
table is created where each record contains the primary keys of related patient
and doctor records.

You need to explicitly create the joining table. Unless the name of the join
table is explicitly specified by using the :join_table option in the
`has_and_belongs_to_many` association, Active Record creates the name by using
the lexical order of the pluralized class names. So a join between doctor and
patient models will give the default join table name of "doctors_patients"
because "d" outranks "p" in lexical ordering.

The corresponding migration might look like this:

```ruby
class CreateDoctorsAndPatients < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.timestamps
    end

    create_table :patients do |t|
      t.string :name
      t.timestamps
    end

    create_table :doctors_patients, id: false do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
    end

    add_index :doctors_patients, :doctor_id
    add_index :doctors_patients, :patient_id
  end
end
```

In the above migration, `doctors_patients` is the join table. We have passed
`id: false` argument to the `create_table` method so that the new table does not
have a id column for storing the primary key.

We pass `id: false` to create_table because that table does not represent a
model. Rails will use the join table internally to fetch records. For example,
when `doctor.patients` is called, Rails will internally search all the records
within the join table where doctor's id is a match and return the corresponding
patient records.

We have also indices on `doctor_id` and `patient_id` column because data will be
queried from the `doctors_patients` table using the values in those columns and
adding indices will improve database read speeds.

**Note that we shouldn't be creating combined migrations like this in one file.
Migrations should be atomic in the sense that a single migration should not
affect multiple tables like in the example shown above. Above code is only for
demonstration purposes.**

You can also use the `create_join_tables` method to create a join table like this:

```ruby
class CreateDoctorsPatientsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :doctors, :patients do |t|
      t.index :doctor_id
      t.index :patient_id
    end
  end
end
```

There are a number of options you can pass to the `has_and_belongs_to_many`
association:

1. **association_foreign_key:** By convention, Rails assumes that the column in
   the join table used to hold the foreign key pointing to the other model is
   the name of that model with the suffix `_id` added.

If the foreign key column in the join table that stores the doctor's id is
called `physician_id` rather than `doctor_id` then, you can use the
`:association_foreign_key` option inside the `Patient` model to set the name of
the foreign key directly like this:

```ruby
class Patient < ApplicationRecord
  has_and_belongs_to_many :doctors, association_foreign_key: :physician_id
end
```

2. **foreign_key:** By convention, Rails assumes that the column in the join
   table used to hold the foreign key pointing to this model is the name of this
   model with the suffix \_id added.

If the foreign key column in the join table that stores the doctor's id is
called `physician_id` rather than `doctor_id` then. you can use the :foreign_key
option inside the `Doctor` model to set the name of the foreign key directly
like this:

```ruby
class Doctor < ApplicationRecord
  has_and_belongs_to_many :patients, foreign_key: :physician_id
end
```

3. **class_name:** If the name of the other model cannot be derived from the
   association name, you can use the :class_name option to supply the model
   name.

For example, if a patient has many physicians, but the actual name of the model
containing assemblies is Doctor, then you can use the `:class_name` option to
explicitly specify the actual model name like this:

```ruby
class Patient < ApplicationRecord
  has_and_belongs_to_many :physicians, class_name: "Doctor"
end
```

4. **join_table:** If the default name of the join table, based on lexical
   ordering, is not what you want, you can use the :join_table option to
   override the default.

For example, in the above example, if we wanted to name the join table
`patients_doctors` then we could have used the join_table option like this:

```ruby
class Doctor < ApplicationRecord
  has_and_belongs_to_many :patients, join_table: :patients_doctors
end

class Patient < ApplicationRecord
  has_and_belongs_to_many :doctors, join_table: :patients_doctors
end
```

### The has_many :through association

A `has_many :through` association is often used to set up a many-to-many
connection with another model. This association indicates that the declaring
model can be matched with zero or more instances of another model by proceeding
through a third model. For example, consider a hospital where patients have
appointments with doctors. Patients and doctors share a many-to-many
relationship with each other as well as with appointments. The relevant
association declarations could look like this:

```ruby
class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctor, through: :appointments
end
```

The corresponding migration will look like this:

```ruby
class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.timestamps
    end

    create_table :patients do |t|
      t.string :name
      t.timestamps
    end

    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
```

You must be wondering why we didn't use a `has_and_belongs_to_many` association
to declare a many-to-many relationship between the doctors and patients like we
did in the last section. If you recall, for `has_and_belongs_to_many` to work,
we have to declare a join table. Although the join table would look very similar
to the appointments table, it would be used internally by Rails since we don't
declare a corresponding join model for the join table to work with it.

In this case, we want to work with appointments as a separate entity. That is
why we have declared a separate model for appointments. This also allows us to
have validations, callbacks and extra attributes inside the appointments model.

You should use the `has_many :through` association when you want to work with
the join model as a separate entity.

If you notice `has_many :through` is actually a `has_many` association with a
`through` option. You can use all the options of a `has_many` association along
with the `through` option.

### The has_one :through association

A `has_one :through` association sets up a one-to-one connection with another
model. This association indicates that the declaring model can be matched with
one instance of another model by proceeding through a third model. For example,
if each supplier has one account, and each account is associated with one
account history, then the supplier model could look like this:

```ruby
class Supplier < ApplicationRecord
  has_one :account
  has_one :account_history, through: :account
end

class Account < ApplicationRecord
  belongs_to :supplier
  has_one :account_history
end

class AccountHistory < ApplicationRecord
  belongs_to :account
end
```

The corresponding migration might look like this:

```ruby
class CreateAccountHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps
    end

    create_table :accounts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :account_number
      t.timestamps
    end

    create_table :account_histories do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :credit_rating
      t.timestamps
    end
  end
end
```

Doing so will enable you to fetch the account_history for a supplier using
`supplier.account_history.`

## Polymorphic associations

So far we have seen how to leverage associations in Rails to build one-to-one,
one-to-many and many-to-many associations in Rails. Let's see how we can declare
a polymorphic relation in Rails. Polymorphic associations declare a relationship
between entities where one entity can belong to multiple entities.

For example, in a company database, a picture can either belong to an employee
or a product. The relevant association can be declared like this:

```ruby
class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end
```

To make this work, you need to declare both a foreign key column and a type
column in the model that declares the polymorphic interface.

The corresponding migration can be declared like this:

```ruby
class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string  :name
      t.bigint  :imageable_id
      t.string  :imageable_type
      t.timestamps
    end

    create_table :employees do |t|
      t.string :name
    end

    create_table :products do |t|
      t.string :name
    end

    add_index :pictures, [:imageable_type, :imageable_id]
  end
end
```

Rather than specifying the `imageable_id` and `imageable_type` columns in the
above migration, we could have simplified it like this:

```ruby
create_table :pictures do |t|
  t.string  :name
  t.references :imageable, null: false, foreign_key: true, polymorphic: true
  t.timestamps
end
```

Passing `polymorphic: true` to `t.references` is the same as specifying
`imageable_id` and `imageable_type` columns separately.

In the above example, you can retrieve a collection of pictures from an instance
of the Employee model using `@employee.pictures`.

Similarly, you can retrieve using a product object using `@product.pictures`.

If you have an instance of the Picture model, you can get to its parent via
`@picture.imageable`.

The above example denotes a one-to-many polymorphic association. But polymorphic
associations aren't restricted to one-to-many relationships and they can exist
between one-to-one and many-to-many relationships as well. A polymorphic
relation isn't a separate category of relations between models. It is in fact a
subset of the other types of relationships.

## Defining associations in User model

In the Granite application, a user can have many tasks assigned to them and from
Rails perspective, those tasks belong to a user.

Since a user can have many tasks assigned to them, we will declare a `has_many`
association called `assigned_tasks` in the `User` model.

No need to worry about `assigned_tasks` now. It's a custom association name. We
will discuss about why we have used a custom association name after adding the
code to the respective file.

Add the following line into the `user.rb` file:

```ruby {2}
class User < ApplicationRecord
  MAX_NAME_LENGTH = 255
  has_many :assigned_tasks, foreign_key: :assigned_user_id, class_name: "Task"

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
```

By default Rails infers the associated class's name from the association name
itself and the foreign key to be a column in the associated table with the same
name as that of the declaring class in lower-case and `_id` suffixed.

But we have used a custom association name hence Rails cannot infer the
aforementioned details from the association name. That's why we have passed the
class_name and foreign_key options to the has_many association.

```ruby
class User
  has_many :tasks
end
```

Note that, it is suggested to name associations after the class name for
simplicity but we have deferred from that here because later in this book we
will be adding another association between the `User` model and the `Task` model
for task owner. Hence, we have named the association accordingly to avoid
confusion, given that later there will be two foreign keys between `Task` and
`User` models.

Similarly we can declare a `belongs_to` association in the `Task` model. Add the
following line into the `task.rb` file:

```ruby {2}
class Task < ApplicationRecord
  belongs_to :assigned_user, foreign_key: "assigned_user_id", class_name: "User"

  # previous code

  private

    # previous code
end
```

Don't get confused by the plural and singular association names. In Rails we
follow certain naming conventions. To understand the naming convention we have
used for associations you can refer to
[naming model associations section](/learn-rubyonrails/summarizing-rails-naming-conventions#naming-model-associations)
in the in-depth chapter where we have summarized most of the Rails naming
conventions. You can refer to it whenever you are confused about the naming and
come back.

## Create child record using parent association

Let us understand how we can leverage associations to create child records using
parent records. In the Granite application, a user has many assigned_tasks. You
can create a new assigned_task for a certain user like this:

```ruby
Task.create(task_attributes.merge(assigned_user_id: user.id))
```

Or you can use the `assigned_tasks` association declared in the `User` model to
create a new task for the user like this:

```ruby
user.assigned_tasks.create(task_params)
```

In the latter approach you don't need to explicitly pass the user id while
creating a new task record. It looks more concise and clean.

This is possible because association methods such as `belongs_to`, `has_many`
etc are macros. Macros in Ruby are class methods that generate instance methods.
To learn about how macros works in depth you can refer to the
[Rails macros and metaprogramming chapter](/learn-rubyonrails/rails-macros-and-metaprogramming)
in this book.

`collection.create` is one of the instance methods that is added to the
declaring model when you declare a `has_many` association. `collection` is
replaced by the association name.

There are several other methods as well which you can use in your code for
performing CRUD operations on data. For example, you can use the getter and
setter methods added by the `has_many` association in the User model like this:

```ruby
user.assigned_tasks  # returns a collection of all assigned tasks of the user
user.assigned_tasks = collection_of_task_records  # saves a list of tasks as assigned tasks of the user
```

It is considered good practice to use these instance methods added by
associations to perform various operations on data.

For a list of methods added by each association in the declaring model you can
refer to the
[official documentation](https://guides.rubyonrails.org/association_basics.html#detailed-association-reference#macros-in-rails).

Now let's commit the changes:

```bash
git add -A
git commit -m "Added association in User model for assigned tasks"
```
