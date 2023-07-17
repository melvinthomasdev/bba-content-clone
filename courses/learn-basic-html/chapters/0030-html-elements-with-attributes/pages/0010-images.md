The `<img>` element is used to display an image. Let us try to display an image:

<codeblock language="html" type="lesson">
<code>
<img src="https://ucarecdn.com/b9721aee-1c09-4d0c-9bcb-8969afe2751e/">
</code>
</codeblock>

The `<img>` element uses `src` to
specify the source of the image
being displayed.
In this case, the image is stored on
our own website, so we can simply
give its name. If we want to choose
an image from anywhere else, we need
to give their address in `src`.

`<img>` is a **void element** tag.
Although the general rule is that every HTML element must have an opening and closing tag,
there are some exceptions. Some elements are **void elements**, i.e. they don't need a closing tag.
`<img>`, `<br>`, `<hr>`, are some **void elements**.

Void elements can't have any contents, since there is no end tag, no content can be put
between the start tag and the end tag.
