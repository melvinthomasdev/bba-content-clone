While iframe is a great tool to shared content from other websites. There are
many security reasons due to which some websites don't allow loading them inside
a iframe.

<codeblock language="html" type="lesson">
  <code>
    <div style="width: 100%">
      <iframe src="https://www.google.com" width="100%" height="360"></iframe>
    </div>
  </code>
</codeblock>

One such security concern is **iframe phishing** where a hackers tries to
manipulate you to key in your credentials to a iframe instead of the actually
website, to steal your credentials. That is why some websites like banks etc.
don't allow loading in a iframe.

<codeblock language="html" type="lesson">
  <code>
    <div style="width: 100%">
      <iframe src="https://sbi.co.in/" width="100%" height="360"></iframe>
    </div>
  </code>
</codeblock>
