Understanding the nuances of querying is crucial for developing efficient and scalable applications. Let's delve into some areas where we can optimize our querying strategies.

## present? vs exists? vs any?

Consider a scenario where you want to check if there are active tasks present in a particular project. Let's take an example of a command being run in the `rails console` and try to understand the difference:
```bash
irb(main):001:0> Project.find(57).tasks.where.not(deleted_at: nil).present?
Project Load (0.5ms)  SELECT  "projects".* FROM "projects"  WHERE "projects"."enabled" = 't' AND "projects"."id" = $1 LIMIT 1  [["id", 57]]
Task Load (918.7ms)  SELECT "tasks".* FROM "tasks" INNER JOIN "boards" ON "tasks"."board_id" = "boards"."id" WHERE "tasks"."enabled" = 't' AND "boards"."project_id" = $1 AND "boards"."enabled" = 't' AND ("tasks"."deleted_at" IS NOT NULL)  [["project_id", 57]]
=> true
```

This might seem intuitive, mainly because the `present?` method is available on all objects in Ruby through [ActiveSupport](https://guides.rubyonrails.org/active_support_core_extensions.html#blank-questionmark-and-present-questionmark). However, this may not be the optimal approach. Let's rerun the same query, but this time, instead of using `present?`, let's employ `exists?`. Both methods essentially accomplish the same task.

```bash
irb(main):001:0> Project.find(57).tasks.where.not(deleted_at: nil).exists?
Project Load (0.5ms)  SELECT  "projects".* FROM "projects"  WHERE "projects"."enabled" = 't' AND "projects"."id" = $1 LIMIT 1  [["id", 57]]
Task Exists (0.9ms)  SELECT  1 AS one FROM "tasks" INNER JOIN "boards" ON "tasks"."board_id" = "boards"."id" WHERE "tasks"."enabled" = 't' AND "boards"."project_id" = $1 AND "boards"."enabled" = 't' AND ("tasks"."deleted_at" IS NOT NULL) LIMIT 1  [["project_id", 57]]
=> true
```

If you compare the raw SQL outputs of previous commands we had ran, then you can notice the difference on how the execution time went down from ~900ms using `present?` to ~1ms using `exists?`. This is because when using `present?`, the query fetches all matching task records associated with the project and then checks if the resulting array has any elements. On the other hand, when employing `exists?`, the query is optimized with a `LIMIT 1` clause, aiming to retrieve only one record if it exists.

Alternatively, we can use the `any?` method, which yields the same result. In Rails 5.1 and above, the performance of `any?` is equal to that of `exists?`.

## When should we use the present? method?

Despite its performance considerations, `present?` becomes valuable in situations where interaction with the object's data is essential. It is used when specific actions need to be performed with the object, as it loads all the columns of the record into memory. For instance,

```ruby
tasks = Task.where(progress: "pending")
if tasks.present?
  # Do some action with the tasks
end
```

In the above case, `present?` would be the appropriate usage.

## limit vs take

The `limit` and `take` methods are used to restrict the number of records returned from a query, but they have some differences in their behavior. Consider the scenario below, where we aim to fetch the first 10 comments of the user.

```ruby
all_comments = fetch_comments(current_user)
all_comments.limit(10)
```

In the snippet above, a potential issue arises. The `limit(10)` method is typically employed with Active Record relations. However, if `fetch_comments` returns an empty array `[]` instead of an Active Record relation or `nil`, attempting to apply `limit(10)` to the array will result in an error.

It's important to note that the `limit` method is intrinsic to Active Record and is designed to work with database queries, not plain arrays.

To address this issue, we can opt for using `take` instead. The `take` method is versatile, as it can be applied to both arrays and Active Record relations. This way, we eliminate the concern of whether the source object is a Relation or an Array. The revised code snippet would be:

```ruby
all_comments = fetch_comments(current_user)
all_comments.take(10)
```

Apart from the above distinction, `limit` requires at least one argument, whereas `take` does not.

## Tracking SQL generated by Active Record methods

From all the above cases, we can see that, understanding the SQL generated by Active Record methods is crucial. Let's consider the following scenario where we aim to display articles if they are available:

```ruby
articles = articles.present? ? articles.limit(10) : "Not available"
```

Here, `present?` triggers a SQL query and `limit` triggers another SQL query, making the code inefficient with additional queries. This could be optimized to improve efficiency.

```ruby
articles&.limit(10) ||  "Not available"
```
The above code efficiently attempts to limit the articles to 10 if they exist, or returns "Not available" if the articles are `nil`, reducing the number of SQL queries.

Another area where we can optimize Active Record queries, as we have previously seen, is in addressing the [N+1 Query](https://courses.bigbinaryacademy.com/learn-rubyonrails/n-1-queries/) problem.

Therefore, consistently monitoring the SQL produced by the ORM is essential for maintaining code efficiency and database performance.

## Iterating over a large dataset

We often need to iterate over a large set of records. Let us consider a scenario where we have to send a newsletter to a large set of customers.

```ruby
Customer.all.each do |customer|
  NewsMailer.weekly(customer).deliver_now
end
```

But this approach becomes increasingly impractical as the table size increases, since `Customer.all.each` instructs Active Record to fetch the entire table in a single pass, build a model object per row, and then keep the entire array of model objects in memory. Indeed, if we have a large number of records, the entire collection may exceed the amount of memory available.

Rails provides two methods that address this problem by dividing records into memory-friendly batches for processing. The first method, [find_each](https://guides.rubyonrails.org/active_record_querying.html#find-each), retrieves a batch of records and then yields each record to the block individually as a model. The second method, [find_in_batches](https://guides.rubyonrails.org/active_record_querying.html#find-in-batches), retrieves a batch of records and then yields the entire batch to the block as an array of models.

Therefore, a more efficient approach to do the above would be:

```ruby
Customer.find_each do |customer|
  NewsMailer.weekly(customer).deliver_now
end
```

This process is repeated, fetching more batches as needed, until all of the records have been processed.

**This is an in-depth chapter and you do not need to commit any changes.**
