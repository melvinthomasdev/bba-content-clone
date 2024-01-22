Most commonly used attributes are `width`, `height`, `title`, `frameborder`,
`scrolling`, `marginheight`,and `src`. Let's look at them in details:

**width:** Frame width in pixels.

**height:** Frame height in pixels.

**title:** sets the title of the frame.

**src:** path or the URL that needs to be embedded.

<codeblock language="html" type="lesson">
  <code>
    <div style="width: 100%">
      <iframe
        width="100%"
        height="360"
        title="WiKipedia Home page"
        src="https://www.wikipedia.org/"
      ></iframe>
    </div>
  </code>
</codeblock>

**frameborder:** By default a frameborder gets drawn around the frame(i.e.
`frameborder="1"`), we can remove the border by assign 0 value(i.e.
`frameborder="0"`).

**scrolling:** By default scrollbar is available, but we can disable it,
possible values `auto`, `no` and `yes`.

**marginheight:** Space between the content of the frame and its top and bottom
in pixels.

**marginwidth:** Space between the content of the frame and its left and right
in pixels.

<codeblock language="html" type="lesson">
  <code>
    <div style="width: 100%">
      <iframe
        width="100%"
        height="360"
        title="WiKipedia Home page"
        frameborder="0"
        scrolling="no"
        marginheight="0"
        marginwidth="0"
        src="https://www.wikipedia.org/"
      ></iframe>
    </div>
  </code>
</codeblock>
