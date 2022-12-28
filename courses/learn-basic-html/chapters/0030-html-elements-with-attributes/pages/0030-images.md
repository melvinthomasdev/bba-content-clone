The `<img>` element is used to display an image. Let us try to display an image:

<codeblock language="html" type="lesson">
<code>
<img src="view-from-a-balcony.png" />
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

`<img>` is a **self-closing** tag. Although the general rule is that every HTML element must have an opening and closing tag, there are some exceptions. Some elements are **self-closing**, i.e. they don't need a closing tag and can optionally be closed in the opening tag itself. `<img />`, `<br />`, `<hr />`, are some **self-closing** elements.