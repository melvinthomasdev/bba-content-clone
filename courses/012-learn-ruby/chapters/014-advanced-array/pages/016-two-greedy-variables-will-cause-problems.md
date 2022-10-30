Look at the code given below:

<Editor lang="ruby">
<code>
array = [1,2,3]

a, *b, *c = array
</code>
</Editor>

In the case provided here, both
**b** and **c** are trying
to be greedy.

It's not possible to have
two greedy variables, so Ruby
fails with an error.