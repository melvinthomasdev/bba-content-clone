Let's create a new class called **Appbuilder**.
This class builds apps.

```
class Appbuilder
end

instagram = Appbuilder.new
fortnite = Appbuilder.new
```

Here, **instagram** and **fortnite**
are instances of the class **Appbuilder**.
For each instance, we want a method
called **info** which will produce
information about the app.
The information needs to be in
the following format:

```
From Instagram: Instagram is a photo sharing app.
From fortnite: Fortnite is a gaming app.
```

Let's add method **info** to the class.

<codeblock language="ruby" type="lesson">
<code>
class Appbuilder
  def info(name, type)
    puts "#{name} is a #{type} app"
  end
end

instagram = Appbuilder.new
instagram.info("Instagram", "photo sharing")

fortnite = Appbuilder.new
fortnite.info("Fortnite", "gaming")
</code>
</codeblock>

In this case, method **info**
takes two arguments: **name**
and **type**.

In Ruby, a method can take any
number of arguments.
