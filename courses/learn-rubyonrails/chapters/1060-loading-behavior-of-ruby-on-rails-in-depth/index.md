In one of the early chapters, we had seen how Rails loads missing classes. In
this chapter we will discuss the same concept in a bit more in-depth manner.

## Including files outside of the app directory

We cannot depend on autoloading in all scenarios. There are cases where we'd
have to load custom directory or files in reference to a particular file being
worked on.

A prime example of this case is adding the `test/support` directory where we add
all the support files for the test suite.

What we can do in these cases is to manually require the file in the necessary
files and then include the corresponding module or use the methods defined
within it.

In case of test support files we usually add the following line in our
`test_helper.rb` file:

```ruby
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }
```

The above code will automatically require all support files. But this doesn't
fully do what autoloading does since we still have to include the corresponding
modules from the required files if we have to utilise their functionality.

## What is autoloading?

Autoloading means we don't have to write `require` statements, or worry too much
about load paths.

Our classes are accessible from anywhere, so we can refer to them directly and
they'll appear, as if by magic.

There was a "classic" mode for Autoloading and related features, which was
previously used by Rails.

But due to its limitations, as of Rails 6, the default mode is the modern
[Zeitwerk](https://github.com/fxn/zeitwerk) mode.

### Issues with classic mode

The classic loader in Rails is fundamentally limited because it is based on a
`const_missing` method and that callback does not get the nested or qualified
constants.

This mode of autoloading also has issues in test environment if the tests
involve multithreading.

When `Module#const_missing` is invoked, it doesn’t provide enough information to
reliably determine which constant should have been returned.

This means that autoloading, too, will sometimes return the wrong value for a
constant reference.

## Concept of reloading

Rails automatically reloads classes and modules if application files change.

More precisely, if the web server is running and application files have been
modified, Rails unloads all autoloaded constants just before the next request is
processed.

That way, application classes or modules used during that request are going to
be autoloaded, thus picking up their current implementation in the file system.

There are cases like when using a Rails console and wanting to load file
changes. In such cases we could use the `reload!` method and run it in the
console.

## Eager loading

Autoloading is [not thread-safe](https://github.com/rails/rails/issues/13142)
and hence we need to make sure that all constants are loaded when application
boots.

The concept of loading all the constants even before they are actually needed is
called "Eager loading".

In a way it is opposite of "Autoloading". In the case of "Autoloading" the
application does not load the constant until it is needed.

Once a class is needed and it is missing then the application starts looking in
"autoloading paths" to load the missing class.

`eager_load_paths` contains a list of directories. When application boots in
`production` then the application loads all constants found in all directories
listed in `eager_load_paths`.

Rails doesn't autoload in production environment.

In production environment Rails will load all the constants from
`eager_load_paths` but if a constant is missing then it will not look in
`autoload_paths` and will not attempt to load the missing constant.

## Viewing the autoloaded modules

We had already mentioned that there is a classic and Zeitwerk mode for
autoloading files in Rails.

Rails 6 and above uses Zeitwerk mode by default. But still if you want to
confirm, then you can check whether the following command outputs `true`:

```ruby
Rails.autoloaders.zeitwerk_enabled?
```

Another case might be to view which all modules are getting autoloaded by Rails.
To check that we can run the following from the Rails console:

```ruby
Rails.autoloaders.main
```

In the above command's output we can see that there is a method called
`root_dirs` which is shown in the output.

If we execute that method, then we can see all the directories which are getting
autoloaded:

```ruby
irb(main):002:0> Rails.autoloaders.main.root_dirs
```

And gives an output similar to the following one:

```ruby
{
 "granite/app/controllers"=>Object,
 "granite/app/controllers/concerns"=>Object,
 "granite/app/jobs"=>Object,
 "granite/app/mailers"=>Object,
 "granite/app/models"=>Object,
 "granite/app/models/concerns"=>Object,
 "granite/app/policies"=>Object,
 "granite/app/services"=>Object,
 "granite/app/workers"=>Object,
 ...
}
```

## Inbuilt Ruby autoload mechanism

Ruby has a built-in
[autoload](https://ruby-doc.org/3.2.2/Module.html#method-i-autoload)
mechanism. This lets us tell Ruby in advance which file will define a particular
constant, without going to the expense of loading that file immediately. Only
when we refer to that constant for the first time does Ruby actually load the
specified file.

Let's try out an example. Create a file called `autoload_test.rb` in the root of
your project and add the following content to it:

```ruby
CONSTANT_VARIABLE = "Accessed variable after autoloading!"
```

Now open a Rails console from the root of the project and run the following:

```ruby
autoload :CONSTANT_VARIABLE, './autoload_test'
```

Now executing the following would print the value of the constant:

```ruby
puts CONSTANT_VARIABLE
```

The really important difference between this and `Module#const_missing` is that
we can tell Ruby which file defines which constant before the constant is used,
and this information is taken into account during normal constant resolution.

This potentially eliminates both of the key failures of the `#const_missing`
approach, which we had already discussed.

## Rails in depth

If you wish to dive deep into more Rails concepts related to loading, then you
can refer to the following videos that the BigBinary team had made:

- [How autoloading works in Rails?](https://youtu.be/NRIbgXUCnq0).

- [How Arel works?](https://youtu.be/Y0hXXYuY0Yc).

- [How Rails boots?](https://youtu.be/ZjvPhmnHnrw).

- [How callbacks work in Rails?](https://youtu.be/Z3O063tuwjg).

Rails has evolved since these videos were made but the concepts mentioned in
these videos still hold true.
