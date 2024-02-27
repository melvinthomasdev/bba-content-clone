In the previous chapter, we delved into the concept of transactions to enforce the integrity of the database and guard the data against program errors or database breakdowns. Transactions ensure that a given set of operations is successful when all the operations constituting the transaction are executed successfully. If any operation within a transaction fails, the entire transaction is rolled back, preventing partial or inconsistent updates.

Another critical challenge that comes in the way of maintaining the consistency and integrity of the database is parallel transactions. Parallel transactions involve the concurrent execution of multiple transactions on a database system, allowing for improved performance and efficiency. However, when various transactions attempt to modify the same database record concurrently, the result of one transaction may override the outcome of the other, resulting in data inconsistency.

By simulating a scenario, let's understand the impact of parallel transactions on data integrity.

First, generate an `Account` model:

```bash
bundle exec rails g model Account
```

Replace the content of the generated migration file with the code given below to create an `accounts` table with `name` and `balance` fields:

```rb
# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.integer :balance, null: false, default: 0
      t.timestamps
    end
  end
end
```

Run the migration to add `accounts` table:

```bash
bundle exec rails db:migrate
```

Now, open the rails console:

```bash
bundle exec rails c
```

Create a sample record to `accounts` table:

```rb
Account.create!(name: "Oliver", balance: 1100)
```

Let's simulate the situation of two users/processes trying to withdraw an amount from the above account simultaneously. Open the `rails console` in two terminal tabs for that.

Define a function that withdraws a given amount from the account with the name "Oliver":

```rb
def withdraw_from_olivers_account(amount)
  olivers_account = Account.find_by!(name: "Oliver")

  sleep(5)

  if amount > olivers_account.balance
    raise ArgumentError, "Insufficient balance"
  end

  olivers_account.balance -= amount
  olivers_account.save!
end
```

We have called the `sleep` method to simulate the condition of parallel transactions. It introduces a slight delay between read and write operations.

Copy the above `withdraw_from_olivers_account` function into each of the `irb` consoles. Now, call the function from both consoles. Initially, we have set the balance in Oliver's account as 1100. Note the `balance` after the execution of the above function:

<image>withdraw-without-lock.png</image>

Despite executing the `withdraw_from_olivers_account` function twice, one with 200 as the amount and the other with 100, only the latter withdrawal of 100 is reflected in the account balance.

This occurrence can be attributed to the concurrent execution of both processes, which independently loaded the database record and performed the withdrawal operation based on the retrieved balance. Due to the isolated nature of the transaction, each process is unaware of the change made by the other process. Consequently, each process wrote its calculated balance value back to the database without considering the modifications made by the other process. As a result, the outcome mirrored the effect of the last executed update: the withdrawal of 100.

Database locks come as a solution for the above issue. A database lock is a mechanism used in database management systems to control access to a specific piece of data or a database resource, ensuring that only one transaction can modify or access it at a time. Locking helps maintain data integrity and consistency by preventing multiple transactions from simultaneously making conflicting changes to the same data, which could lead to data corruption or inaccuracies.

Rails provides two ways to implement locking in a database: **Optimistic** and **Pessimistic** locking. Let's understand each of them in detail.

## Optimistic locking

Optimistic locking assumes that conflicts are rare and allows multiple processes to access the same record for edits.

You can implement optimistic locking by adding a `lock_version` column to the Active Record that requires safeguarding against concurrent access. Each update to the record increments the `lock_version` column. Before saving the changes to a record in the database, it checks whether another process has changed the record by looking at the `lock_version` field. If the value of `lock_version` has been updated, it will raise an `ActiveRecord::StaleObjectError` exception and ignore the update.

Let's apply the knowledge of optimistic locking by adding the `lock_version` field to the `accounts` table:

```bash
bundle exec rails g migration AddLockVersionToAccounts
```

Replace the content of the generated migration file with the code below:

```rb
# frozen_string_literal: true

class AddLockVersionToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :lock_version, :integer, default: 0, null: false
  end
end
```

The `:lock_version` column should have a `not-null` constraint and a default value of `0`.

Now, let's try running the `withdraw_from_olivers_account` function in two `irb` consoles in parallel, as we did earlier:

<image>withdraw-with-optimistic-lock.png</image>

You can see that first transaction succeeds by updating the `balance` field and the other one fails with `ActiveRecord::StaleObjectError` exception.

Optimistic locking can only identify conflicts during parallel transactions and trigger an exception when a conflict arises. We are responsible for handling the exception and addressing the conflict based on the business logic.

You can override the name of the `lock_version` column, by setting the `locking_column` class attribute:

```rb
class Account < ApplicationRecord
  self.locking_column = :lock_account
end
```

## Pessimistic locking

Pessimistic locking assumes that conflicts are likely and transactions must protect the data they access. Pessimistic locking ensures that only one process can access a record. It is based on the row-level locking in SQL.

Rails provides the Active Record methods `lock` and `with_lock` to implement pessimistic locking.

Let's update the `withdraw_from_olivers_account` function to utilize a pessimistic lock:

```rb {1, 2, 3, 13}
def withdraw_from_olivers_account_with_lock(amount)
  Account.transaction do
    olivers_account = Account.lock.find_by!(name: "Oliver")

    sleep(5)

    if amount > olivers_account.balance
      raise ArgumentError, "Insufficient funds"
    end

    olivers_account.balance -= amount
    olivers_account.save!
  end
end
```

In the above code, we have chained the `find_by!` method with `lock` to obtain an exclusive lock on the Account record named "Oliver". The lock acquired using the `lock` method is held until the transaction is committed or rolled back.

Alternatively, you can start a transaction and acquire the lock in one go by calling `with_lock` with a block:

```rb
def withdraw_from_olivers_account_with_lock(amount)
  olivers_account = Account.find_by!(name: "Oliver")

  olivers_account.with_lock do
    sleep(5)

    if amount > olivers_account.balance
      raise ArgumentError, "Insufficient funds"
    end

    olivers_account.balance -= amount
    olivers_account.save!
  end
end
```

The `with_lock` method wraps the passed block in a transaction, making the code more readable when executing a series of operations.

Copy the above `withdraw_from_olivers_account_with_lock` function into each of the `irb` consoles and run the function in parallel as we did before:

<image>withdraw-with-pessimistic-lock.png</image>

As evident from the output, the final value of `balance` includes the outcomes of both transactions.

When two transactions try to update the given row, one acquires the lock and performs the update. The other transaction is blocked until the lock gets released. Once the lock is released, the second transaction reloads the object and acquires the lock to perform the updates.

The `lock` and `with_lock` methods also accept an optional locking clause parameter to use a database-specific locking clause such as ‘LOCK IN SHARE MODE’ or ‘FOR UPDATE NOWAIT’. By default, the locking clause is “FOR UPDATE”.

You can refer to the following documentation for database-specific information on row locking:

- MySQL - [dev.mysql.com/doc/refman/en/innodb-locking-reads.html](https://dev.mysql.com/doc/refman/8.3/en/innodb-locking-reads.html)
- PostgreSQL - [www.postgresql.org/docs/current/interactive/sql-select.html#SQL-FOR-UPDATE-SHARE](https://www.postgresql.org/docs/current/sql-select.html#SQL-FOR-UPDATE-SHARE)

The following blog by BigBinary is also a great read regarding this topic:

- https://www.bigbinary.com/blog/solid-queue

## Optimistic vs Pessimistic locking

| Optimistic Locking                                                                                                               | Pessimistic Locking                                                                                                             |
| -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Assumes that conflicts are rare, so allows multiple transactions to read and modify data concurrently.                           | Assumes conflicts are common, so locks data to prevent concurrent access, allowing only one transaction at a time.              |
| No locks on the data during reads; a check is performed during updates to ensure no conflicting changes occurred since the read. | Acquires locks on the data during reads, preventing other transactions from accessing the same data until the lock is released. |
| Better concurrency as multiple transactions can proceed without waiting for locks.                                               | Lower concurrency, as transactions may need to wait for locks held by others.                                                   |
| Generally better performance under low contention scenarios.                                                                     | Performance may suffer under high contention scenarios due to increased locking and waiting.                                    |
| May require more complex conflict resolution strategies                                                                          | Simpler to implement and understand but may require careful management of locks to avoid deadlocks.                             |

## Testing parallel transactions

In Rails, test cases are wrapped in a database transaction, which means that the changes made to the database in each test case are rolled back after the test completes. This ensures that each test case is isolated and independent of others.

However, this transactional nature of tests can result in unexpected behaviour while testing parallel transactions.

Let's understand this by writing a test for the parallel execution of the `withdraw_from_olivers_account_with_lock` function.

For demonstration, we will add the `withdraw_from_olivers_account_with_lock` function within the model test file `account_test.rb`:

```rb
# frozen_string_literal: true

require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    Account.create!(name: "Oliver", balance: 1000)
  end

  def withdraw_from_olivers_account_with_lock(amount)
    olivers_account = Account.find_by!(name: "Oliver")

    olivers_account.with_lock do
      sleep(2)

      if amount > olivers_account.balance
        raise ArgumentError, "Insufficient funds"
      end

      olivers_account.balance -= amount
      olivers_account.save!
    end
  end
end
```

To simulate concurrent transactions and test how the system behaves when parallel transactions are updating the account balance, we may use [threads](https://guides.rubyonrails.org/threading_and_code_execution.html) as shown below:

```rb
def test_balance_updates_concurrently
  threads = []
  3.times do
    threads << Thread.new do
      withdraw_from_olivers_account_with_lock(100)
    end
  end

  threads.each(&:join)

  final_balance = Account.find_by!(name: "Oliver").balance

  assert_equal 700, final_balance
end
```

In the above code, we are creating three threads which invoke the `withdraw_from_olivers_account_with_lock` function. The `threads` array stores the instances of threads we have created, which is then used to call the `join` method to wait for the threads to finish their execution before proceeding to the next line of code. Finally, we check if the resulting balance matches the expected value 700.

However, if you run the test, you will notice that the test fails.

As we discussed at the beginning of the section, tests in rails are wrapped inside transactions. As a result, the transactions initiated by each thread will be nested under the test transaction. These transactions can block each other, and the test will not work as expected.

To overcome this issue while testing parallel transactions, you can turn off transactions in the test case class by setting `self.use_transactional_tests = false`:

```rb
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  self.use_transactional_tests = false

  # keep previous code as it was
end
```

With disabled transactional tests, you must clean up any data created inside tests, as changes are not automatically rolled back after the test is complete.

You can use the `DatabaseCleaner` gem for this purpose:

```rb {6-7, 10, 14-16, }
# frozen_string_literal: true

require "test_helper"

class AccountTest < ActiveSupport::TestCase
  self.use_transactional_tests = false
  DatabaseCleaner.strategy = :truncation

  def setup
    DatabaseCleaner.start
    Account.create!(name: "Oliver", balance: 1000)
  end

  def teardown
    DatabaseCleaner.clean
  end

  def withdraw_from_olivers_account_with_lock(amount)
    olivers_account = Account.find_by!(name: "Oliver")

    olivers_account.with_lock do
      sleep(2)

      if amount > olivers_account.balance
        raise ArgumentError, "Insufficient funds"
      end

      olivers_account.balance -= amount
      olivers_account.save!
    end
  end

  def test_balance_updates_concurrently
    threads = []
    3.times do
      threads << Thread.new do
        withdraw_from_olivers_account_with_lock(100)
      end
    end

    threads.each(&:join)

    final_balance = Account.find_by!(name: "Oliver").balance

    assert_equal 700, final_balance
  end
end
```

We've opted for the `DatabaseCleaner.strategy = :truncation` to override the default transaction strategy with truncation of the database tables after each test using the DatabaseCleaner gem. The truncation strategy allows the persistence of changes made by one thread, ensuring visibility across other threads.

You will learn about the usage of the `DatabaseCleaner` gem and various database cleaning strategies in the in-depth chapter [Database cleaning and strategies](https://courses.bigbinaryacademy.com/learn-rubyonrails/database-cleaning-and-strategies/) later.

The changes we made to the files were for demonstration only. Let's roll back the transactions and revert the changes.

```bash
bundle exec rails db:rollback STEP=2
bundle exec rails d migration AddLockVersionToAccounts
bundle exec rails d migration CreateAccounts
git clean -fd
```
