## What is an Enum?

An `ActiveRecord::Enum` type is a special data type that ensures that a variable
can hold only a certain predefined set of constant values.

For example in Rails this is how we define an `enum` type:

```ruby
enum :user_status, %i[online offline idle]
```

In the above example, `user_status` can only have values "online", "offline" and
"idle".

## Why should we use Enums?

Let us understand the use case of `Enums` with the help of an example. Suppose
we have a `Customer` class and `contact_method` as one of the attributes of the
class.

We wish to place a restriction so that `contact_method` can only have a finite
number of possible values.

One way to do this is to use the `inclusion` validation helper in Rails.

```ruby
class Customer
  validates :contact_method, inclusion: { in: %w[phone email] }
end
```

Note that `%w[phone email]` is short-hand notation for `["phone", "email"]`.

By adding an `inclusion` validation, we are making sure that `contact_method` is
equal to either "phone" or "email". This will get the job done but only at Rails
level. Our database layer is still unchecked.

Consider the following scenario where we are saving a customer record with
invalid `contact_method` value while skipping validations.

```ruby
customer = Customer.new(contact_method: "fax")
customer.save(validate: false)
```

Calling `save` with `(validate: false)` will skip all model validations while
saving the record into the database and this will compromise the integrity of
our database.

We can also create separate table called `contact_methods` and create a
`belongs_to` association with the `customers` table in the following way:

```ruby
class Customer
  has_one :contact_method
end
```

```ruby
class ContactMethod
  belongs_to :customer
end
```

Every customer will have an associated contact_method record from the
`contact_methods` table which will contain the contact method name as well as
contact details.

This would work but in turn the size of our database will increase and the
application will become bulky as well.

It is pretty evident that merely validations are not enough, we need to check
our database layer as well and we cannot have unnecessary associations. This is
where `Enums` come into picture.

## Migration for Enum type

Now, let's see how we can add a column for an enum attribute using migration. We
already know that the column needs to be an integer type in database.

```ruby
class AddContactMethodToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :contact_method, :integer, default: 0
  end
end
```

Adding a default value is optional and depends upon the application. We can add
a default value using `_default` key. But in Rails 7, `_default` has been
changed to `default`. You can also set a default value in the model itself like
so:

```ruby
class Customer
  enum :contact_method, { phone: 0, email: 1 }, default: :phone
end
```

## How Enums are stored in database?

When we declare an enum attribute in Rails, its value is equal to one of the
values from a set of predefined constants and it maps to an integer in database.
Let's simplify this with the help of an example.

```ruby
class Customer
  enum :contact_method, %i[phone email]
end
```

When we create a database migration for an enum attribute, the column needs to
be an integer, and in this case it will contain either `0` or `1` as value.

`0` is mapped to "phone" and `1` is to "email". In general, the `nth` element is
mapped to integer value `n-1`. Hence the order of values for enum matters a lot.

If we change this order then the repercussions can be catastrophic because
changing the order of the enum values will break the mapping as we might already
have data stored where `customer.contact_method` is `0`, which used to be mapped
to `phone` but now it might map to something else.

We will see how to overcome this flaw in the next section.

Now, if we try to save an invalid value for an enum attribute into the database,
the transaction will not succeed. Because Rails will attempt to map the
attribute's value with an integer during object initialization and it will fail
because the invalid value passed isn't a part of the predefined values.

This will cause Rails to throw an `ArgumentError` hence preserving the integrity
of our database.

## How to use Enums?

Inside a Rails model class, the set of predefined values for enums can be
declared as an array or hash.

When declared as an array:

```ruby
class Customer
  enum :contact_method, %i[phone email]
end
```

When declared as a hash:

```ruby
class Customer
  enum :contact_method, { phone: 0, email: 1 }
end
```

Latter is a better way to declare an enum attribute because of the following
reasons:

- Even if the order of values change, their integer mapping stays the same.

- It gives us more flexibility to choose which integers to use.

While saving a record with an enum attribute, you can either use the value or
its integer mapping. For example:

```ruby
Customer.new(contact_method: "phone")
```

Or, you can also use the integer value to save the record:

```ruby
Customer.new(contact_method: 0)
```

It is preferred to use the `string/symbol` value while writing queries given
that it is easily comprehensible.

## Querying using Enum types

Using enums also makes querying easier. Enum attributes can be queried by name.
For example, consider an object of the `Customer` class:

```ruby
customer.contact_method # phone, email or nil depending upon the integer value in database
customer.phone? # true if the contact method is phone, otherwise false
customer.email! # updates the contact_method to email
```

Rails also adds scopes based on the allowed values of the enum attribute. For
example:

```ruby
Customer.phone # produces all customers whose contact_method is a phone
Customer.not_phone # produces all customers whose contact method is not a phone
```

Defining scopes based on enum attributes can be disabled by passing
`scopes: false` as shown in the following example:

```ruby
class Customer
  enum :contact_method, { phone: 0, email: 1 }, scopes: false
end
```

## Using a string column for Enums in database

By default, the enum attributes are mapped to an integer in the database. We can
overwrite this behaviour to map the attributes to a string. Doing so can
increase the readability of our database since a string might make more sense
compared to an integer in most cases.

Consider the example of a customer, whose name is Oliver and his contact_method
is "phone". Query Oliver's `name` and `contact_method` using the following
query:

```bash
Customer.select(:contact_method, :name).find_by(name: "Oliver")
```

And the above command will fetch the following result:

```text
=> #<Customer:0x0000555c89a09430 id: nil, name: "Oliver", contact_method: 0>
```

If we look at the `contact_method` for Oliver, it is an integer value `0`, and
it doesn't make much sense from our perspective, unless we know `0` is mapped to
`phone` in Rails model.

Let us see how we can use a string column in database for an enum attribute.
Let's consider the same example of a `Customer` class with an enum attribute
called `contact_method`.

```ruby
class
  enum :contact_method, { phone: "phone", email: "email" }
end
```

In the migration class, we have to change the column type to string, like this:

```ruby
class AddContactMethodToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :contact_method, :string
  end
end
```

After changing the integer mapping to string, let's check if the values in
database make more sense. Query Oliver's record using the following query:

```bash
Customer.select(:contact_method, :name).find_by(name: "Oliver")
```

And it will show the following result:

```text
=> #<Customer:0x0000555c89a09430 id: nil, name: "Oliver", contact_method: "phone">
```

As you can see it makes a lot more sense since we can actually see that Oliver's
preferred contact method is phone, rather than an integer value.

## Using suffixes and prefixes with Enum

There can be instances where the usage of enum values can be confusing,
especially, while querying. Let us see an example.

Consider that in our `Customer` model, there is an enum named `card_type` which
tells whether the card owned by a customer is a credit or debit card.

```rb
class Customer < ActiveRecord::Base
   enum :card_type, { debit: "debit", credit: "credit" }
end
```

Now let us say that the `Customer` model is also associated to a `Credit` model
which handles payment made to a customer.

In such a scenario, a query like `customer.credit` can lead to uncertainty, from
a reader's perspective, since `credit` can refer to both the enum value and the
model. This is where adding a suffix or prefix to an enum can help.

We can add a prefix as follows:

```rb
class Customer < ActiveRecord::Base
   enum :card_type, { debit: "debit", credit: "credit" }, prefix: true
end
```

Adding `prefix: true` allows us to access the enum value using
`customer.card_type_credit`.

We can add a suffix as follows:

```rb
class Customer < ActiveRecord::Base
   enum :card_type, { debit: "debit", credit: "credit" }, suffix: true
end
```

Adding `suffix: true` allows us to access the enum value using
`customer.credit_card_type`.

Using suffixes and prefixes in this manner helps remove any confusions regarding
the usage of certain queries.

You can read more about `Enums` from the official
[Rails documentation for ActiveRecord::Enum](https://api.rubyonrails.org/v7.0.5/classes/ActiveRecord/Enum.html).

There is **nothing to commit** in this chapter.
