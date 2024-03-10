## Add the gem to gemfile

```ruby
    gem "ruby-pg-extras"
```

For additional setup reference and details - https://github.com/pawurb/ruby-pg-extras

## Use rake task to generate the report

```ruby
desc "Generate Postgres Stats through ruby-pg-extras gem"
task print_pg_stats: :environment do
checks = [
    "RubyPgExtras.cache_hit(in_format: :hash)",
    "RubyPgExtras.diagnose(in_format: :hash)",
    "RubyPgExtras.table_info(in_format: :hash)",
    "RubyPgExtras.index_info(in_format: :hash)",
    "RubyPgExtras.index_usage(in_format: :hash)",
    "RubyPgExtras.unused_indexes(in_format: :hash)",
    "RubyPgExtras.duplicate_indexes(in_format: :hash)",
    "RubyPgExtras.seq_scans(in_format: :hash)",
    "RubyPgExtras.long_running_queries(in_format: :hash, args: { threshold: '100 milliseconds' })",
    "RubyPgExtras.outliers(in_format: :hash)",
    "RubyPgExtras.locks(in_format: :hash)",
    "RubyPgExtras.bloat(in_format: :hash)",
    "RubyPgExtras.vacuum_stats(in_format: :hash)",
]

output = checks.map do |check|
  [ check.split("(").first, eval(check) ]
end.to_h

puts output.to_json
end
```
