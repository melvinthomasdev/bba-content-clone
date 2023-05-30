Caching is an essential technique for improving the performance of web
applications, and Rails provides a built-in caching mechanism that makes it easy
to implement caching in your application. In this chapter, we will discuss what
Rails caching is, particularly low-level caching.

## What is Rails Caching?

Caching is the process of storing frequently used data in memory or on disk to
reduce the number of database queries and improve the performance of your
application. Rails provides several caching mechanisms, including page caching,
action caching, fragment caching, and low-level caching. Each caching mechanism
has its use cases and benefits.

Rails caching is easy to implement and can be done in several ways, depending on
the use case. Here are some of the most commonly used caching mechanisms in
Rails:

- Page caching: This mechanism caches the entire HTML output of a controller
  action as a static HTML file. This is suitable for pages that don't change
  frequently and are not personalized. Support for this caching was removed from
  Rails 4.

- Action caching: This mechanism caches the output of a controller action, but
  unlike page caching, it stores the cache in memory or on disk. This is
  suitable for pages that change frequently but have a limited number of
  variations. Support for this caching was removed from Rails 4.

- Fragment caching: This mechanism caches a portion of a view template, such as
  a sidebar or a product listing. This is suitable for pages that have dynamic
  content but have a significant amount of static content.

- Low-level caching: This mechanism allows you to cache arbitrary data in memory
  or on disk, such as the result of a complex calculation. This is suitable for
  cases where none of the other caching mechanisms are appropriate.

This chapter will primarily focus on low-level caching as it gives more control
over elements like a particular value or query result.

## How to use Low-level caching?

To use low-level caching in a Rails application, you need to use the
`Rails.cache` object to access
[cache store](https://guides.rubyonrails.org/caching_with_rails.html#cache-stores).
The cache store can be configured to use different backends such as memory,
file, or Redis.

When you use `Rails.cache` directly, you have more control over the caching
process, but you also have to handle some of the implementation details
yourself, such as deciding what values to store and how to retrieve them. This
can make the caching process more "low-level" in nature, since you are dealing
with the details of how the cache works at a more granular level.

We can read and write from the cache using the `Rails.cache.fetch` method. Let
us explore this method with an example. Assume we are creating a code testing
application where users submit their code and test cases are run against it.
Assuming the test cases don't change during the test, it is logical to keep them
in a cache instead of querying the database every time.

```rb
def cached_test_cases
  Rails.cache.fetch("questions/#{question_id}/test_cases", expires_in: 5.hours) do
    Question.find(question_id).test_cases.pluck(:id)
  end
end
```

In the above code, the first argument we pass into the `fetch` method is the
key. If the key is the only argument passed, then the corresponding value from
the cache will be returned. Here, the key will be in the form of
`questions/958e1387-8a1a-47da-a0f5-6d5e8fc5c6b5/test_cases`. This is not the
only way we can pass in keys. We will learn more about this in the next section.

The second argument we have passed is the expiry time of the cache. The expiry
time determines how long the cached data remains valid and affects the
performance and memory usage of the application. The expiry time can be set
using the `:expires_in` option, which accepts a time duration in seconds or an
`ActiveSupport::Duration` object.

Notice that we have also passed a code block to the method. This block is
executed in case of a cache miss, i.e, when the desired data is not present in
the cache. Once the block is executed to generate a return value, the value will
be stored in the cache using the specified cache key, and also returned as the
output of the block. In the event of a cache hit, the previously cached value
will be retrieved and returned without the need to execute the block again. This
caching mechanism can enhance program performance and efficiency by reducing the
time and computing resources needed to generate and retrieve frequently accessed
data.

## Cache keys in detail

To use low-level cache in Rails, you need to provide a unique identifier for
each cache entry since the data is stored in a key-value format. In the example
discussed in the previous section, we passed in a string identifier as the cache
key. This identifier is usually a combination of strings that represent the
purpose or context of the cached data. While using raw string identifiers as
cache keys, care should be taken to properly namespace them. This is the
convention we follow to organize cached data by separating cache entries based
on their purpose, environment, or any other relevant criteria.

To illustrate the importance of key namespaces, let us reconsider the scenario
of caching test cases for a specific question in a code-testing application.
While it may be possible to use `question_id` as a unique cache key, the same
key cannot be used to cache other associated objects of the Question model. This
is where key namespaces come into play. By including the context in the key, in
the form of namespaces, uniqueness is ensured. For example, using a key in the
format `questions/#{question_id}/test_cases` not only makes it unique but also
provides the reader with the necessary context, facilitating efficient retrieval
and management of cached data.

While you could use string identifiers as keys, it may not always be the best
option. When you update data that is being cached, you want to make sure that
the old cached data is invalidated and the new data is cached instead. While
using simple strings or complex strings made of object ids, you will have to
manually invalidate the cache data when the object is updated. In the case of
caching test cases we will have to do something along the following terms:

```rb
  def invalidate_cache
     Rails.cache.delete("questions/#{question_id}/test_cases")
     # It is recommended to return true, as Rails.cache.delete will
     # return false if no cache is found and break the callback chain.
     return true
  end
```

Fortunately, the `fetch` method allows us to pass some other common objects as
keys that can save us from the hassle of manually invalidating cache data.

### Using cache_key_with_version for automated cache invalidation in Rails

The `cache_key_with_version` method is a convenient way to generate a cache key
that includes a version number, which can be used to automatically invalidate
the cache when the object is updated. The version number is based on the
`updated_at` timestamp of the object.

```rb
post = Post.find(params[:id])
cache_key = "posts/#{post.cache_key_with_version}"
@data = Rails.cache.fetch(cache_key) do
  # code to generate the cached data
end
```

In this code snippet, the desired data is being cached using the
`cache_key_with_version` method. This ensures that the cache is automatically
expired when the post object is updated, without having to manually invalidate
the cache.

### Passing an array containing self as cache key

To add low-level caching to an ActiveRecord model, you can pass an array
containing `self` into the `fetch` method of the `Rails.cache` object. This will
generate a cache key based on the model's `id` and `updated_at` attributes,
which will be used to store and retrieve the cached data.

Here's an example of how you can use low-level caching with an ActiveRecord
model:

```rb
class Article < ApplicationRecord
  def self.recent_articles
    Rails.cache.fetch([self, "recent_articles"]) do
      # Perform expensive operation to retrieve recent articles here
      # For example:
      # Article.where("created_at >= ?", 1.week.ago).limit(10)
    end
  end
end

```

In this example, we define a class method called `recent_articles` on the
Article model. This method uses the `Rails.cache.fetch` method to cache the
results of an expensive database query that retrieves the 10 most recent
articles created within the last week.

The cache key is generated by passing an array containing self and a string
`recent_articles` to the fetch method. This tells Rails to generate a cache key
based on the Article model's `id` and `updated_at` attributes, as well as the
string `recent_articles`. The final cache key will look something like
`articles/123-20220406123145/recent_articles`.

So, if the `updated_at` timestamp of the Article model instance changes due to
an update, the cache key will also change and the cached data for the
`recent_articles` query will be invalidated and removed from the cache.

## When to Use Low-level Caching?

You should use Rails low-level caching when you have data that is frequently
accessed, but its underlying source doesn't change very often. For example, when
you make read-only external API requests in a Rails application, the response
data often does not change frequently. In these cases, it makes sense to cache
the responses to reduce the number of API requests and improve the performance
of your application. Similarly, if you have a complex calculation that takes a
long time to compute, you can cache the result to avoid recomputing it every
time it is needed.

## When not to use Low-level caching?

There are certain situations where using Rails caching might not be the best
approach. Some of them are outlined below.

- When the data changes frequently: If the data being cached changes frequently,
  then caching might not be a good option. In such cases, the cache would need
  to be updated frequently, which would negate the benefits of caching. For
  example, let us say that a developer tries to cache a list of products on an
  e-commerce website. Caching in this case may not be a good approach since the
  products and product details might change frequently.

- When the cache is expensive to update: If updating the cache is expensive in
  terms of processing or memory usage, then caching might not be a good option.
  The cost of updating the cache could outweigh the benefits of caching,
  especially if the cache is not being used frequently. An example is an
  expensive machine-learning model that requires significant processing power to
  update.

- When the cache causes data inconsistency: Improper usage of the cache can
  cause the cached data to be stale and inconsistent with the actual data. One
  such improper usage is the caching of Active Record objects. In the
  code-testing application example cited in one of the previous sections, we had
  cached ids of test cases rather than the test case objects themselves. This is
  to avoid data inconsistency.

## Using Redis for Efficient Caching

`ActiveSupport::Cache::RedisCacheStore` is a caching mechanism used in Rails
applications that utilizes Redis as a storage backend. Redis is a
high-performance in-memory key-value store that is commonly used for caching.
You can learn more about setting up Redis cache store in the
[official docs](https://guides.rubyonrails.org/caching_with_rails.html#activesupport-cache-rediscachestore).

Redis has a feature called automatic eviction, which means that when Redis
reaches its maximum memory capacity, it automatically removes older or less
frequently accessed data to make room for new data. This allows
`ActiveSupport::Cache::RedisCacheStore` to function similarly to a Memcached
cache server, which also automatically removes data when it reaches its
capacity.

However, it's important to note that Redis doesn't expire keys by default. This
means that cached data in Redis can potentially take up a lot of memory and
cause issues with the Redis server. To avoid this, it's recommended to use a
dedicated Redis cache server for caching and to set the `maxmemory-policy`
configuration option to one of the variants of `allkeys`.

The `allkeys` option specifies that Redis should consider all keys when deciding
which data to remove during eviction. There are different variants of the
`allkeys` option that specify different eviction policies. For example, the
`allkeys-lru` variant specifies a least-recently-used policy, where Redis
removes the least recently used keys first during eviction. The `allkeys-lfu`
variant, available in Redis 4+, specifies a least-frequently-used policy, where
Redis removes the least frequently used keys first during eviction. You can
learn more about other eviction policies in the
[official docs](https://redis.io/docs/reference/eviction/).

In summary, caching is a powerful technique for improving the performance of
your Rails application, and Rails provides several caching mechanisms to choose
from. When using caching, it's important to consider the nature of the data
being cached and the caching mechanism used. Caching can significantly improve
the performance of your application, but it's important to use it judiciously
and avoid caching personalized or frequently changing content. By using Rails
caching effectively, you can speed up your application and provide a better user
experience for your users.
