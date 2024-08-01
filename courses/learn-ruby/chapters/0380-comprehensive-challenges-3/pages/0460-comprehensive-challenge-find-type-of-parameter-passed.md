Complete the method definition given below.

The `find_type` function should return the object type of the 2 parameters passed in the given format:

```
  {
      parameter_one_type: <type of parameter_one>,
      parameter_two_type: <type of parameter_two>
  }
```

Note:

1. Return stringified object.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def find_type(parameter_one, parameter_two)
  # Write your code here
end
</code>

<solution>
def find_type(parameter_one, parameter_two)
  {
    parameter_one_type:  parameter_one.class,
    parameter_two_type: parameter_two.class
  }
end
</solution>

<testcases>
<caller>
puts find_type(parameter_one, parameter_two)
</caller>
<testcase>
<i>
parameter_one = 221
parameter_two = true
</i>
</testcase>
<testcase>
<i>
parameter_one = 'BigBinary'
parameter_two = [
    {
        "name": "Miami",
        "state": "Florida"
    },
    {
        "name": "Pune",
        "state": "Maharashtra"
    },
    {
        "name": "Kochi",
        "state": "Kerala"
    }
];
</i>
</testcase>
</testcases>
</codeblock>
