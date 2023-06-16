In this chapter, we'll explore SQL schema dumps in Rails, how they differ from
the default Ruby schema dumps, their benefits, and their impact on development.
We'll also discuss how to manage SQL schema dumps in Rails projects.

## Types of Schema Dumps

Rails generates schema dumps based on the `config.active_record.schema_format`
setting in the `config/application.rb` file. By default, this format is set to
`:ruby`, but it can also be set to `:sql`.

### Using the Default :ruby Schema

When the format is set to `:ruby`, the schema is stored in the db/schema.rb
file. This file is created by inspecting the database and expressing its
structure using create_table, add_index, and other similar methods.

### Using the :sql Schema Dumper

The `:ruby` schema dump may not be suitable for databases using advanced
features like triggers, sequences, stored procedures, etc., as they cannot be
expressed in the Ruby migration DSL. In such cases, you should set the schema
format to `:sql` to create an accurate schema file for generating new database
instances.

When the schema format is set to `:sql`, the database structure is dumped using
a tool specific to the database into the `db/structure.sql` file. To load the
schema from `db/structure.sql`, run `bin/rails db:schema:load`.

## Benefits of Using SQL Schema Dumps

Using SQL schema dumps in Rails projects offers several advantages over the
default `:ruby` schema, particularly when working with advanced database
features. Here are some key benefits:

- Support for advanced database features: SQL schema dumps allow you to fully
  leverage the capabilities of your database management system. For example,
  with PostgreSQL, you can utilize features like triggers, partitions, table
  constraints, materialized views, and more. The `:ruby` schema format cannot
  accurately represent these features, limiting your ability to use them in your
  application. Example: Let's say you want to create a trigger in PostgreSQL to
  automatically update a `last_modified` column whenever a row is updated. With
  an SQL schema dump, you can create the trigger using a custom SQL statement in
  your migration, and the trigger will be accurately represented in your
  `db/structure.sql` file. This would not be possible using the `:ruby` schema
  format.

- Fewer schema conflicts: With SQL schema dumps, schema conflicts are less
  frequent, as the schema version conflicts that often occur when using the
  :ruby format are reduced. This can make managing schema changes across
  multiple branches easier and more efficient.

- Increased flexibility: SQL schema dumps provide you with greater flexibility
  when designing your database schema, as you can work directly with SQL
  statements and tailor your schema to fit the specific needs of your
  application.

- Improved testing: When using SQL schema dumps, you can write test cases for
  database-level constraints, ensuring that your application behaves correctly
  under different conditions. This is especially important when using custom SQL
  statements in your migrations, as these constraints are not included in the
  :ruby schema dump.

By switching to SQL schema dumps, you can take full advantage of the features
offered by your database management system, leading to more robust and efficient
applications.

## Impact on Development

With SQL schema dumps, you'll work with plain SQL to describe the schema. You
can continue to use Rails abstractions in migrations, but the resulting database
schema is now reflected in the `db/structure.sql` file.

## Switching to SQL Schema Dumps

To switch to an SQL schema dump, set `config.active_record.schema_format` to
`:sql` and regenerate the schema in SQL. You may need to adjust some build steps
as well.

## Handling Git Conflicts When Switching to :sql Format

When switching from the `:ruby` to the `:sql` format, you may encounter git
conflicts, especially if multiple branches modify the schema. These conflicts
can be resolved by following the steps below:

- Pull in changes or rebase your feature branch onto the master branch (ignore
  conflicts in db/schema.rb and discard their changes).
- If you have new migrations in your branch, reflect their changes in
  `db/structure.sql`. To update `db/structure.sql` with the changes from your
  migrations, you have two options:

Option A: Reset the local database schema (using rake db:reset, which also drops
local database data) and re-run the migration on top of it. This results in
relevant changes to `db/structure.sql`, which should be committed (similar to
how schema.rb changes were committed previously).

Option B: Run rake db:structure:dump to dump the schema of your local database
into `db/structure.sql`. Ensure that you commit only relevant changes
corresponding to database migrations.

Once you've resolved the conflicts and updated `db/structure.sql`, commit your
changes, and continue with your normal development workflow. Remember that
switching to `:sql` format may require some adjustments and getting used to, but
it provides benefits such as the ability to use advanced PostgreSQL features and
potentially fewer schema conflicts in the long run.

## Handling Custom SQL Statements in Migrations

In some cases, you may want to use custom SQL statements in migrations to add
constraints, for instance. When using an SQL schema dump, you can add these
custom SQL statements directly to the migrations. In addition, you can maintain
a `test/extra.sql` file, which is loaded in the `test_helper.rb` file, to ensure
these custom SQL statements are executed in the test environment.

Example: Suppose you want to prevent overlapping booking slots in a scheduling
application. Then in that case, we can either resort to moving the schema format
fully to `:sql` or stick onto `:ruby` format itself and add the custom raw sql
to take care of the constraints. In BigBinary we usually go with the latter. So
in this case, we can create a migration like so:

```rb
class AddOverlapConstraintForBookingSlot < ActiveRecord::Migration[6.1]
  def up
    enable_extension "btree_gist"

    execute <<-SQL
      ALTER TABLE bookings
        ADD CONSTRAINT booking_slot_should_not_overlap
        EXCLUDE USING GIST (user_id WITH =, tsrange(starts_at, ends_at) WITH &&)
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE bookings
        DROP CONSTRAINT booking_slot_should_not_overlap
    SQL
  end
end
```

And for tests, we can add a `test/extra.sql` file with the following content:

```rb
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'booking_slot_should_not_overlap')
  THEN
    -- Rails may mistakenly create an index instead of an exclusion constraint when generating the schema.rb file.
    -- This line drops the incorrect index if it exists.
    DROP INDEX booking_slot_should_not_overlap;

    ALTER TABLE bookings
      ADD CONSTRAINT booking_slot_should_not_overlap
      EXCLUDE USING GIST (
        user_id WITH =,
        tsrange(starts_at, ends_at) WITH &&
      );
  END IF;
END $$;
```

We can add a method to execute this raw sql in the `test_helper.rb` file and
invoke it within the file like so:

```rb
def run_extra_sql
  ActiveRecord::Base.connection.execute(
    IO.read(File.expand_path("../extra.sql", __FILE__))
  )
end

run_extra_sql()
```

## Adoption of Advanced Constraints in Rails

As Rails continues to evolve, it strives to provide better support for advanced
and niche database constraints. This is important because embracing these
constraints can help developers build more robust and efficient applications
while leveraging the full power of the underlying database systems.

An example of Rails extending its support for more advanced constraints can be
seen in the addition of the add_exclusion_constraint method for PostgreSQL. You
can find its documentation at
[ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaStatements#add_exclusion_constraint](https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/PostgreSQL/SchemaStatements.html#method-i-add_exclusion_constraint).

This method allows you to create exclusion constraints directly in Rails, making
it easier to enforce rules like preventing overlapping booking slots or ensuring
that certain conditions do not coexist. By providing a clean and easy-to-use
interface for working with exclusion constraints, Rails enables developers to
harness the power of PostgreSQL's advanced features.

For example:

```rb
create_table :test_exclusion_constraints, force: true do |t|
  t.date :start_date
  t.date :end_date

  t.exclusion_constraint "daterange(start_date, end_date) WITH &&", using: :gist, where: "start_date IS NOT NULL AND end_date IS NOT NULL", name: "test_exclusion_constraints_date_overlap"
end
```

This is just one example of Rails' commitment to supporting a wider range of
database constraints. As Rails evolves, you can expect more built-in support for
advanced features from various database systems. This will empower developers to
create even more robust and efficient applications while taking advantage of the
unique capabilities of each database.

In summary, SQL schema dumps in Rails provide benefits such as the ability to
use advanced PostgreSQL features and potentially fewer schema conflicts.
However, they also require developers to become comfortable working with plain
SQL in addition to Rails abstractions.
