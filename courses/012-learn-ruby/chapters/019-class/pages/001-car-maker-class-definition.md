**Understanding what class is, is challenging.
So if you don't fully understand
the concept the very first time,
don't worry about it.
Please read the next few lessons
where we try to explain the
concepts with multiple examples.
It will take some time,
but you will understand it.**

Let's start with cars.
How do car manufacturing companies make cars?
All car making companies have
a giant assembly line where
cars are made.
We will call that giant
assembly line a
**car making machine**.
The job of this
**car making machine**
is to make cars.

Think of a class
like a **car making machine**.
We will call our
class `Carmaker`.
Here is how in Ruby
we declare our class:

```
class Carmaker
end
```

We've got a class which
is like a **car making machine**.
Now the question is,
how do we make a car?
Ruby allows us to
use `new` to make a car
out of the `Carmaker` class.
`new` is truly a magical
thing in Ruby.
It can make a car out
of a `Carmaker`.

Let's try it out.

<Editor lang="ruby">
<code>
class Carmaker
end

car1 = Carmaker.new
</code>
</Editor>

Notice that
`Carmaker` starts with
a capital letter.
So far, we have never used
anything that starts with a
capital letter.
This is because so far we
have been dealing with variables.
In Ruby, all variables must
start with a small letter.

A class is a special thing.
A class name must start with
a capital letter.

Let's go over what we did here.

First, we created a class
named `Carmaker`.

Then we used `new` to create
a car out of the `Carmaker`.
We need a word to describe what
is created out of the class.
That word is **instance**.
Here, we created an instance of
car from the class `Carmaker`.

An **instance** is like a real car
that is built out of the
**car making machine**.
When we say we have an instance of the
class `Carmaker`, then what we mean is
that we have a car
that is created from the class `Carmaker`.

**All this discussion about class
and
instance can get confusing.
But please keep reading.
We will go over these concepts
again in the next few lessons.
You will understand all this very soon.**