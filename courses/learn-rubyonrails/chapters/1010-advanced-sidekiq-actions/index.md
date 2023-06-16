As your Sidekiq usage grows and becomes more complex, there will be times when you need to perform advanced actions to manage and maintain your background job processing system. In this chapter, we will explore some commonly needed Sidekiq actions that go beyond the basic job processing.

## Clearing the Retry Queue

Sometimes, jobs in Sidekiq may fail and get automatically retried according to the retry configuration. However, there might be situations where you need to clear the retry queue manually. To do this, you can use the `Sidekiq::RetrySet` class. Let's say you want to clear the retry queue:

```rb
Sidekiq::RetrySet.new.clear
```

By executing this code, you ensure that all the jobs in the retry queue are removed, and Sidekiq will no longer attempt to retry them automatically. Clearing the retry queue can be useful when you need to investigate and resolve the underlying issues causing job failures.

## Clearing the Dead Queue

The dead queue in Sidekiq contains jobs that have exceeded the maximum number of retries and have been deemed permanently failed. If you want to clear the dead queue, you can utilize the `Sidekiq::DeadSet` class. To clear the dead queue, you can run the following code:

```rb
Sidekiq::DeadSet.new.clear
```

By executing this code, you effectively remove all the jobs from the dead queue. Clearing the dead queue can be helpful if you want to discard failed jobs that are no longer relevant or investigate the reasons behind job failures.

## Disabling a Cron Job

Sidekiq provides the ability to schedule jobs using the `sidekiq-cron` gem. These scheduled jobs, also known as cron jobs, can be disabled when necessary. To disable a cron job, you first need to find it using the `Sidekiq::Cron::Job.find` method. Let's assume you have a cron job named `job-A` that you want to disable:

```rb
job = Sidekiq::Cron::Job.find('job-A')
job.disable!
```

With these lines of code, you can locate the specified cron job and disable it, preventing it from being executed according to the schedule. Disabling a cron job is useful when you need to temporarily suspend the execution of a recurring job or debug any issues related to it.

## Clearing All Queues

In certain scenarios, you may want to clear all the queues in your Sidekiq setup. To achieve this, you can make use of the `Sidekiq::Queue` class. The following code snippet demonstrates how to clear all the queues:

```rb
Sidekiq::Queue.all.map(&:clear)
```

By executing this code, you clear all the queues, removing any pending jobs they contain. Clearing all the queues can be handy when you need to start with a clean slate or during maintenance tasks that require emptying the queues.

## Clearing All Scheduled Jobs

Sidekiq allows you to schedule jobs to run at specific times using the `Sidekiq::ScheduledSet` class. However, there might be instances where you need to clear all the scheduled jobs. To achieve this, you can utilize the `clear` method of the `Sidekiq::ScheduledSet` class:

```rb
Sidekiq::ScheduledSet.new.clear
```

By executing this code, you remove all the scheduled jobs, preventing them from being enqueued at their designated times. Clearing all scheduled jobs can be beneficial when you need to halt the execution of
recurring jobs temporarily or perform maintenance tasks that involve resetting the schedule.

## Resetting Statistics

Sidekiq provides a handy `Stats` class that allows you to gather information about the performance and status of your background job processing. In some cases, you may need to reset the statistics to start collecting fresh data. To reset the statistics, you can use the reset method of the `Sidekiq::Stats` class:

```rb
Sidekiq::Stats.new.reset
```

Executing this code will reset the statistics, clearing all the accumulated data about processed jobs, failures, and other metrics. Resetting the statistics can be useful when you want to analyze the performance of Sidekiq over a specific period or after making significant changes to your setup.

## Filtering and Retrying Failed Jobs

In certain situations, you may encounter specific types of job failures that need to be addressed and retried selectively. Sidekiq provides a way to filter and retry jobs from the failure queue in batches. Consider the following example:

```ruby
Sidekiq::Failures::FailureSet.new.scan("TooManyRequests").each_with_index do |job, i|
  next unless job.value.include?("Octokit::TooManyRequests") &&
    job.created_at.to_time > Time.zone.now - 10.hour
  job.retry
  break if i >= 20
end
```

In this code snippet, the `FailureSet` class is used to scan and filter jobs with the error message `TooManyRequests`. The `scan` method returns an enumerable that iterates over the matching jobs. By inspecting the job value and creation time, you can apply additional conditions to select specific jobs for retry. In this case, only jobs with the `Octokit::TooManyRequests` error message that were created within the last 10 hours are retried. The `retry` method is called on each selected job to enqueue it for processing again. Additionally, the loop breaks after 20 retries to perform the retry in batches.

## Deleting Specific Job Failures

Sometimes, you may need to remove specific job failures from the failure queue altogether. For example, you might want to delete failures related to unique violations or record not found errors. The following code demonstrates how to accomplish this:

```ruby
jobs_handler = Proc.new do |job|
  next unless job.value.include?("PG::UniqueViolation") || job.value.include?("ActiveRecord::RecordNotFound")
  job.delete
end

Sidekiq::Failures::FailureSet.new.scan("UniqueViolation").each(&jobs_handler)
Sidekiq::Failures::FailureSet.new.scan("RecordNotFound").each(&jobs_handler)
```

In this code, a `Proc` object named `jobs_handler` is defined to handle the deletion of specific job failures. The `scan` method is used to filter jobs with matching error messages, such as `UniqueViolation` or `RecordNotFound`. For each matching job, the `jobs_handler` proc is executed, and the `delete` method is called to remove the job from the failure queue.

## Destroying a Specific Cron Job

If you need to remove a specific cron job, you can utilize the destroy method of the `Sidekiq::Cron::Job` class. For example:

```ruby
Sidekiq::Cron::Job.destroy("worker_name")
```

By executing this command, the cron job with the specified worker name is destroyed. However, keep in mind that cron jobs can sometimes be present in the `RetrySet` and might run again. To prevent this, it is necessary to clear the job from the `RetrySet` as well, using the following command:

```ruby
Sidekiq::RetrySet.new.scan('worker_name') { |job| job.display_class == 'worker_name'}.map(&:delete)
```

This code scans the `RetrySet` for jobs matching the worker name and deletes them, ensuring that the cron job is fully removed from the system. Similarly, you can use the same approach for killing or retrying jobs by modifying the condition. Additionally, you can apply this logic to other sets, such as `Sidekiq::DeadSet` or `Sidekiq::ScheduledSet`, if needed.

By leveraging these advanced Sidekiq actions, you can fine-tune your background job processing and efficiently manage failures, deletion of specific jobs, and the removal of cron jobs from various sets. These techniques provide you with greater control and flexibility when working with Sidekiq in the Rails console or any other context where you need to interact with Sidekiq's API directly.

## Conclusion

In this chapter, we delved into some advanced Sidekiq actions that go beyond basic job processing. We explored how to clear the retry queue, remove jobs from the dead queue, disable cron jobs, clear all queues, clear all scheduled jobs, reset statistics among others. These actions provide you with additional control and flexibility in managing your Sidekiq setup.

By understanding and utilizing these actions effectively, you can maintain a well-organized and efficient background job processing system. Whether you need to handle job failures, temporarily disable jobs, or reset metrics for analysis, Sidekiq offers the necessary tools to streamline your job processing workflow.
