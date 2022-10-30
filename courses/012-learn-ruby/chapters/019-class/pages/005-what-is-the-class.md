Ruby allows us to ask an
instance what is their class.
Let's ask **car1**, what is the
name of its class:

<Editor lang="ruby">
<code>
class Carmaker
end

car1 = Carmaker.new
puts car1.class
</code>
</Editor>

Similarly, let's create an
instance of **Coffeemaker**
and
ask this instance what is
its class.

<Editor lang="ruby">
<code>
class Coffeemaker
end

coffee1 = Coffeemaker.new
puts coffee1.class
</code>
</Editor>