Look at the code given below:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3]

a, *b, *c = array
</code>
</codeblock>

In the case provided here, both
**b** and **c** are trying
to be greedy.

It's not possible to have
two greedy variables, so Ruby
fails with an error.