An `<iframe>` or "inline frame" is an HTML element that can load another HTML page
inside an HTML page. **iframe** is mostly used for **maps**, **advertisements**,
**embedded videos** and other **interactive contents**.

Let's have some fun. We will try
to load BigBinary Academy home
page inside the iframe.

<codeblock language="html" type="lesson">
  <code>
    <div style="width: 100%">
      <iframe
        src="https://bigbinaryacademy.com/"
        width="100%"
        height="360"
      ></iframe>
    </div>
  </code>
</codeblock>

Let's look at another common example
of embedding a map in our iframe.

<codeblock language="html" type="lesson">
  <code>
    <div style="width: 100%">
      <iframe
        width="100%"
        height="360"
        title="BigBinary Pune"
        src="https://maps.google.com/maps?hl=en&amp;q=+(Big%20binary%20)&amp;output=embed"
      ></iframe>
    </div>
  </code>
</codeblock>
