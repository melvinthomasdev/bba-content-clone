## Automating the QA work on a web application

Let's learn Playwright by automating the e2e tests on a sample web application. Throughout this course we will be learning about the concepts of Playwright by adding tests and configurations to the [granite](https://github.com/VarunSriram99/granite-playwright) project.

This is a simple To-Do application built using Ruby on Rails and React. (You can learn how to create this application by following the instructions on the [Learn Ruby on Rails](https://courses.bigbinaryacademy.com/learn-rubyonrails/) course).

To start with this course, clone this repository to your local system.

```bash
git clone https://github.com/VarunSriram99/granite-playwright
```

## Setting up the development environment

Setup Ruby on Rails and NodeJS if not done already by following the instructions on:

### Mac

- [Setting up the workspace](https://courses.bigbinaryacademy.com/learn-rubyonrails/setting-up-workspace)
- [Installing Ruby on Rails](https://courses.bigbinaryacademy.com/learn-rubyonrails/installing-ruby-on-rails/)
- [Installing PostgreSQL](https://courses.bigbinaryacademy.com/learn-rubyonrails/setting-up-postgresql-database/)
- [Installing Redis](https://courses.bigbinaryacademy.com/learn-rubyonrails/background-job-processing-using-sidekiq/?searchTerms%5B0%5D=redis#code_snippet-0)

### Windows

We have a dedicated guide to setup NodeJS and Ruby on Rails on a Windows machine using WSL. Please checkout the book
[Installing Ruby on Rails on a Windows machine](https://courses.bigbinaryacademy.com/install-rubyonrails-in-windows/).

****

Setup the project in the local machine.

```bash
./bin/setup
```

Start the Rails server on a new terminal on the repository.

```bash
bundle exec rails server
```

Start the Webpack Dev Server on another terminal on the repository.

```bash
./bin/webpacker-dev-server
```

Now you will be able to see the application running by visiting [localhost:3000](http://localhost:3000).

You can use the following credentials to login to the application and get familiar with it.

```
Login 1

Username: oliver@example.com
Password: welcome

Login 2

Username: sam@example.com
Password: welcome
```
