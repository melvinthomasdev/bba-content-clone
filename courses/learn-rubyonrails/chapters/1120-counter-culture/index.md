In this chapter, we will learn about the `counter_culture` gem which is more
beneficial than the default counter cache, offered by Rails, in some scenarios.

We had already seen the advantage of using `counter_cache` when we added a
column to the dashboard for displaying the number of comments under each task.
Although `counter_cache` can come in handy, there can be situations where you
might want to leverage the potential of `counter_cache` but cannot quite do so
because of business logic constraints. Let us delve into such a scenario and
understand why `counter_culture` can be useful in these cases.

## Counter culture as an alternative to counter cache

Assume that in the future you are going to add an option to "star" comments in
the granite application. Let us say that the user requirements want you to
display the count of starred comments for each task under a new column
`Starred Comments` in the Dashboard. Using the default counter cache would be
difficult in such a scenario since this feature requires you to enforce some
conditions over a column like `comments_count`. The condition in this case would
be to check whether the comment is starred or not.

In such situations, the `counter_culture` gem can be of great help. The
`counter_culture` gem can be a useful alternative to using the counter cache
column if you want more control over which columns are updated and when.

You can set up `counter_culture` by adding the below text to your gem file and
running `bundle install`.

```rb
gem 'counter_culture'
```

Now after adding the functionality to "star" comments, add a new column to your
`tasks` table with the name `starred_comments_count`. You can run the necessary
migrations, to achieve the same, as we saw in the
[chapter](https://www.bigbinary.com/learn-rubyonrails-book/using-counter-cache-to-display-comment-counts)
introducing `counter_cache`.

After adding the column, you can modify the `Comment` model in
`app/models/comment.rb` as follows:

```rb
class Comment < ApplicationRecord
  # previous code if any

  belongs_to :task
  counter_culture :task, :column_name => Proc.new {|model| model.starred? ? 'starred_comments_count' : nil }

  # previous code if any
end
```

Now, the `Task` model will keep the counter cache in `starred_comments_count`
up-to-date. Only comments where `comment.starred?` returns true will affect the
`starred_comments_count`.

`counter_culture` provides us additional functionalities like conditional
counter cache, customized column name and dynamic column name among others.
However, it does add some extra complexity to your application, and you should
consider whether it is the right solution for your particular use case.

You can learn more about `counter_culture` gem in the
[official docs](https://github.com/magnusvk/counter_culture).

**This is an in-depth chapter and you do not need to commit any changes.**
