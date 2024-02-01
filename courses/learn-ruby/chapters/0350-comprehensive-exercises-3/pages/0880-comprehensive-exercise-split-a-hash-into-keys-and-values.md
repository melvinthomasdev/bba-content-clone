Finish the method definition given below.

Given a hash `obj`, the method should return an array that contains two elements. The first element should be an array of keys from `obj`. The second element should be an array of values from `obj`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def keys_and_values(obj)
  # Write your code here
end
</code>

<solution>
def keys_and_values(obj)
  [obj.keys, obj.values]
end
</solution>

<testcases>
<caller>
puts keys_and_values(obj)
</caller>
<testcase>
<i>
obj = {
  apple: 100,
  banana: 60,
  orange: 120,
  kiwi: 250,
}
</i>
</testcase>
<testcase>
<i>
obj = {
  Bruce: 32,
  Tony: 42,
  Natasha: 52,
  Steve: 62,
  Thor: 72,
  Clint: 82,
}
</i>
</testcase>
</testcases>
</codeblock>