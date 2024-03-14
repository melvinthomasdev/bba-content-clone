## Avoid N+1 queries

Fixing the N+1 queries raised in test and logged in development mode under Bullet.log from Bullet.

Ref. - [N+1 Query and memoization](https://courses.bigbinaryacademy.com/learn-rubyonrails/n-1-queries/)

## Avoid .all queries, use pagination instead

Loading all data once in memory affects the performance, this can be fixed by using limit and querying in batches.

## Use find_each or find_in_batches

Performing the query operation in batches to avoid loading large number of records for performance issues. find_each queries result in a batch of 1,000 by default. Both methods differ as find_in_batches yields the result as an array of models instead of individual records.

<image>find_each-vs-each.png</image>

## Use/Remove Database Index if needed

Analyzing the database indexes through `rails-pg-extras` and slow database transactions through NewRelic to measure utility of DB index on case-to-case basis.

**Remove DB index**

1. Removing unused indexes analyzed through

```ruby
  RubyPgExtras.unused_indexes
```

2. Analysis on removing the DB index if query plan `index scan` cost way higher than `sequence scan` cost, and the column(s) have high frequency of insert, update and delete DB operations.

**Add DB index**

DB index can be added post critical analysis of given conditions -

1. The `sequence scan` operations are higher analyzed from explain-analyze query plans on NewRelic and `rails-pg-extras` through

```ruby
  RubyPgExtras.seq_scans
```
2. Higher filtering and sorting overhead in query plans, and lower frequency of insert, update, and delete operations affecting index maintenance.

Slow queries can be updated to use an already existing index or an added index can help improve the performance. Using `.explain` on queries can be used to analyze if index is utilized, and single, composite or partial indexes can be added to improve query performance.

## Use Bulk Operations

Creation - `#create` accepts an array of hashes and returns one query instead of n, depending on the DB engine supporting bulk insert operation
Updation - Bulk update through `update_all`
Deletion - `delete_all` can be used in place of `destroy`, if `after_destroy` callback invocation is not required

```ruby
#Deletion
users = User.where(active: false)

users.each do |user|
  user.delete
end

#Better - Performing same operation in bulk
users = User.where(active: false)

users.delete_all

#Creation
new_users = [
  { name: "Oliver Smith", email: "oliver@example.com" },
  { name: "Eve Smith", email: "eve@example.com" }
]

new_users.each do |user_attrs|
  User.create(user_attrs)
end

#Better - Performing user creation in bulk
User.create(new_users)
```

## Prefer #size over #count

`ActiveRecord::Relation#size` shall be preferred over `ActiveRecord::Calculations#count` since `#count` always performs query even if relation is loaded whereas `#size` will return length on loaded relation is already loaded otherwise will use `#count`

```ruby
# File activerecord/lib/active_record/relation.rb, line 210
def size
  loaded? ? @records.length : count(:all)
end
```

## Select only required attributes in query

`#pluck` or `#select` can be used based on whether array of strings or ActiveRecord_Relation is required to be returned. Order in performance preference - pluck > select > collect/map

```ruby
# Not preferred - Since it select and loads all columns in memory where only
# one attribute is required to be selected
user_emails = User.where(active: true).map(&:email)

# Preferred - Performance is better than select for large data given array of strings
# is expected in result
user_emails = User.where(active: true).pluck(:email)

# Preferred - Returns `ActiveRecord_Relation` of `User` objects but with only the requested attribute(s)
# in each object.
user_emails = User.where(active: true).select(:email)

# Only if all attributes of model are required
users = User.where(active: true)
```

## Check existence of record with `exists?` instead of `present?`

`present?` loads all columns and the object in memory whereas `exists?` limits only to 1 record and does not select any columns.

## Use transactions for a group of operations

```ruby
ticket.update(ticket_options)

if ticket.valid?
  update_description
  update_ticket_fields
  add_ticket_tags
end

# Preferred
Ticket.transaction do
  ticket.update(ticket_options)

  if ticket.valid?
    update_description
    update_ticket_fields
    add_ticket_tags
  end
end

#or

ActiveRecord::Base.transaction do
  # Group of operations
end
```

## Enhance render partial performance

```ruby
# Not preferred - Slower since Rails needs to compile and process each partial once.
<% @tickets.each do |ticket| %>
  <%= render :partial => "ticket", :locals => { :ticket => ticket } %>
<% end %>

# Preferred - Rails knows these partials are originally the same partial, so it only needs to compile
# and process once.
<%= render :partial => "ticket", :collection => @tickets, :as => :ticket %>
```

## Use In-Memory calculation if needed

Contrary to using `find_each`, where number of queries were more and memory was reduced, sometimes with judgement, in-memory computations can be used to reduce query count and increase memory use. Given that the latter is performing better justified by benchmarks.

