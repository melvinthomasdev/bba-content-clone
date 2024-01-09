## Is the initialize method really necessary?

Before answering that question, let's refresh what an `initialize` method really
is.

In _Object Oriented Programming_ terminology, `initialize` method is a
**constructor**.

And a **constructor** is a method that is executed automatically on
instantiation.

Constructors exists in other _Object Oriented Programming_ languages like C++,
Java, JavaScript also. But they might use different names, it won't be
`initialize`.

So `initialize` method is the method that's called automatically on
instantiation.

i.e. if you run the following code:

```ruby
# contents of script.rb

class Document
  def initialize(author)
    puts "A new document by #{author} instantiated!"
  end
end

new_document = Document.new("Oliver")
```

The output will be:

```bash
> ruby script.rb
A new document by Oliver instantiated!
```

So what if we don't define an `initialize` method, would it throw an error?

Let's create another class `Article` and see what happens.

```ruby
class Article

end

new_article = Article.new()
puts "Executed successfully!"
```

The output:

```bash
> ruby script.rb
Executed successfully!
```

The above code ran successfully without any errors.

From this, its pretty clear that the use of `initialize` method is optional.

### Inheritance is tricky

What do you think would happen if you were to run the following code?

```ruby
class Document
  def initialize(author)
    puts "A new document by #{author} instantiated!"
  end
end

class Article < Document

end

new_article = Article.new()
```

The output:

```bash
> ruby script.rb
script.rb:2:in `initialize': wrong number of arguments (given 0, expected 1) (ArgumentError)
	from script.rb:11:in `new'
	from script.rb:11:in `<main>'
```

The code will throw an `ArgumentError`.

But why so?

The reason is that, on instantiating a child class, the parent class is also
instantiated.

And that requires passing the `author` argument to the parent class.

One thing to note here is that, if we had defined even an empty `initialize`
method within `Article` class, then the above script would work. We will discuss
about this case in the upcoming sections.

## The super method

To solve the above issue we must pass the `author` argument to the parent class.

This is where the `super` method comes into play.

We could pass the arguments to the `initialize` method of the parent class by
calling the `super` method with the required arguments. i.e.

```ruby
class Document
  def initialize(author)
    puts "A new document by #{author} instantiated!"
  end
end

class Article < Document
  def initialize(author)
    super(author)
  end
end

new_article = Article.new("Oliver")
```

Or even better, invoke the `super` method without any arguments and parentheses.

```ruby
class Document
  def initialize(author)
    puts "A new document by #{author} instantiated!"
  end
end

class Article < Document
  def initialize(author)
    super
  end
end

new_article = Article.new("Oliver")
```

Both will give the same following output.

```bash
> ruby script.rb
A new document by Oliver instantiated!
```

**Note:** You have be very careful when invoking the `super` without the
arguments and parentheses.

The reason is that, such invocations directly passes the arguments from the
child class to the parent class as positional arguments.

i.e. The following two code snippets are equivalent to each other.

```ruby
# Previous code as it is.

class Article < Document
  def initialize(author)
    super
  end
end

# Remaining code as it is.
```

```ruby
# Previous code as it is.

class Article < Document
  def initialize(author)
    super(author)
  end
end

# Remaining code as it is.
```

This would work even with the following modification:

```ruby
class Document
  def initialize(author, published_month) # Added a new parameter published_month
    puts "A new document by #{author} published in #{published_month} was instantiated!" # Modified this statement to include published_month
  end
end

class Article < Document
  def initialize(writer, publication_month) # Renamed author to writer and added a new parameter publication_month
    super
  end
end

new_article = Article.new("Oliver", "March")
```

Notice the parameter names are different in the `Document` and `Article`
classes.

Still the code would work perfectly, giving the output:

```bash
> ruby script.rb
A new document by Oliver published in March was instantiated!
```

The equivalent code for the above snippet is:

```ruby
class Document
  def initialize(author, published_month) # Added a new parameter published_month
    puts "A new document by #{author} published in #{published_month} was instantiated!" # Modified this statement to include published_month
  end
end

class Article < Document
  def initialize(writer, publication_month) # Renamed author to writer and added a new parameter publication_month
    super(writer,publication_month)
  end
end

new_article = Article.new("Oliver", "March")
```

So what's the problem? If you look at the previous code, the equivalent version,
you will notice that `writer` and `publication_month` were passed as positional
arguments to the `super`.

Therefore, if you switch the positions of the parameters in the `Article` class
definition, you will not get the expected result. i.e.

```ruby
class Document
  def initialize(author, published_month)
    puts "A new document by #{author} published in #{published_month} was instantiated!"
  end
end

class Article < Document
  def initialize(publication_month, writer) # Positions switched.
    super
  end
end

new_article = Article.new("March", "Oliver")
```

The above code will give you:

```bash
> ruby script.rb
A new document by March published in Oliver was instantiated!
```

**Note**: The `super` method is not just used to invoke the `initialize` method
of the parent class. When you invoke the `super`, you are actually invoking the
method, in the parent class, with the same name as the method from which you are
invoking the `super`.

For example:

```ruby
class Document
  def display_author(author)
    puts "This document was authored by #{author}."
  end
end

class Article < Document
  def display_author(author)
    super
    puts "This article was authored by #{author}."
  end
end

new_article = Article.new()
new_article.display_author("Oliver")
```

The above code would output:

```bash
> ruby script.rb
This document was authored by Oliver.
This article was authored by Oliver.
```

And if there's no corresponding method in the parent class, the invocation of
`super` will throw a `NoMethodError`. See the following example.

```ruby
class Document

end

class Article < Document
  def display_author(author)
    super
  end
end

new_article = Article.new()
new_article.display_author("Oliver")
```

The output:

```bash
> ruby script.rb
script.rb:7:in `display_author': super: no superclass method `display_author' for #<Article:0x00007fc39e9876a0> (NoMethodError)
	from script.rb:12:in `<main>'
```

Wow, that was a lot of information.

Take a deep breath and let it out. Take some time and go through it again if you
wish. Once you feel that you are thorough with what you have learnt till now,
continue reading.

It's a marathon not a sprint.

If you are caught up till now, you might be wondering - Should we invoke the
`super` method in the `initialize` method if we don't have to pass the
arguments? Before getting to the answer, keep this following point in your mind.

If we don't define the `initialize` method, the child class will invoke the
`super` by itself.

As in, the following two snippets are equivalent to each other.

```ruby
# previous code as it is.

class Article < Document
end

# remaining code as it is.
```

```ruby
# previous code as it is
class Article < Document
  def initialize
    super()
  end
end

#remaining code as it is.
```

That is, both the following code snippets are equivalent to each other.

```ruby
class Document
  def initialize
    puts "A new document instantiated!"
  end
end

class Article < Document
  def initialize
    super()
  end
end

new_article = Article.new()
```

Even the `initialize` method is optional in this case.

```ruby
class Document
  def initialize
    puts "A new document instantiated!"
  end
end

class Article < Document
end

new_article = Article.new()
```

And both the code snippets would give the exact same result.

```bash
> ruby script.rb
A new document instantiated!
```

But this is not the case if you define the `initialize` method and you skip the
`super` invocation.

The following section will describe why.

## Pitfalls of the super method

If you define the `initialize` method and don't invoke the `super` method, then
the `initialize` method of the parent class is not invoked.

ie. If you run this code:

```ruby
class Document
  def initialize
    puts "A new document by instantiated!"
  end
end

class Article < Document
  def initialize
    # Some code.
  end
end

new_article = Article.new()
```

The output wouldn't print the string in the `initialize` method of the parent
class, as shown in the following snippet.

```bash
> ruby script.rb
```

Therefore, in order to invoke the `initialize` method of the parent class, you
must always invoke the `super` method in your child class's constructor.

## Conclusion

- If inheritance is involved and you need to define the `initialize` method of
  the child class, then you should always invoke the `super` method.

So the correct way to implement the previous snippet is:

```ruby
class Document
  def initialize
    puts "A new document by instantiated!"
  end
end

class Article < Document
  def initialize
    super()
    # Some code.
  end
end

new_article = Article.new()
```

- And the `initialize` method is optional if no arguments are to be passed to
  the parent class.
