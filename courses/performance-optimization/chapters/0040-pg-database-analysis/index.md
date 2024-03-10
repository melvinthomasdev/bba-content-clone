## Check Cache hit ratio

**Analysis Code**

```ruby
  RubyPgExtras.cache_hit
```

The cache hit ratio values of the output should be more than 0.99(99%), database can be scaled-up or re-configured if not in expected range for better performance.

**Sample output**

```bash
            name      |         ratio
    ----------------+------------------------
    index hit rate |        0.999577
    table hit rate |        0.988721
```

## Analysis for index utility check

**Analysis Code**

```ruby
  RubyPgExtras.index_usage
```

This command provides information on the efficiency of indexes, represented as what percentage of total scans were index scans. A low percentage can indicate under indexing, or wrong data being indexed.

**Sample output**

    |   relname  |   percent_of_times_index_used  |   rows_in_table  |
    |---|---|---|
    |   activities  |   99  |   4301  |
    |   comments  |   99  |   21247  |
    |   contact_details  |   98  |   326  |
    |   customer_details  |   96  |   66  |
    |   desk_automation_execution_log_entries  |   2  |   9371  |
    |   desk_business_hours  |   98  |   118  |
    |   desk_customer_satisfaction_survey_responses  |   96  |   4  |
    |   desk_customer_satisfaction_surveys  |   95  |   4159  |

## Analysis for index utility check

**Analysis Code**

```ruby
  RubyPgExtras.index_usage
```

This command provides information on the efficiency of indexes, represented as what percentage of total scans were index scans. A low percentage can indicate under indexing, or wrong data being indexed.

**Sample output**

    |   relname  |   percent_of_times_index_used  |   rows_in_table  |
    |---|---|---|
    |   activities  |   99  |   4301  |
    |   comments  |   99  |   21247  |
    |   contact_details  |   98  |   326  |
    |   customer_details  |   96  |   66  |
    |   desk_automation_execution_log_entries  |   2  |   9371  |
    |   desk_business_hours  |   98  |   118  |
    |   desk_customer_satisfaction_survey_responses  |   96  |   4  |
    |   desk_customer_satisfaction_surveys  |   95  |   4159  |

## Analysis for duplicate index removal

**Analysis Code**

```ruby
  RubyPgExtras.duplicate_indexes
```

This command displays multiple indexes that have the same set of columns, same opclass, expression and predicate - which make them equivalent. Usually it will be safe to drop one of them.

**Sample output**

```bash
    | size       |  idx1        |  idx2          |  idx3    |  idx4     |
    +------------+--------------+----------------+----------+-----------+
    | 128 k      | users_pkey   | index_users_id |          |           |
```

## Fix slow queries reported through outliers

**Analysis Code**

```ruby
  RubyPgExtras.outliers
```

This command displays statements, obtained from pg_stat_statements, ordered by the amount of time to execute in aggregate. This includes the statement itself, the total execution time for that statement, the proportion of total execution time for all statements that statement has taken up, the number of times that statement has been called, and the amount of time that statement spent on synchronous I/O (reading/writing from the file system).

Typically, an efficient query will have an appropriate ratio of calls to total execution time, with as little time spent on I/O as possible. Queries that have a high total execution time but low call count should be investigated to improve their performance. Queries that have a high proportion of execution time being spent on synchronous I/O should also be investigated.


**Sample output**

    |   total_exec_time  |   prop_exec_time  |   ncalls  |   sync_io_time  |   query  |
    |---|---|---|---|---|
    |   00:01:13.411278  |   0.2%  |   51  |   00:00:00.02819  |   COPY public.activities (id, key, action, trackable_type, trackable_id, owner_type, owner_id, recipient_type, recipient_id, created_at, updated_at, old_value, new_value) TO stdout  |
    |   00:01:15.823226  |   0.2%  |   584  |   00:00:00.000372  |   SELECT DISTINCT "neeto_rules".* FROM "neeto_rules" WHERE "neeto_rules"."deleted_at" IS NULL AND "neeto_rules"."type" = $1 AND "neeto_rules"."owner_id" = $2 AND "neeto_rules"."owner_type" = $3 AND ("neeto_rules"."id" IN (SELECT "neeto_rules"."id" FROM "neeto_rules" INNER JOIN "organizations" ON "organizations"."cancelled_at" IS NULL AND "organizations"."id" = "neeto_rules"."owner_id" ... |
    |   00:01:30.287186  |   0.2%  |   77,87,701  |   00:00:00  |   SELECT "neeto_tags_tags"."id" FROM "neeto_tags_tags" INNER JOIN "neeto_tags_taggings" ON "neeto_tags_tags"."id" = "neeto_tags_taggings"."tag_id" WHERE "neeto_tags_tags"."type" = $1 AND "neeto_tags_taggings"."taggable_id" = $2 AND "neeto_tags_taggings"."taggable_type" = $3  |
    |   00:02:06.078133  |   0.3%  |   38,95,461  |   00:00:00.051403  |   SELECT "neeto_rules_conditions".* FROM "neeto_rules_conditions" WHERE "neeto_rules_conditions"."type" = $1 AND "neeto_rules_conditions"."conditionable_id" = $2 AND "neeto_rules_conditions"."conditionable_type" = $3 ORDER BY "neeto_rules_conditions"."sequence" ASC  |
    |   00:04:02.57606  |   0.6%  |   2,03,675  |   00:00:00  |   SELECT "organizations".* FROM "organizations" WHERE "organizations"."cancelled_at" IS NULL AND "organizations"."enabled" = $1 AND "organizations"."subdomain" = $2 LIMIT $3  |
    |   00:04:47.673122  |   0.7%  |   38,384  |   00:00:00.003751  |   SELECT "neeto_rules".* FROM "neeto_rules" INNER JOIN "organizations" ON "organizations"."cancelled_at" IS NULL AND "organizations"."id" = "neeto_rules"."owner_id" ...  |
    |   00:13:03.178497  |   1.9%  |   38,007  |   00:00:00  |   SELECT queryid AS query_id, calls, total_time, blk_read_time, blk_write_timeFROM (SELECT queryid,SUM(calls) OVER (PARTITION BY queryid) AS calls,SUM(total_exec_time) OVER (PARTITION BY queryid) AS total_time,SUM(blk_read_time) OVER (PARTITION BY queryid) AS blk_read_time,SUM(blk_write_time) OVER (PARTITION BY queryid) AS blk_write_time,(total_exec_time / SUM(total_exec_time) over ()) * $1 AS time_spentFROM public.pg_stat_statements($2)WHERE userid = (SELECT usesysidFROM pg_userWHERE usename = current_user LIMIT $3)) tsWHERE time_spent >= $4GROUP BY queryid, calls, total_time, blk_read_time, blk_write_time  |
    |   00:54:11.2774  |   7.7%  |   38,89,830  |   00:00:00.000199  |   SELECT "desk_automation_execution_log_entries"."ticket_id" FROM "desk_automation_execution_log_entries" WHERE "desk_automation_execution_log_entries"."rule_id" = $1 GROUP BY "desk_automation_execution_log_entries"."ticket_id" HAVING (count(ticket_id) >= $2)  |
    |   04:17:02.866623  |   36.6%  |   38,89,837  |   00:00:00  |   SELECT "neeto_rules_events".* FROM "neeto_rules_events" WHERE "neeto_rules_events"."type" = $1 AND "neeto_rules_events"."rule_id" = $2 AND "neeto_rules_events"."name" = $3 LIMIT $4  |
    |   05:49:30.220956  |   49.8%  |   38,91,912  |   00:00:00.006247  |   SELECT "neeto_rules_condition_groups".* FROM "neeto_rules_condition_groups" WHERE "neeto_rules_condition_groups"."type" = $1 AND "neeto_rules_condition_groups"."rule_id" = $2 ORDER BY "neeto_rules_condition_groups"."sequence" ASC  |

## Fix slow queries with high seq scans

**Analysis Code**

```ruby
  RubyPgExtras.seq_scans
```

This command displays the number of sequential scans recorded against all tables. Tables that have very high numbers of sequential scans may be under-indexed, and it may be worth investigating queries that read from these tables.


**Sample output**

    |   name  |   count  |
    |---|---|
    |   active_storage_attachments  |   633  |
    |   companies  |   1695  |
    |   desk_automation_execution_log_entries  |   3893841  |
    |   desk_task_lists  |   755  |
    |   desk_ticket_colliders  |   13533  |
    |   desk_ticket_field_options  |   53  |
    |   desk_ticket_field_regexes  |   2750  |
    |   desk_ticket_field_responses  |   1978  |
    |   devices  |   1497  |
    |   email_configurations  |   435  |
    |   neeto_custom_domains_engine_domains  |   133164  |
    |   neeto_rules_condition_groups  |   3893244  |
    |   neeto_rules_events  |   3932256  |
    |   organizations  |   211918  |

## Check other postgres health stats

1. Locks

**Analysis Code**

```ruby
  RubyPgExtras.locks
```

This command displays queries that have taken out an exclusive lock on a relation. Exclusive locks typically prevent other operations on that relation from taking place, and can be a cause of "hung" queries that are waiting for a lock to be granted.

**Sample output**
```bash
procpid | relname | transactionid | granted | query_snippet         | mode         |  age             |application |
--------+---------+---------------+---------+-----------------------+--------------+------------------+------------+
31776   |         |               | t       | <IDLE> in transaction | ExclusiveLock|  00:19:29.837898 |  bin/rails

```

2. Bloat

**Analysis Code**

```Ruby
  RubyPgExtras.bloat
```

This command displays an estimation of table "bloat" – space allocated to a relation that is full of dead tuples, that has yet to be reclaimed. Tables that have a high bloat ratio, typically 10 or greater, should be investigated to see if vacuuming is aggressive enough, and can be a sign of high table churn.

**Sample output**
        |   type  |   schemaname  |   object_name  |   bloat  |   waste  |
        |---|---|---|---|---|
        |   index  |   public  |   server_side_sessions::index_server_side_sessions_on_session_id  |   5.4  |   4344 kB  |
        |   index  |   public  |   server_side_sessions::index_server_side_sessions_on_updated_at  |   1.9  |   856 kB  |
        |   index  |   public  |   server_side_sessions::server_side_sessions_pkey  |   1.7  |   656 kB  |
        |   index  |   public  |   groups::groups_pkey  |   73  |   576 kB  |
        |   index  |   public  |   groups::index_groups_on_organization_id  |   33  |   256 kB  |
        |   index  |   public  |   active_storage_attachments::index_active_storage_attachments_un  |   1.8  |   208 kB  |
        |   index  |   public  |   desk_customer_satisfaction_surveys::index_desk_customer_satisfa  |   1.4  |   184 kB  |
        |   index  |   public  |   groups::index_groups_on_business_hour_id  |   18  |   136 kB  |
        |   index  |   pg_catalog  |   pg_depend::pg_depend_reference_index  |   1.2  |   72 kB  |
        |   index  |   public  |   action_mailbox_inbound_emails::index_action_mailbox_inbound_ema  |   1.3  |   64 kB  |
        |   index  |   public  |   desk_ticket_response_times::ticket_response_times_pkey  |   1.1  |   64 kB  |
        |   index  |   public  |   schema_migrations::schema_migrations_pkey  |   2.5  |   24 kB  |
        |   index  |   public  |   companies::index_companies_on_domains  |   3  |   16 kB  |

3. Vacuum Stats

**Analysis Code**

```ruby
  RubyPgExtras.vacuum_stats
```

This command displays statistics related to vacuum operations for each table, including an estimation of dead rows, last autovacuum and the current autovacuum threshold. This command can be useful when determining if current vacuum thresholds require adjustments, and to determine when the table was last vacuumed.

**Sample output**
        |   schema  |   table  |   last_vacuum  |   last_autovacuum  |   rowcount  |   dead_rowcount  |   autovacuum_threshold  |   expect_autovacuum  |
        |---|---|---|---|---|---|---|---|
        |   public  |   forward_emails  |     |     |   69  |   5  |   64  |     |
        |   public  |   desk_ticket_response_times  |     |     |   13,021  |   21  |   2,654  |     |
        |   public  |   desk_ticket_followers  |     |     |   21,039  |   340  |   4,258  |     |
        |   public  |   desk_customer_satisfaction_survey_acknowledgements  |     |     |   3,692  |   7  |   788  |     |
        |   public  |   desk_ticket_colliders  |     |   2022-12-13 16:56  |   0  |   43  |   50  |     |
        |   public  |   desk_ticket_field_options  |     |     |   22,167  |   30  |   4,483  |     |
        |   public  |   desk_ticket_field_regexes  |     |     |   1  |   0  |   50  |     |
        |   public  |   desk_task_lists  |     |     |   13  |   0  |   53  |     |
        |   public  |   desk_customer_satisfaction_surveys  |     |   2022-12-08 16:06  |   4,140  |   7  |   878  |     |
        |   public  |   neeto_notifications  |     |   2022-12-13 17:43  |   1,366  |   0  |   323  |     |


## Quick analysis of Postgres health through diagnose and table_info

**Analysis Code**

```ruby
  RubyPgExtras.diagnose
```

Diagnose method runs a set of checks and prints out a report highlighting areas that may require additional investigation:

**Sample Output**

    |   ok  |   message  |   check_name  |
    |---|---|---|
    |   false  |   Unused indexes detected:'index_activities_on_owner_id_and_owner_type' on 'public.activities' size 1760 kB  |   unused_indexes  |
    |   false  |   Bloat detected:'groups::groups_pkey' bloat 73.0 waste 576 kB,'groups::index_groups_on_organization_id' bloat 33.0 waste 256 kB,'groups::index_groups_on_business_hour_id' bloat 18.0 waste 136 kB  |   bloat  |
    |   false  |   Queries using significant execution ratio detected:'SELECT "neeto_rules_condition_...' called 3,891,912 times, using 49.8% of total exec time.,'SELECT "neeto_rules_events".* ...' called 3,889,837 times, using 36.6% of total exec time.  |   outliers  |
    |   true  |   Table cache hit ratio is correct: 0.999996.  |   table_cache_hit  |
    |   true  |   Index hit ratio is correct: 0.999865.  |   index_cache_hit  |
    |   true  |   No null indexes detected.  |   null_indexes  |
    |   true  |   No duplicate indexes detected.  |   duplicate_indexes  |


**Analysis Code**

```ruby
  RubyPgExtras.table_info
```

This method displays metadata metrics for all or a selected table. You can use it to check the table's size, its cache hit metrics, and whether it is correctly indexed. Many sequential scans or no index scans are potential indicators of misconfigured indexes. This method aggregates data provided by other methods in an easy to analyze summary format.

**Sample Output**

    |   table_name  |   table_size  |   table_cache_hit  |   indexes_cache_hit  |   estimated_rows  |   sequential_scans  |   indexes_scans  |
    |---|---|---|---|---|---|---|
    |   comments  |   3728 kB  |   0.998826330344797  |   0.999688121320806  |   21247  |   591  |   65947  |
    |   companies  |   16 kB  |   0.999414862492686  |   0.993814432989691  |   7  |   1695  |   0  |
    |   contact_details  |   1976 kB  |   0.998691545328222  |   0.996814174740333  |   326  |   87  |   8144  |
    |   customer_details  |   112 kB  |   0.997172236503856  |   0.999336241228902  |   66  |   169  |   4079  |
    |   desk_automation_execution_log_entries  |   1040 kB  |   0.999999942983317  |   0.999883183711137  |   9371  |   3893841  |   81641  |
    |   desk_business_hours  |   712 kB  |   0.999418734327793  |   0.997201678992604  |   118  |   57  |   2811  |
    |   desk_business_hours_holidays  |   456 kB  |   0.991840435176791  |   0.988964621876014  |   118  |   104  |   699  |
    |   desk_business_hours_schedules  |   2520 kB  |   0.994441754971043  |   0.988113273511246  |   590  |   53  |   1417  |
    |   desk_customer_satisfaction_questions  |   848 kB  |   0.998567016333231  |   0.996244284781189  |   119  |   53  |   2022  |
    |   desk_customer_satisfaction_scale_choices  |   1352 kB  |   0.99023693296821  |   0.987247780468119  |   357  |   53  |   1234  |
    |   desk_customer_satisfaction_survey_acknowledgements  |   584 kB  |   0.9976647206005  |   0.984491315136476  |   119  |   87  |   190  |
    |   desk_customer_satisfaction_survey_responses  |   80 kB  |   0.994733377221857  |   0.99880810488677  |   4  |   118  |   2996  |
    |   desk_customer_satisfaction_surveys  |   1232 kB  |   0.999059661352709  |   0.997071967945754  |   4159  |   87  |   1733  |
    |   desk_task_items  |   16 kB  |   0.995833333333333  |   0.981132075471698  |   5  |   230  |   0  |
    |   desk_task_lists  |   16 kB  |   0.998687664041995  |   0.996592844974446  |   1  |   755  |   0  |
    |   desk_ticket_colliders  |   40 kB  |   0.998722577061927  |   0.999869201255668  |   2  |   13533  |   644  |
    |   desk_ticket_field_options  |   2408 kB  |   0.995028218220908  |   0.998254623569295  |   710  |   53  |   25210  |
    |   desk_ticket_field_regexes  |   16 kB  |   0.999636363636364  |   0.99931129476584  |   0  |   2750  |   0  |
    |   desk_ticket_field_responses  |   56 kB  |   0.999373956594324  |   0.998913043478261  |   2  |   1978  |   40  |
    |   desk_ticket_fields  |   4424 kB  |   0.995696042881917  |   0.997844524623963  |   950  |   116  |   26628  |
    |   desk_ticket_followers  |   2384 kB  |   0.993264310365346  |   0.99616769784837  |   833  |   104  |   5293  |
    |   desk_ticket_response_times  |   1040 kB  |   0.998099505562423  |   0.995764092538286  |   966  |   821  |   223  |
    |   desk_ticket_status_changes  |   1888 kB  |   0.998436347745336  |   0.995536959553696  |   1403  |   655  |   20  |
    |   desk_ticket_statuses  |   3536 kB  |   0.992794460328216  |   0.98931650893796  |   944  |   53  |   3920  |
    |   desk_twitter_accounts  |   16 kB  |   1  |   0.970588235294118  |   3  |   139  |   0  |
    |   desk_twitter_activities  |   96 kB  |   0.990384615384615  |   0.99266862170088  |   0  |   104  |   390  |
    |   desk_twitter_webhooks  |   16 kB  |   0.990384615384615  |   0.980392156862745  |   0  |   104  |   0  |
    |   devices  |   48 kB  |   0.99933818663137  |   0.996763754045307  |   8  |   1497  |   0  |
