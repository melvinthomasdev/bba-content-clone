The Learn Ruby on Rails book offers comprehensive guidance for developers who
want to build a Ruby on Rails application that adheres to BigBinary's standards.
With step-by-step instructions and code examples, it caters to those who prefer
a structured learning approach. However, some learners might seek a more
hands-on experience that challenges their problem-solving skills and encourages
critical thinking. To accommodate various learning styles and enhance the
overall learning experience, we have included additional side project tasks.

These project tasks will provide directions for building an application named
`BlogWorthy` and will be distributed within the book. It should be noted that no
code will be provided. By encouraging learners to work on the side project in
tandem with the Granite application, we hope to prevent them from becoming
overly reliant on pre-existing code and foster a deeper understanding of Ruby on
Rails development.

The primary function of the `BlogWorthy` application is to enable users to
submit potential blog ideas and allow others to upvote or downvote them. The
idea will be deemed "blog-worthy" if it receives a sufficient number of net
votes, as determined by a predefined threshold.

## Task 1

To begin, generate a new Rails app, named `blog-worthy`, with the configurations
outlined in the preceding chapters. Afterward, create a `Post` model with the
following attributes:

- `title`: This field indicates the title of the idea post for a blog and should
  not be NULL.
- `description`: This field indicates the content of the post. It should not be
  NULL.
- `upvotes`: This integer field indicates the number of upvotes for the post. It
  should have a default value of zero and should not be NULL.
- `downvotes`: This integer field indicates the number of downvotes for the
  post. It should have a default value of zero and should not be NULL.
- `is_blog_worthy`: This boolean field indicates whether the idea can be
  transformed into a blog. It should have a default value of false.

At this juncture, it is acceptable to utilize integer IDs in the database
tables. However, it is worth noting that it is generally considered best
practice to use UUIDs instead of integers for unique identifiers. Nonetheless,
due to the limitations of SQLite, you may use integer IDs in this case.

Please note that those who are simultaneously working on a side project and
employed at BigBinary can seek guidance from mentors in the designated project
channels if they encounter implementation queries or require assistance when
encountering roadblocks.
