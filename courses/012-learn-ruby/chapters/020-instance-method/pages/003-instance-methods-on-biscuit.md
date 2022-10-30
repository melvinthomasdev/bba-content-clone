What can we do with a biscuit instance?
We can **eat** it or **gift** it.
So, let's add these two methods to the class.

<Editor lang="ruby">
<code>
class Biscuitproducer
  def eat
    puts "eating biscuit"
  end

  def gift
    puts "biscuit is a wonderful gift"
  end
end

biscuit1 = Biscuitproducer.new

biscuit1.eat
biscuit1.gift
</code>
</Editor>

Run code to see the result.

In this case we have defined two methods `eat` and `gift`.
Note that a method always starts with `def` and the method ends with `end`.