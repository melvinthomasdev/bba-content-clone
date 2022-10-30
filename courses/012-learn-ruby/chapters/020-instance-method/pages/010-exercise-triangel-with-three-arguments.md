If you run this code then you will get an error.
Please change the code so that the error goes away.

<Editor lang="ruby" type="exercise">
<code>
class Triangle
  def info(side1)
    puts "The length of all three side is #{side1 + side2 + side3} "
  end
end

triangle = Triangle.new
triangle.info(10,20,30)
</code>

<solution>
class Triangle
  def info(side1, side2, side3)
    puts "The length of all three side is #{side1 + side2 + side3} "
  end
end

triangle = Triangle.new
triangle.info(10,20,30)
</solution>
</Editor>