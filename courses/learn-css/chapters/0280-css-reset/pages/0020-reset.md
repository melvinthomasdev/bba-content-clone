When we get better at designing using CSS,
we don't want the browser to throw
in its own styles on top of the ones
that we specify.

How do we get rid of these default styles?

Take a look at the following example:


<codeblock language="css" type="lesson">
<code>
<panel language="html">
<section>
  <h2>Is Artificial Intelligence art not art?</h2>
</section>
</panel>
<panel language="css">
h2 {
	color: green;
	text-decoration: underline;
}
</panel>
</code>
</codeblock>

Here, you can see that we just want our heading
to have a green colour and have an underline.
We didn't say anything about the heading
having a large font size or being bold. So, in order
to take away this default styling, we need to do something
like this:


<codeblock language="css" type="lesson">
<code>
<panel language="html">
<section>
  <h2>Is Artificial Intelligence art not art?</h2>
</section>
</panel>
<panel language="css">
h2 {
	font-size: 100%;
	font: inherit;
	color: green;
	text-decoration: underline;
}
</panel>
</code>
</codeblock>
