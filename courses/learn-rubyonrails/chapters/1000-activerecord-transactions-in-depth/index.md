## What are Transactions?

Transactions are protective blocks where SQL statements are only permanent if
they can all succeed as one atomic action. Transactions are used to enforce the
integrity of the database and guard the data against program errors or database
break-downs.

So basically you should use transaction blocks whenever you have a number of
statements that must be executed together or not at all.

`Transaction` makes sure either all the statements persist or none do.

## Transactions in Active Record

Rails provides `transaction` as a class method under the `ActiveRecord::Base`
class. We can use the method like so:

```ruby
ActiveRecord::Base.transaction do
  #Database transactions go here
end
```

All changes, that the statements within the transaction block tries to make, get
committed to the database, only if each of the statement run without raising an
error. If any statement raises an error, then all the changes will be rollback.

## Transactions in action

The classic example of Transactions in action is a transfer between two accounts
where you can only have a deposit if the withdrawal succeeded and vice versa.

Implemented naively our code might look something like this:

```ruby
david.debit_account(amount) if david.sufficient_balance(amount)
credit_amount = convert_currency(amount, recipient)
perform_transfer(mary, credit_amount, sender)
```

While ideally the implementation works, what will happen if our program crashes
at any point after we debit David's account?

Then we would have debited the amount from David's account but not successfully
transferred it to Mary's account, leading to the money essentially disappearing.

Wrapping the above queries in a `transaction` block will make sure that the
withdrawal only occurs if none of the other functions throw an exception. This
will help us in maintaining data integrity.

```ruby
ActiveRecord::Base.transaction do
  david.debit_account(amount) if david.sufficient_balance(amount)
  credit_amount = convert_currency(amount, recipient)
  perform_transfer(mary, credit_amount, sender)
end
```

## Different Active Record classes in a single transaction

A `transaction` is a class method, therefore it must be called upon an Active
Record class. However it is not necessary that all objects in the block should
be an instance of that class. This is because `transactions` are per-database
connection and not per-model.

For example let's consider two models `Balance` and `Account` and we want to
transactionally save both the models.

Irrespective of the class the transaction is called upon, we can call `save!` on
objects of both the models in the block.

We can call `transaction` on `Account`:

```ruby
Account.transaction do
  balance.save!
  account.save!
end
```

The above block will save `balance` as well as `account` even though we are
calling the method on `Account` class.

The transaction method is also available as a model instance method. For
example, we can also do this:

```ruby
account.transaction do
  balance.save!
  account.save!
end
```

**Note:** A `transaction` acts on a single database connection. If you have
multiple class-specific databases, the transaction will not protect interaction
amongst them. One workaround is to begin a transaction on each class whose model
needs altering.

## Calling transactions on ActiveRecord::Base vs Model Class vs Model Instance

As mentioned in the previous section, we can call the `transaction` method on
`ActiveRecord::Base` class, model class, or a model instance. You might be
wondering how these three are different.

Rails provides the `transaction` method under the `ActiveRecord::Base` Class.
Since every model inherits `ActiveRecord::Base` the transaction method is
available to every model class.

The `transaction` method called on a model class works exactly like
`ActiveRecord::Base.transaction` unless we specifically override it to set or
get its database connection.

Calling the `transaction` method on model instance is a convenience method that
let's us write more syntactically beautiful code.

For example, let's consider the following code snippet:

```ruby
account = Account.find(1)
account.transaction do
  account.save!
  balance.save!
end
```

Under the hood `account.transaction` calls the `transaction` method on the
`Account` class. It is equivalent to the following code snippet:

```ruby
account = Account.find(1)
Account.transaction do
  account.save!
  balance.save!
end
```

## Transactional nature of save and destroy methods

One important implementation of `transactions` are in `save` and `destroy`
methods of Active Record. Both methods are automatically wrapped in a
transaction that ensures that whatever you do in validations or callbacks will
happen under its protected cover. So you can use validations to check for values
that the transaction depends on or you can raise exceptions in the callbacks to
rollback, including `after_*` callbacks.

## Exception handling and rolling back

There are two common ways to raise an exception in a Rails transaction:

- Using Active Record bang methods like `save!`, `update!`, etc.
- Manually raising an exception.

Generally the exceptions in a transaction block will be propagated, after
triggering ROLLBACK. So you should be ready to catch those exceptions in your
application code.

Let's say we have a transaction that creates a new `Account` and updates another
account like so:

```ruby
Account.transaction do
  @new_account = Account.create!(account_params)
  @referrer.update!(params[:reference_record])
end
```

The `create!` and `update!` method will throw an exception if something goes
wrong.

**Note:** If we were to use, the non-bang version of these methods, that is
`create` or `update`, then instead they would indicate failure via their return
value and the transaction would keep running.

If for some reason we want to use the non-bang version of these methods, then we
can always raise an exception manually to check the return value like so:

```ruby
Account.transaction do
  @new_account = Account.create(account_params)
  raise ActiveRecord::RecordInvalid unless @new_user.persisted?
  ...
end
```

Now we can rescue this error in our code:

```ruby
Account.transaction do
  @new_account = Account.create(account_params)
  raise ActiveRecord::RecordInvalid unless @new_user.persisted?
  ...
rescue ActiveRecord::RecordInvalid => exception
  #handle the error here
end
```

There is one caveat while rescuing exceptions in transactions. While we can
rescue most exceptions in the transaction block, we should not catch
`ActiveRecord::StatementInvalid` exception in `transaction` block. This is
because `ActiveRecord::StatementInvalid` indicates that an error occurred at the
database level, for example a unique constraint is violated.

On some database systems, such as PostgreSQL, database errors inside a
transaction cause the entire transaction to become unusable until it's restarted
from the beginning.

Let's demonstrate this problem using a `User` model that has a unique constraint
on `email`:

```ruby
ActiveRecord::Base.transaction do
  User.create(email:"sam@example.com")

  begin
    # This will raise a unique constraint error
    User.create(email:"sam@example.com")
  rescue ActiveRecord::StatementInvalid
    # Since the entire transaction becomes unusable once the error is raised this block is ignored.
  end

  # On PostgreSQL the transaction is now unusable.
  # The following statement will throw an error even though no constraint is being violated.
  User.create(email:"oliver@example.com")
  # => "PG::Error: ERROR:  current transaction is aborted, commands
  #     ignored until end of transaction block"
end
```

In such cases, you should restart the entire transaction if an
`ActiveRecord::StatementInvalid` occurred.

Previously we have mentioned that exceptions thrown within a transaction block
will be propagated. The one exception to this is when `ActiveRecord::Rollback`
exception is raised which will trigger a ROLLBACK when raised, but not be
re-raised by the transaction block.

This exception is important to consider when we make use of nested transactions
in the upcoming section.

## Nested Transactions

The transactions we have used so far allow us to only work with a single
database in a block. This is suitable for our project since we are only using
one database.

But what if we are working on a project with multiple databases and we need to
ensure data integrity across multiple databases? This is where nesting Active
Record transactions come in handy.

For example, say we have two models `User` and `Account` that point to two
different databases. We want to withdraw the `subscription amount` from
`Account` and then update `subscription status` in `User`. Obviously, we want to
achieve this in a transactional way.

We can use nested transaction to make sure both the statements execute together
or not at all:

```ruby
Account.transaction do
  account = Account.find(user_id: params[:user_id])
  account.withdraw(subscription_amount)
  User.transaction do
    user = User.find(id: params[:user_id])
    user.update!(subscribed: true)
  end
end
```

If any part of the inner transaction fails, it will cause the outer transaction
to be aborted. This allows us to transactionally update records across multiple
databases.

The above snippet makes sure that the `subscribed` value is only updated if the
`subscription_amount` is withdrawn and vice versa.

As mentioned in the previous section there is one caveat when an
`ActiveRecord::Rollback` error is raised.

```ruby
User.transaction do
  User.create(username: 'Oliver')
  User.transaction do
    User.create(username: 'Sam')
    raise ActiveRecord::Rollback
  end
end
```

The above snippet results in both `Oliver` and `Sam` being created.

The reason behind this can be explained in two parts.

The first part has to the do with the way `ActiveRecord::Rollback` exception is
raised in Rails. In the above snippet the exception is caught by the inner
transaction block, which triggers a ROLLBACK. However since
`ActiveRecord::Rollback` exception is not re-raised by the transaction block,
the outer transaction is unaware of the exception ever being raised.

The second part of the reason has to do with the way nested transactions are
implemented in Rails. At the time of writing, most databases don't support
nested transactions at the database level. The only database that we're aware of
that supports nested transactions is MS-SQL. Because of this, ActiveRecord
emulates nested transactions by using savepoints. You can refer to the Official
MySQL Reference on Savepoints (Link is not available) for more information about
savepoints.

Since the inner transaction is emulated and not treated as a real transaction,
when the outer transaction sees no error raised in its block it commits all
statements instead of rolling back the inner transaction's statements.

A way around this is passing `requires_new: true` to the `transaction` method of
the inner transaction, that we think may raise the `ActiveRecord::Rollback`
exception. What this does is it instructs Rails to treat the nested emulated
transaction as real. If anything goes wrong, then the database rolls back to the
beginning of the sub-transaction without rolling back the parent transaction. We
can add it to the previous example:

```ruby
User.transaction do
  User.create(username: 'Oliver')
  User.transaction(requires_new: true) do
    User.create(username: 'Sam')
    raise ActiveRecord::Rollback
  end
end
```

This will result in only `Oliver` being created.

## Transaction Callbacks

There are two types of callbacks associated with transactions:

- after_commit
- after_rollback

`after_commit` callbacks are called on every record saved or destroyed within a
transaction immediately after the transaction is committed.

`after_rollback` callbacks are called on every record saved or destroyed within
a transaction immediately after the transaction or savepoint is rolled back.

These callbacks are useful for interacting with other systems since you will be
guaranteed that the callback is only executed when the database is in a
permanent state.

For example, `after_commit` is a good spot to put in a method that clears cache
since clearing it from within a transaction could trigger the cache to be
regenerated before the database is updated.

### References

- [ActiveRecord Transactions](https://edgeapi.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html)
- [Understanding Database Transactions in Rails](https://www.honeybadger.io/blog/database-transactions-rails-activerecord/)
