If you run this code then you will get an error.
Please change the code so that the error goes away.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Rectangle
  def info()
    puts "The length of all four sides is #{} "
  end
end

rectangle = Rectangle.new
rectangle.info(10,20,30,32)
</code>

<solution>
class Rectangle
  def info(length1, length2, length3, length4)
    puts "The length of all four sides is #{length1 + length2 + length3 + length4} "
  end
end

rectangle = Rectangle.new
rectangle.info(10,20,30,32)
</solution>
</codeblock>
