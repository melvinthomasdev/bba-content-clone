In the previous chapter, we looked into the use cases of storing JSON data in relational database columns and how PostgreSQL JSON columns aid this. In this chapter, we will delve into the operators available for working with JSONB data in PostgreSQL. JSONB operators allow for efficient querying and manipulation of JSON data within the database.

Consider a simple `Post` table that contains a string `title` and two JSONB columns, `upvotes` and `comments` as shown below:

| title                  | upvotes                                       | comments                                                                                                                    |
| ---------------------- | --------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| "Introduction to ORM"  | {"count": 15, "upvoters": ["user1", "user2"]} | [{"content": "Great post!", "author": "commenter1"}, {"content": "Nice explanation!", "author": "commenter2"}]              |
| "Ruby on Rails Basics" | {"count": 20, "upvoters": ["user3", "user4"]} | [{"content": "Helpful tutorial!", "author": "commenter3"}, {"content": "Looking forward to more!", "author": "commenter4"}] |
| "Database Design Tips" | {"count": 12, "upvoters": ["user5", "user6"]} | [{"content": "Interesting insights!", "author": "commenter5"}, {"content": "Clear and concise.", "author": "commenter6"}]   |

We will see how we can leverage JSONB operators to query data from this table.

## Accessing JSON fields using `->`

**Syntax**: `jsonb_object->string`

Returns the value of key specified by the string from the JSONB object.

Consider that we need to get the value of `count` from the JSONB column `upvotes` from the `Post` table. Here is how we will use `->` to achieve this:

```rb
Post.select("title", "upvotes->'count' AS upvote_count")
```

| title                | upvote_count |
| -------------------- | ------------ |
| Introduction to ORM  | 15           |
| Ruby on Rails Basics | 20           |
| Database Design Tips | 12           |

It can also be used to access array element at a given index:

**Syntax**: `jsonb_array->integer`

Returns the element at the index specified by the integer from the JSONB array.

To get the first element from the `comments` array, we will use `->` as shown below:

```rb
Post.select("title", "comments->0 AS top_comment_details")
```

| title                | top_comment_details                                          |
| -------------------- | ------------------------------------------------------------ |
| Introduction to ORM  | {"content": "Great post!", "author": "commenter1"}           |
| Ruby on Rails Basics | {"content": "Helpful tutorial!", "author": "commenter3"}     |
| Database Design Tips | {"content": "Interesting insights!", "author": "commenter5"} |

## Accessing JSON fields as text using `->>`

The `->` operator and the `->>` operator in PostgreSQL's JSONB functions are similar, with a key difference in the type of result they return:

- The `->` operator returns the result with the same data type as the corresponding JSON field or element.
- The `->>` operator, on the other hand, always returns the result as text.

## Accessing JSON object as specified path using `#>`

**Syntax**: `jsonb#>'{"path", "to", "field"}'`

Returns the JSON object at the specified path.

We can get the `content` of first comment from the `comments` field using `#>` as shown:

```rb
Post.select("title", "comments#>{0, 'content'} AS top_comment")
```

| title                | top_comment             |
| -------------------- | ----------------------- |
| Introduction to ORM  | "Great post!"           |
| Ruby on Rails Basics | "Helpful tutorial!"     |
| Database Design Tips | "Interesting insights!" |

## Concatenate jsonb values using `||`

The `||` operator concatenates two JSONB values into a new JSONB value.

We can add new comment values to `comments` using `||` like so:

```rb
post = Post.first

new_comment = [{"content": "Looks good", "author": "commenter3"}]
post.update(comments: post.comments || new_comment)
```

The first row will be updated with the `new_comment` added to the `comments` value:

| title                 | upvotes                                       | comments                                                                                                                                                          |
| --------------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| "Introduction to ORM" | {"count": 15, "upvoters": ["user1", "user2"]} | [{"content": "Great post!", "author": "commenter1"}, {"content": "Nice explanation!", "author": "commenter2"}, {"content": "Looks good", "author": "commenter3"}] |

The `||` operator concatenates two JSON objects by generating an object containing the union of their keys, taking the second object's value when there are duplicate keys.

For example, the query below will update the `count` to `10` keeping the value of upvoters intact.

```rb
post = Post.first

new_upvote = { "count": 10 }
post.update(upvotes: post.upvotes || new_upvote)
```

| title                 | upvotes                                       | comments                                                                                                                                                          |
| --------------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| "Introduction to ORM" | {"count": 10, "upvoters": ["user1", "user2"]} | [{"content": "Great post!", "author": "commenter1"}, {"content": "Nice explanation!", "author": "commenter2"}, {"content": "Looks good", "author": "commenter3"}] |

## Accessing JSON object at the specified path as text using `#>>`

The operators `#>` and `#>>` in PostgreSQL's JSONB functions are similar, with a key difference in the type of result they return:

- `#>` returns the result with the same data type as the corresponding JSON field or element.
- `#>>` operator, on the other hand, always returns the result as text.

## Check whether a JSON value contain another JSON value using `@>` or `<@`

**Syntax**: `jsonb@>jsonb`

Return true if the JSON value on the left-hand side contains the JSON value supplied on the right-hand side. Otherwise returns false.

Let's take an example of a `UserActivity` table as shown below:

| user   | activity                                                                                                   |
| ------ | ---------------------------------------------------------------------------------------------------------- |
| Sam    | {"type":"comment", "post":{"id":"9af0-cc53", "title":"Introduction to ORM"}, "content":"Nice explanation"} |
| John   | {"type":"repost", "post":{"id":"9af0-cc53", "title":"Introduction to ORM"}}                                |
| Oliver | {"type":"reaction", "post":{"id":"9af0-cc53", "title":"Introduction to ORM"}}                              |

Consider that we need to get the users who have `comment` as an activity. We can use the `@>` operator inside where condition to check whether activity contains `comment` as `type`:

```rb
UserActivity.select(:user).where("activity@>'{\"type\" : \"comment\" }' ")
```

The above query will give the following result:

| user |
| ---- |
| Sam  |

The `<@` operator works similar to the `@>` operator:

**Syntax**: `jsonb<@jsonb`

Return true if the JSON value on the right-hand side contains the JSON value supplied on the left-hand side. Otherwise returns false.

## Check for top-level keys using `?`, `?|` and `?&`

- `?` checks whether a given string exists as top-level key.

  **Syntax**: `jsonb?string`

  Returns `true` if the JSON object contains the given string as top-level key.

  Top-level key refers to the key associated with the outermost layer of the JSONB data. In the following JSONB data, `type` and `post` are the top-level keys:

  ```rb
  {
    "type":"repost",
    "post": {
      "id":"9af0-cc53",
      "title":"Introduction to ORM"
    }
  }
  ```

  Here is an example that queries users whose `activity` has `content` as top-level key using `?` operator:

  ```rb
  UserActivity.select(:user).where("activity?'content' ")
  ```

  This query will yield the following result:

  | user |
  | ---- |
  | Sam  |

- `?|` checks whether any of the given strings exist as top level keys.

  **Syntax**: `jsonb?|[]`

  Returns `true` if the JSON object contains any of the string in the given array as top-level key.

  The query below selects the rows which have either `type` or `content` as top level keys for `activity`:

  ```rb
  UserActivity.select(:user).where("activity?|['type', 'content' ] ")
  ```

  This query will yield the following result:

  | user   |
  | ------ |
  | Sam    |
  | John   |
  | Oliver |

- `?&` checks whether all of the given strings exist as top level keys.

  **Syntax**: `jsonb?&[]`

  Returns `true` if the JSON object contains all the strings in the given array as top-level key.

  The query below selects the rows which have `type`, `post` and `content` as top level keys for `activity`.

  ```rb
  UserActivity.select(:user).where("activity?&['type', 'post', 'content' ] ")
  ```

  This query will yield the following result:

  | user |
  | ---- |
  | Sam  |

## Delete top level field or element from jsonb using `-`

- **Syntax**: `jsonb_object-string`

  Delete the key/value pair from JSONB object with the key that matches the given text.

- **Syntax**: `jsonb_array-integer`

  Delete the element from the array with given integer index.

Here's an example query that deletes the `post` key from the `activity` of user Sam:

```rb
UserActivity.where(user: 'Sam').update_all("activity = activity-'post'")
```

## Delete field or element with specified path using `#-`

**Syntax**: `jsonb#-'{"path", "to", "field"}'`

Delete the field/element at the specified path from the JSONB column.

The query shown below deletes the `title` from an `activity`'s `post`:

```rb
UserActivity.where(user: 'Sam').update_all("activity = activity#-'{post,title}'")
```
