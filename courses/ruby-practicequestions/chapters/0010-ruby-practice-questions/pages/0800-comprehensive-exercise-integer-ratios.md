Finish the method definition given below.

`integers` is an array of integers. Given `integers`, the method should calculate the ratios of its elements that are positive, negative, and zero. So if the integers are [1, 0, 2, -1], the ratios of positive, negative and zero integers should be 0.5, 0.25, and 0.25 respectively.

The method should return a single hash with keys `:positive_ratio`, `:negative_ratio` and `:zero_ratio` and the respective values rounded off to maximum 4 decimal digits.

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

def positive_ratio(integers)
  (positive_count(integers)/integers.length).round(4)
end

def zero_ratio(integers)
  (zero_count(integers)/integers.length).round(4)
end

def negative_ratio(integers)
  (negative_count(integers)/integers.length).round(4)
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
integers = [-4, 3, -9, 0, 4, 1, 1]
</i>
</testcase>
<testcase>
<i>
integers = [1,2,3,-1,-2,-3,0,0]
</i>
</testcase>
</testcases>
</codeblock>