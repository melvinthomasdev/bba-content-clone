In Ruby, we can call
multiple methods one after another.

<codeblock language="ruby" type="lesson">
<code>
name = "John Smith"
puts name.upcase.downcase.capitalize
</code>
</codeblock>

In the above example, three
methods are called one after another.

`name.upcase` results in **JOHN SMITH**.
This is then passed on to the `downcase`
method.

The `downcase` method runs
on **JOHN SMITH** and we get
**john smith**. This result is passed on
to the `capitalize` method.

Finally, the `capitalize` method runs on
**john smith** and the
result, **John smith**, is displayed on the screen.