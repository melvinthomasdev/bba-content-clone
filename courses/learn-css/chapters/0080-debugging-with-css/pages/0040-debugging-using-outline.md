When building websites, it is essential to have good control
over the size and layout of elements on your webpage.
The `outline` property which is primarily used for styling,
can sometimes be a powerful tool to help you understand and
debug the size of each element. 

The `outline` property highlights the boundaries of each HTML
element, making it easier to see the element's dimensions.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>In 1990, Tim Berners-Lee invented the World Wide Web</h1>
<a href="https://bigbinaryacademy.com">BigBinary Academy</a>
</panel>
<panel language="css">
h1 {
  outline: 1px solid tomato;
}

a {
  outline: 1px solid #4E46DD;
}
</panel>
</code>
</codeblock>



Many people mistakenly believe that an element, like an `<h1>` tag,
is only as big as its text.
However, as shown in the example above, the outline property reveals
that the element extends from one end to the other.
This isn't the case for all elements.
For instance, as seen with the `<a>` tag in the same example,
it's only as big as its text.

With the outline property, there's no need to memorize
these details. It will highlight them for us.

Let us look at another example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>BigBinary Academy</h1>
</panel>
<panel language="css">
h1 {
  margin-right: 300px;
  <!-- outline: 1px solid #4E46DD; -->
}
</panel>
</code>
</codeblock>

The right margin you have added to `<h1>` above seems
to have no effect.
**Go ahead and remove the comment from line number 3 in the above code.**
You will see that the element's outline is pushed away from the right end.
Now, we can clearly see the impact of the right margin that was added.

Using the outline property for debugging helps you clearly see element sizes,
margins, and padding.
It's a useful tool for creating precise and attractive web layouts.
