A coffee maker machine makes coffee.
A coffee maker machine itself
is not coffee.
However, a coffee maker machine
can produce a coffee.

Let's create a class named `Coffeemaker`.

```
class Coffeemaker
end
```

Now, we need to ask this `Coffeemaker`
class to produce a coffee.
In the last lesson, we saw
that we can make a car out
of a class using `new`.
So, let's use `new` here too
to make a coffee out of `Coffeemaker`.

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
end

coffee1 = Coffeemaker.new
</code>
</codeblock>

So far, we have built coffee
and
car out of their classes.
The things that a class
makes are called **instances**.
In this case, **coffee1**
is an instance of the
class **Coffeemaker**.
In the last lesson,
**car1** was an instance of
class **Carmaker**.

Let's go over it again.

A class is something that
builds or makes something.
So far, we have seen two
classes - **Carmaker** and **Coffeemaker**.
The things that are built by these classes are called **instances**.
A car is an instance of
the class **Carmaker**.
A coffee is an instance of
the class **Coffeemaker**.

**Classes and instances can still feel confusing.
That's why we will discuss them again in the next lesson.**