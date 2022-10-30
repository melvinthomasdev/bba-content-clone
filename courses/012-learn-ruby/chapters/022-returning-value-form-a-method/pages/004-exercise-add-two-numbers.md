Run the code and you will not get the correct answer.
Change the code so that it's correct. You are not allowed
to use "puts" in the method.

<Editor lang="ruby" type="exercise">
<code>
class Tool
  def add(number1, number2)
  end
end

tool = Tool.new
tool.add(10,20)
</code>

<solution>
class Tool
  def add(number1, number2)
    return number1 + number2
  end
end

tool = Tool.new
number1 = 10
number2 = 20
added_number = tool.add(number1, number2)
puts "Sum of #{number1} and #{number2} is #{added_number}"
</solution>
</Editor>