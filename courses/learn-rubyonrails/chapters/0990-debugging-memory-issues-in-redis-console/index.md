When using Sidekiq and Redis, memory issues can occur due to several reasons.
Some common reasons include memory leaks, inefficient data structures, and
improper configuration settings. Debugging these issues requires a systematic
approach and careful analysis of logs and performance metrics. In this chapter,
we will see some `redis-cli` commands that will aid us in debugging
memory-related issues.

Open up the console and connect to Redis using the below command.

```bash
redis-cli -h <REDIS_HOST> -p <REDIS_PORT> -n <DB_NO>
```

You can get the values for `REDIS_HOST`, `REDIS_PORT` and `DB_NO` by inspecting
the Sidekiq server log. It should have a log in the following format:

```bash
INFO: Booting Sidekiq 6.5.8 with Sidekiq::RedisConnection::RedisAdapter options {:url=>"redis://localhost:6379/1", :size=>9}
```

In this case, `127.0.0.1` is the value for `REDIS_HOST`, `6379` is the value for
`REDIS_PORT` and `1` is the `DB_NO`. You can test whether the connection is
alive by typing `PING` into the Redis console.

```bash
> PING
PONG
```

We can see the memory usage of Redis by typing the following into the console:

```bash
> INFO memory
# Memory
used_memory:2535568
used_memory_human:2.42M
used_memory_rss:2347008
used_memory_rss_human:2.24M
used_memory_peak:5829616
used_memory_peak_human:5.56M
.
.
maxmemory:0
maxmemory_human:0B
maxmemory_policy:noeviction
.
.
.
```

It is not uncommon to observe that the `maxmemory_human` metric is reported as
0B, while the `used_memory_human` metric indicates a non-zero value, such as
2.42M. This is a result of configuring the `maxmemory` parameter to a value of
zero, which indicates that there are no enforced memory constraints on the
system. This behavior is the default for 64-bit systems, while 32-bit systems
have an implicit memory limit of 3GB.

You can set the max memory limit using the `CONFIG SET` command.

```bash
> CONFIG SET maxmemory 128M
OK
```

Upon setting the `maxmemory` value, the system will operate within the memory
constraints defined by this value. However, once the specified amount of memory
is reached, the default behavior of the system will depend on the eviction
policies that have been configured.

If you observe the output of `INFO memory` command, you might see
`maxmemory_policy` set to `noeviction`. With `noeviction` policy, Redis will
stop responding after the `maxmemory` value is reached. However, no data will be
evicted. You can learn about other eviction policies from the
[official docs](https://redis.io/docs/reference/eviction/).

## Inspecting keys

Now assume that you encountered a memory overflow error while using Sidekiq. How
would you get to know what caused the error? Redis is an in-memory, key/value
store. So an intuitive way would be to inspect the keys and their memory usage.

```bash
> KEYS *
 1) "stat:processed:2023-04-01"
 2) "cron_jobs"
 3) "stat:failed:2023-03-11"
 4) "stat:processed:2023-03-10"
 5) "stat:processed:2023-04-04"
 6) "stat:processed:2023-03-13"
 7) "stat:failed:2023-04-03"
.
.
.
17) "stat:failed:2023-03-31"
18) "cron_job:todo_notifications_worker:jid_history"
19) "cron_job:todo_notifications_worker"
20) "stat:processed:2023-03-31"
21) "processes"
22) "cron_job:todo_notifications_worker:enqueued"
.
.
.
```

Executing the above command will provide a list of all the keys currently stored
in the Redis database. In certain scenarios, an excessive memory load may be
attributed to a large number of stored keys. Redis facilitates efficient key
inspection and management by providing a command, `KEYS *<substring>*`, which
enables users to narrow down their search by filtering keys based on a specific
substring. For instance, if one wants to inspect keys containing the substring
`failed`, the following command can be utilized:

```bash
> KEYS *failed*
 1) "stat:failed:2023-03-11"
 2) "stat:failed:2023-04-03"
 3) "stat:failed:2023-03-13"
 4) "stat:failed:2023-03-10"
 5) "failed"
 6) "stat:failed:2023-03-31"
 7) "stat:failed:2023-04-02"
 8) "stat:failed"
 9) "stat:failed:2023-04-01"
10) "stat:failed:2023-03-12"
11) "stat:failed:2023-03-09"
12) "stat:failed:2023-04-04"
```

You can also see the value of these keys. For this, you need to inspect the type
of key first.

```bash
> type <key>
```

Depending on the response from the previous command you can use the following
commands to see the corresponding values.

- For "string": `get <key>`
- For "hash": `hgetall <key>`
- For "list": `lrange <key> 0 -1`
- For "set": `smembers <key>`
- For "zset": `zrange <key> 0 -1 withscores`

## Inspecting memory usage

Sometimes, the number of keys will be less but the memory may be overloaded. In
this case, you can use the `MEMORY USAGE <key>` command to check the memory
usage of a specific key. For example, to see the memory usage corresponding to
key `cron_job:todo_notifications_worker:enqueued` use the following command:

```bash
> MEMORY USAGE cron_job:todo_notifications_worker:enqueued
(integer) 72739
```

An efficient method would be to use a bash script to list all the keys with
their memory usage. For doing this, you can quit the Redis console and type the
following into the terminal:

```bash
REDIS_HOST=127.0.0.1
REDIS_PORT=6379
DB_NO=1
KEYS_LIST=`redis-cli -h $REDIS_HOST -p $REDIS_PORT -n $DB_NO keys  "*"|awk '{print $1}'`
{ echo "KEY | MEMORY_USAGE(bytes)"
echo "---- | ------------------ "
while read LINE
do
    MEM_USAGE=`redis-cli -h $REDIS_HOST -p $REDIS_PORT -n $DB_NO memory usage "$LINE"`;
    echo "$LINE | $MEM_USAGE";
done <<< "$KEYS_LIST" }  | column -t
```

Make sure you enter proper values for `REDIS_HOST`, `REDIS_PORT` and `DB_NO`.
This would print all the keys with their memory usage.

```bash
KEY                                                |  MEMORY_USAGE(bytes)
----                                               |  ------------------
stat:processed:2023-04-01                          |  72
cron_jobs                                          |  216
stat:failed:2023-03-11                             |  72
stat:processed:2023-03-10                          |  72
stat:processed:2023-04-04                          |  72
stat:processed:2023-03-13                          |  72
stat:failed:2023-04-03                             |  72
.
.
.
```

Now by observing the memory consumed by the keys, you will be able to identify
which key is responsible for memory overload. Normally this happens when we try
to store a large amount of data in Redis. You should avoid this as it can
negatively impact performance. Instead, use Redis to store small amounts of
metadata, such as job identifiers or timestamps.
