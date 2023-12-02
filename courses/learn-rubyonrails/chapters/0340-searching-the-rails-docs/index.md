In this chapter, we are going to discuss the various ways to dig deep into the
Rails codebase. Rails is a modular system which at its core is a set of gems.
This means there is no one source tree to look in. Thus, when we are trying to
find the definition of a method or when we are trying to get more details
regarding a specific implementation from the Rails codebase, we have to leverage
certain tools to easily navigate to the exact detail. Rails is an open source
framework and thus all the implementation can be searched from the official
[Rails Github repo](https://github.com/rails/rails).

Let's say we are adding some tests and in those tests are using a method named
`valid?` from `ActiveModel::Validations` module. While using the `valid?` method
we wanted to know more about the implementation of this method. In the following
sections, we will see different ways of searching and finding the implementation
and related documentation for the `valid?` method.

## Searching with guides

[API Guides](https://api.rubyonrails.org/) is the official guide for the Rails
APIs. We can find documentation for any APIs from Rails on this website. This
guide is the single source of truth for all the Rails API related docs. It has a
search bar on the top left corner where we can directly search for any `class`
or `method`.

For example, if we need to look for `valid?` method we can directly search for
it. Then we can select a particular search result and the documentation for that
particular method will be shown like this:

<image alt="Rails guide search">rails-guide-search.png</image>

After selecting the particular search result it shows all the documentation
about the selected `valid?` method. Towards the very end of the documentation we
have a footer called "Source". Using this "Source" footer we can see the
implementation of the selected method in the website itself using the "show"
button or we can see the implementation on Github using the "on Github" button.

[Edge Guides](https://edgeguides.rubyonrails.org/) is another useful resource
used to understand how Rails deals with web development principles and what all
tooling Rails provide in order to handle those principles elegantly. This guide
is a little more detailed as compared to the previous guide and is more business
oriented. This guide has a menu from which we can select the required section.

For example:

<image alt="Edge guide menu">rails-guide-menu.png</image>

## Searching with pry

The [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) is a great gem
for exploring and debugging source code. It provides some commands which we can
run in the console. It helps in revealing any Ruby or Rails method's source
location and implementation. It doesn't show any documentation associated with
the method. Please refer to Rails guide for checking the documentation.

For checking the method's implementation we should know the location or parent
class of that method. Now, let's see how to check implementation of
`ActiveModel::Validations` module's `valid?` method.

- First, we need to install the `pry-byebug` gem. Add the `pry-byebug` gem at
  the end of the Gemfile, like this:

```rb
gem "pry-byebug"
```

And run the command `bundle install` to install the newly added gem.

- Let's start the Pry console with the environment, like this:

```bash
bundle exec  pry -r ./config/environment
```

- Now we can use the `cd` command to move inside any of the installed gems or
  modules. For `ActiveModel::Validations` module's `valid?` method, we need to
  first navigate to the `Validations` file which is inside the `ActiveModel`
  directory. Use the following commands in the Pry console:

```bash
cd ActiveModel
cd Validations
```

- We are now inside the `ActiveModel::Validations` module. Use the `ls` command
  to see all the available methods, classes, etc.

- Now let's try `show-method valid?` command in the console. It will show the
  `valid?` method's definition, like this:

<image alt="Pry gem output">pry-gem-output.png</image>

If the currently selected file doesn't have the required method then it will
show the error like this:

<image alt="Pry error">pry-error.png</image>

So we should prefer using `pry` only when we know the exact location of the
required method.

For more methods and details please checkout the
[docs](https://rdoc.info/github/pry/pry/master/Pry) from Pry and the
[railscast](http://railscasts.com/episodes/280-pry-with-rails).

## Searching with Github

We can search for the documentation and implementation details from the
[Rails Github repository](https://github.com/rails/rails/tree/6-1-stable) too.
Sometimes we prefer to use Github to see how each of the methods is being
utilized in Rails test suite.

We can search for `valid?` method in the repository using the search bar on the
top left corner like this:

<image alt="Github search in repository">github-repo-search.png</image>

It will show all the different places where this `valid?` keyword is used. More
than that we can also see the commits, issues, and discussions where this
`valid?` keyword is being utilized, like this:

<image alt="Github repository search results">github-repo-search-result.png</image>

This search feature is not that enhanced because it doesn't take into account
the regex values or non-alphanumeric characters and sometimes it's a bit hard to
navigate when there are a lot of occurrences of the searched keyword. In such
cases, we can either open the Gem from VSCode locally or from Github workspace
editor.

## Open gem in Github workspace editor

Let's go to the [Rails Github repo](https://github.com/rails/rails). We can
change the Rails version by changing the branch. After selecting the correct
branch, press dot "." to open the `VSCode` web interface for the Github repo.

Now we can directly use the global search tool and see the code for the required
method. Let's try for the same `valid?` method like this:

<image alt="Github VSCode search">github-vscode-search.png</image>

In the VSCode search bar, we can filter out results by file name too. So if we
are sure about the required folder or file name where we want to search then we
can filter out the occurrences of the searched keyword in that file only. We can
click on the three dots menu button below the search bar and enter the file
name. For example, if we need to search for the `valid?` method inside the
`activemodel` gem then we can use the `*activemodel*` regex, like this:

<image alt="Github VSCode search results">vscode-search-with-file.png</image>

## Open gem in VSCode locally

Sometimes, we prefer to open the source code of a gem in the local editor for
better understanding. It can be annoying and time taking to go web to search for
a particular section sometimes.

We can open the source code in any editor of our choice. We need to pass in the
name of the editor in the environment variable called `EDITOR`. For example, the
following command will open the gem in VSCode.

```bash
EDITOR=code bundle open <gem>
```

Now if we want to check the definition of the `valid?` method which is part of
the `activemodel` gem then we need to run the following command:

```bash
EDITOR=code bundle open activemodel
```

This will open the codebase for ActiveModel in a new window of VSCode. After
that, we can global search for the keyword `valid?` and iterate through the
search results.

There is **nothing to commit** in this chapter
