In most of our applications we create sample data for development environment:

```ruby
User.create(name: "John Smity", role: "admin")
```

The problem with this approach is that if for any reason `User.create` fails
then it will fail silently. This code will not raise any exception. It means
rest of the processing will continue, and we will see something else failing at
an unexpected place.

In this case we are populating sample data, so we expect all the validations to
pass. If for any reason validation is not correct then it is best to fail
loudly. In other words, fail with an exception. That can be done using "bang"
version:

```ruby
User.create!(name: "John Smith", role: "admin")
```

Sometimes we need to process jobs in the background. In those cases also we
should use bang version because if an update or create fails then we want to
raise an exception and not just ignore the failure.

There is **nothing to commit** in this chapter.
