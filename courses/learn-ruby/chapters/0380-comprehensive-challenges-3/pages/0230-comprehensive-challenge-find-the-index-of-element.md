Finish the method definition below.

Given an array `list` and a value, the method should return the index of given value in `list` array. If the value is not found in the array, the method should return `Not found`.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def get_index(list, value)
  # Write your code here
end
</code>

<solution>
def get_index(list, value)
  index = list.index(value)
  return "Not found" if index.nil?

  index
end
</solution>

<testcases>
<caller>
puts get_index(list, value)
</caller>
<testcase>
<i>
list = ["MacBook", "Asus Zenbook 14", "MacBook Pro 13", "iMac", "MacBook Pro"]
value = "iMac"
</i>
</testcase>
<testcase>
<i>
list = ["Star", "Blackhole", "Planet", "Asteroid", "Constellation"]
value = "Wormhole"
</i>
</testcase>
<testcase>
<i>
list = ["ISRO", "NASA", "JAXA", "Roscosmos", "ESA"]
value = "ISRO"
</i>
</testcase>
<testcase>
<i>
list = ["Soyuz", "SpaceShuttle", "Vostok", "Gemini", "Apollo"]
value = "Voskhod"
</i>
</testcase>
</testcases>
</codeblock>
