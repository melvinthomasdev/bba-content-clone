Sometimes, we want to group a few of our elements together so that when we want to change them through **CSS** or **JavaScript**, we can access all of them at one time.

For this, we use the `class` attribute.

<codeblock language="html" type="lesson">
<code>
<h1>Let's Learn</h1>

<p class = "brilliant-learning-resources">
  Google
  <a href="https://google.com" class = "link-to-the-resource">Click Here</a>
</p>

<p class = "brilliant-learning-resources">
  Wikipedia
  <a href="https://www.wikipedia.org/" class = "link-to-the-resource">Click Here</a>
</p>

<p class = "brilliant-learning-resources">
  Dictionary
  <a href="https://www.dictionary.com/" class = "link-to-the-resource">Click Here</a>
</p>
</code>
</codeblock>

In the example above, we have grouped all the `p` elements by giving their class attributes the value **brilliant-learning-resources**. Similarly, we have grouped all the links by giving their class attributes the value **link-to-the-resource**.