In this chapter, we'll explore how to use PostgreSQL JSONB columns and the
ActiveRecord Store module in Rails. We'll start by discussing what JSONB columns
are and why they're useful, then move on to how to use them in Rails with the
ActiveRecord's `store` and `store_accessor`.

## What is a PostgreSQL JSONB column?

PostgreSQL is a popular relational database management system that supports a
wide range of data types, including JSONB. JSONB stands for "JSON Binary" and is
a binary representation of JSON data that allows for efficient storage and
retrieval of complex data structures.

JSONB columns in PostgreSQL allow you to store semi-structured data as a single
column in your database table. This can be useful when you have data that
doesn't fit neatly into traditional relational database tables, such as nested
or variable-length data structures.

For example, let's say you have an e-commerce website where users can create
custom products with different options and configurations. Instead of creating
separate tables for each product option, you could store all the options as a
single JSONB column in your products table.

## Use cases of storing JSON data in relational database columns

There are many use cases for storing JSON data in a database column. Here are a
few examples:

1. Storing user preferences: You can store user preferences in a single column,
   such as their preferred language, timezone, or theme. This allows you to
   easily retrieve and update these preferences without having to create
   separate columns for each one.

2. Storing metadata: You can store metadata about a model, such as the date it
   was last updated, the number of times it has been viewed, or any other
   information that doesn't fit neatly into a single column.

3. Storing configuration settings: You can store configuration settings for your
   application, such as the number of items per page in a paginated list or the
   default sort order for a table.

4. Storing complex data structures: You can store complex data structures that
   don't fit neatly into a relational database schema, such as nested arrays or
   hashes.

## Using JSON columns in Rails

Let's say you have a `users` table and you want to store additional information
about each user, such as their social media profiles. Instead of creating
separate columns for each profile, say `facebook`, `twitter`, `instagram` etc,
you can use a JSONB column to store all the profiles in a single column if you
have a database like PostgreSQL that supports JSONB columns.

Here's an example migration that adds a `profiles` JSONB column to the `users`
table:

```rb
class AddProfilesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profiles, :jsonb
  end
end
```

Once you've created the JSONB column, you can use it to store social media
profiles for each user. Let us manually define the getter and setter methods for
each social media profile.

```rb
class User < ApplicationRecord
  def facebook=(value)
    self.profiles["facebook"] = value
  end

  def twitter=(value)
    self.profiles["twitter"] = value
  end

  def facebook
    profiles.dig("facebook")
  end

  def twitter
    profiles.dig("twitter")
  end
end
```

With this setup, you can create new users with social media profiles like this:

```rb
user = User.new(name: 'Oliver Smith', profiles: { facebook: 'oliver99', twitter: 'oliver99' })
user.save!
```

You can also retrieve individual profiles using the generated getter methods:

```rb
user.facebook # => "oliver99"
user.twitter # => "oliver99"
```

Although this works, there is a catch. Manually defining getter and setter
methods for each attribute in a JSON column can become cumbersome and difficult
to maintain as the number of attributes grows. This is because you have to write
a separate method for each attribute, which can quickly become unwieldy. This
necessitates the need for a more scalable solution that automatically generates
getter and setter methods for each attribute in a JSON column.

## store and store_accessor

ActiveRecord's `store` and `store_accessor` methods provide a convenient way to
store semi-structured data, such as JSON or YAML, in a database column. When
storing JSON data in the database, there are two key aspects to consider:
serialization and access.

If you're using a `json`-type column in your database, like a JSONB column in
PostgreSQL, then you don't need to worry about the serialization aspect. Rails
and the database adapter will automatically handle the serialization of your
data for you. In this case, you can use the `store_accessor` method to define
getter and setter methods for specific attributes within your JSON data.

Here's an example model that uses the `store_accessor` method to generate getter
and setter methods for each profile.

```rb
class User < ApplicationRecord
  store_accessor :profiles, :facebook, :twitter
end
```

With this, you can create new users with social media profiles and retrieve them
just like you did in the previous section.

Now, if you're storing your JSON data in a text column, then you'll need to
manually handle the serialization of your data. This is where ActiveRecord's
`store` method comes in handy. The `store` method automatically
serializes/deserializes your data into your chosen format when reading from or
writing to the column.

Here's an example model that uses the `store` method to generate getter and
setter methods for each profile.

```rb
class User < ApplicationRecord
  store :profiles, accessors: [:facebook, :twitter], coder: JSON
end
```

With this, you can also create new users with social media profiles and retrieve
them just like you did in the previous section.

In summary, whether you should use `store_accessor` or `store` depends on
whether you're using a `json`-type column or a text column to store your JSON
data. If you're using a `json`-type column, then use `store_accessor`. If you're
using a text column, then use `store`.

## Considerations for storing JSON data in PostgreSQL database columns

Storing JSON data in a PostgreSQL database column like JSONB may not be the best
choice in the following scenarios:

1. When you need to perform complex queries on the JSON data: While PostgreSQL
   provides some powerful functions for querying JSON data, it can be difficult
   to write complex queries that involve nested objects or arrays. In such
   cases, it may be better to store the data in a traditional relational format.

2. When you need to enforce strict schema validation: JSON is a flexible format
   that allows for arbitrary keys and values, which can make it difficult to
   enforce strict schema validation. If you need to ensure that your data
   conforms to a specific schema, it may be better to use a traditional
   relational format.

3. When you need to perform frequent updates on individual keys within the JSON
   object: Updating individual keys within a JSON object requires rewriting the
   entire object, which can be inefficient if you need to perform frequent
   updates on individual keys. In such cases, it may be better to store the data
   in separate columns.

4. When you need to ensure referential integrity: If your application requires
   referential integrity between different tables, storing JSON data in a single
   column can make it difficult or impossible to enforce those constraints.

5. When you need strong typing and validation: If your application requires
   strong typing and validation of data, storing JSON data in a PostgreSQL
   database column like JSONB may not provide enough type safety and validation
   capabilities.

In summary, while storing JSON data in a PostgreSQL database column like JSONB
can provide flexibility and ease of use, there are scenarios where using
traditional relational formats may be more appropriate due to their stronger
typing and validation capabilities or when complex queries are required.
