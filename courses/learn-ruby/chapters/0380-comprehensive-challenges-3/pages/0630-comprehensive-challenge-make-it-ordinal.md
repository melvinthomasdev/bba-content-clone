Finish the method definition given below.

`numbers` is an array of integers. Given `numbers`, the method should return a new array with each element converted to its ordinal form (3 becomes 3rd, 2 becomes 2nd, 4 becomes fourth and so on).

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def make_it_ordinal(numbers)
 # Write your code here
end
</code>

<solution>
def make_it_ordinal(numbers)
  numbers.map{|number| ordinalize(number)}
end

def ordinal(number)
  if (11..13).include?(number % 100)
    "th"
  else
    case number % 10
      when 1; "st"
      when 2; "nd"
      when 3; "rd"
      else    "th"
    end
  end
end

def ordinalize(number)
  "#{number}#{ordinal(number)}"
end
</solution>

<testcases>
<caller>
puts make_it_ordinal(numbers)
</caller>
<testcase>
<i>
numbers = [1, 2, 3, 4, 5, 6, 7]
</i>
</testcase>
<testcase>
<i>
numbers = [456, 51, 123, 31, 2, 99, 101]
</i>
</testcase>
<testcase>
<i>
numbers = [42, 48, 49, 111, 222, 333, 0, 5]
</i>
</testcase>
</testcases>
</codeblock>