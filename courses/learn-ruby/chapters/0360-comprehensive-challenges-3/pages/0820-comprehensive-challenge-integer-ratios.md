Finish the method `integer_ratios`:

Given an array of integers, the method should
calculate the ratios of its elements that are
**positive**, **negative**, and **zero**. For
example, if the integers are [1, 0, 2, -1], the
ratios of positive, negative and zero integers
should be 0.5, 0.25, and 0.25 respectively.

1. The respective values should be rounded off to have a maximum of 4 decimal digits.
2. Return the result as a hash with keys `:positive_ratio`, `:positive_ratio` and `:zero_ratio`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def integer_ratios(integers)
  # Write your code here
end
</code>

<solution>
def integer_ratios(integers)
  {
    positive_ratio: positive_ratio(integers),
    negative_ratio: negative_ratio(integers),
    zero_ratio: zero_ratio(integers)
  }
end

def positive_ratio(arr)
  (positive_count(arr).to_f/arr.length).round(4)
end

def zero_ratio(arr)
  (zero_count(arr).to_f/arr.length).round(4)
end

def negative_ratio(arr)
  (negative_count(arr).to_f/arr.length).round(4)
end

def positive_count(arr)
  arr.count{ |number| number.positive? }
end

def negative_count(arr)
  arr.count{ |number| number.negative? }
end

def zero_count(arr)
  arr.count{ |number| number.zero? }
end
</solution>

<testcases>
<caller>
puts integer_ratios(integers)
</caller>
<testcase>
<i>
integers = [1,2,3,-1,-2,-3,0,0]
</i>
</testcase>
<testcase>
<i>
integers = [-4, 3, -9, 0, 4, 1]
</i>
</testcase>
</testcases>
</codeblock>
