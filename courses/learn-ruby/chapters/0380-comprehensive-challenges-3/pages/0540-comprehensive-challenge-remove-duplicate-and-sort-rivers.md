Complete the method definition given below.

Given an array of river names `rivers`, the method should remove duplicate names, sort them alphabetically and return the final array. In case of an empty array, the method should return `false`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def remove_duplicate_and_sort(rivers)
  # Write your code here
end
</code>

<solution>
def remove_duplicate_and_sort(rivers)
  return false if rivers.empty?

  rivers.uniq.sort
end
</solution>

<testcases>
<caller>
puts remove_duplicate_and_sort(rivers)
</caller>
<testcase>
<i>
rivers = ['Periyar', 'Kaveri', 'Tungabhadra', 'Pampa', 'Periyar', 'Tungabhadra', 'Pampa']
</i>
</testcase>
<testcase>
<i>
rivers = ['Barak', 'Danba Qu', 'Barak', 'Gomati', 'Teesta', 'Danba Qu', 'Barak', 'Gomati']
</i>
</testcase>
<testcase>
<i>
rivers = []
</i>
</testcase>
<testcase>
<i>
rivers = ['Ghaghara', 'Ganga', 'Yamuna', 'Jhelum', 'Ghaghara', 'Ganga', 'Jhelum']
</i>
</testcase>
</testcases>
</codeblock>
