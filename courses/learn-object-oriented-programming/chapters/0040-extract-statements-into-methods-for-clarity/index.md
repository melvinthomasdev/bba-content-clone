Let's see this example.

```rb
def sanitized_path
  s = request.path.downcase

  # remove trailing slash
  s1 = s[-1] == '/' ? s[0..-2] : s

  # strip .html
  s2 = s1[-5..-1] == '.html' ? s1[0..-6] : s1

  # strip %20 at the end
  s2[-3..-1] == '%20' ? s2[0..-4] : s2
end

```

In the above code we have comments to help use understand what's happening.
Instead of having the comment we can extract those statements into methods.

The advantage of creating a new method is that we get an opportunity to give the
method an english sounding name. The method name itself could reveal what's
happening and we won't need comment.

Let's extract the second statement into a method.

```rb
def sanitized_path
  s = request.path.downcase

  s1 = remove_trailing_slash s

  # strip .html
  s2 = s1[-5..-1] == '.html' ? s1[0..-6] : s1

  # strip %20 at the end
  s2[-3..-1] == '%20' ? s2[0..-4] : s2
end

def remove_trailing_slash(input)
  input[-1] == '/' ? input[0..-2] : input
end
```

Now let's do the same to the next statement.

```rb
def sanitized_path
  s = request.path.downcase

  s1 = remove_trailing_slash s
  s2 = strip_html s1

  # strip %20 at the end
  s2[-3..-1] == '%20' ? s2[0..-4] : s2
end

def remove_trailing_slash(input)
  input[-1] == '/' ? input[0..-2] : input
end

def strip_html(input)
  input[-5..-1] == '.html' ? input[0..-6] : input
end
```

Now let's do the same to the last statement.

```rb
def sanitized_path
  s = request.path.downcase

  s1 = remove_trailing_slash s
  s2 = strip_html s1
  remove_trailing_percentage_20 s2
end

def remove_trailing_slash(input)
  input[-1] == '/' ? input[0..-2] : input
end

def strip_html(input)
  input[-5..-1] == '.html' ? input[0..-6] : input
end

def remove_trailing_percentage_20(input)
  input[-3..-1] == '%20' ? input[0..-4] : input
end
```

Now let's look at method `sanitized_path`.

The whole method reads like a list of operations to be done. When we are looking
at the method we are not interested in finding out how the work is done. Rather
we are interested in seeing what is being done.

If we want to look at how then we can get into the implementation of any of
those methods.

This is a much better solution, where we have both what and how.

When statements are not extracted into methods then we only see what is being
done. So every time we come back to this code we have to take a pause and build
a mental model of what is being done by reading the code.
