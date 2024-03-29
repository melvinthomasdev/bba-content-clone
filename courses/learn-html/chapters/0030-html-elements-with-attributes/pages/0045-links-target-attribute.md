The `target` attribute specifies
where the linked document will open.

By default, when a user clicks on a link,
the browser navigates to the linked
document in the same window or tab.

However, the `target` attribute provides
options to control where the linked
content will open.

The `target` attribute accepts the following values:

- `_self`: This is the default value. It opens the linked document in the same window where the link was clicked.

- `_blank`: Opens the linked document in a new window or tab. 

These are commonly used ones, but there are other options too which you can explore.

<codeblock language="html" type="lesson">
<code>
<h1>BigBinary Blog</h1>
<p>We craft blog posts about what we have learned so far and we have published 500+ blog posts about Ruby on Rails, ReactJS, React Native, open source, engineering & design.</p>
<ul>
  <!-- Link to Article 1 (Opens in the same tab) -->
  <li>
    <a href="https://www.bigbinary.com/blog/introducing-neeto-ui-v6" target="_self">
      Introduction to NeetoUI v6
    </a>
  </li>

  <!-- Link to Article 2 (Opens in a new tab) -->
  <li>
    <a href="https://www.bigbinary.com/blog/build-web-based-screen-recorder-loom-alternative-part-1" target="_blank">
      Building a web based screen recorder
    </a>
  </li>
</ul>
</code>
</codeblock>
