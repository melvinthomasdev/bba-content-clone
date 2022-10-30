Finish the method definition given below.

Given two arrays `array` and `another_array` the method should return a new array containing all the elements of `array` that are also present in `another_array`. If either one of the arrays are empty, the method should return the non-empty array. If both arrays are empty, or there are no common elements, the method should return an empty array.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def common_elements(array, another_array)
  # Write your code here
end
</code>

<solution>
def common_elements(array, another_array)
  return array if another_array.empty?
  return another_array if array.empty?

  common_elements = array & another_array
end
</solution>

<testcases>
<caller>
puts common_elements(array, another_array)
</caller>
<testcase>
<i>
array = %w[apple banana orange kiwi]
another_array = %w[banana kiwi]
</i>
</testcase>
<testcase>
<i>
array = %w[miami pune kochi]
another_array = []
</i>
</testcase>
<testcase>
<i>
array = []
another_array = %w[bravo india golf bravo india november alfa romeo yankee]
</i>
</testcase>
<testcase>
<i>
array = %w[india golf bravo meow]
another_array = %w[bravo india golf bravo india november alfa romeo yankee]
</i>
</testcase>
</testcases>
</Editor>