The `<a>` element is used to create a link to a web page. Here are some examples:

<codeblock language="html" type="lesson">
<code>

<h2>Bears</h2>
<p>
  <a href="https://en.wikipedia.org/wiki/Bear">Let's read about Bears!</a>
</p>

<p>
  <a href="https://en.wikipedia.org/wiki/Giant_panda">
    Giant Pandas are interesting too!
  </a>
</p>

<h2>
  Let us explore some <a href="https://unsplash.com/s/photos/happy">happy images</a> that we can use in our project.
</h2>

</code>
</codeblock>

As you can see, the `<a>` element contains `href`.
When we click the link, the `href` identifies the
web page to which the browser will now take us.

<codeblock language="html" type="lesson">
<code>
<!-- Link does not open -->
<p>
  <a href="https://www.google.com">Google</a>
</p>
<!-- Link opens -->
<p>
  <a href="https://www.wikipedia.com">Wikipedia</a>
</p>
</code>
</codeblock>

Some websites may have restrictions
in place that prevent them from being
loaded within an `<iframe>` or when
linked directly using the `<a>` tag.

This is the reason in the above code
clicking the Google link might not work,
while the Wikipedia link should open
as expected.
