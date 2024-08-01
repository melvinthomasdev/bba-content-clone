Create a class named `Number`.

Add a **Class method** named
`addition` which accepts two
parameters and returns their sum.

Call the addition method
with `3.6` and `4.3` as
parameters and display the
output on the screen.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Write your code here
</code>
<solution>
class Number
  def self.addition (num1, num2)
    num1 + num2
  end
end

puts Number.addition(3.6, 4.3)
</solution>
</codeblock>
