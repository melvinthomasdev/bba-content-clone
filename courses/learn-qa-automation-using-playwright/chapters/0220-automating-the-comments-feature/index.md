Now that we have seen how to write tests on our own and
the best practices we should apply when writing them, let's
try automating the comments section of the granite app on our
own.

<image>playwright-granite-comments-section.png</image>

For the comments feature we have the following cases.

1. Add a new comment as a creator of a task in the task details page.
    - Check if the comment persists on the page.
    - Check if the comments count increased for that task on the pending tasks table when 
    signed in as the creator.
    - Check if the comment is visible when you 
    sign in as the assignee for the task.
    - Check if the comments count increased for 
    that task on the pending tasks table signed 
    in as the assignee.
2. Add a new comment as an assignee of a task in the task details page.
    - Check if the comment persists on the page.
    - Check if the comments count increased for 
    that task on the pending tasks table when 
    signed in as the assignee.
    - Check if the comment is visible when you 
    sign in as the creator for the task.
    - Check if the comments count increased for 
    that task on the pending tasks table signed 
    in as the creator.

These are simple tests which cover all the core concepts which
we learned throughout this book. Let's try writing these tests
on our own applying code reusability and the best practices
that we've learned.

If you are employed at BigBinary, you can add any questions or
concerns on completing this task in the automation slack
channel.
