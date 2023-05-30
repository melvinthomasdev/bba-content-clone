In the last chapter we showed the tasks information on browser. We accomplished
it by taking the data from the database, creating `@tasks` instance variable and
passing this instance variable to `app/views/tasks/index.html.erb`.

We can see that all React components reside in directory
`app/javascript/src/components`. All controller code reside in directory
`app/controllers`. The Rails views are in the directory `app/views` and they are
used to compile the response in specific formats like say html, json, etc, and
send the response back to the client.

This is one way to handle frontend and backend code. We will call this Rails
monolith architecture.

Another way to design the application is by having pure APIs.

## Backend as a pure API

Some companies like to have clear separation between the frontend code and the
backend code. They go to the extent of having two different repositories - one
for the backend and one for the frontend code.

In this architecture the backend acts like a pure API. The backend returns just
JSON data. The frontend takes up that JSON data and acts on it.

Let's see what are the benefits and downsides of this architecture.

The biggest issue in such architecture is that frontend code is deployed
separately and the backend code is deployed separately. It means the frontend
team and backend team needs to spend a lot of time coordinating when to deploy
and how to deploy etc. If a feature requires both frontend change and the
backend changes then merging that pull request and testing that pull request
becomes problematic.

In the Rails monolith case pull request reviews are much simpler since both the
frontend and the backend code are in the same pull request.

In the pure API case it is much easier to onboard frontend engineers since they
do not even need to install Rails on their machine. It makes it easier to hire
and to scale the team.

In the pure API case developing a feature that requires both frontend change and
backend change takes more time since frontend team and backend needs to discuss
a lot more often. Same is the case when it comes to fixing a bug. More
coordination is needed.

In the case of pure API, the authentication must use a token and not a cookie.
This is not a big issue but something to be aware of.

In the case of pure API architecture for certain cases there might be CORS issue
since the frontend code and backend code are served from two different domains.

In the case of pure API architecture the code can be served as static asset
since it does not need to go through an application server. If the application
server is rightly configured then this will help only in the case of first hit
since after that ideally browser should be caching all the frontend code.

## Choose design that works best for the team

As everything in software engineering the answer to which design is better is
"It depends". It depends on the team composition. If most of the team members
are full stack engineers then probably Rails monolith architecture is better. If
the team has very specialized frontend and backend engineers then probably API
architecture is more suitable.

There is **nothing to commit** in this chapter.
