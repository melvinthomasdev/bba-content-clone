Most browsers add some styling of their own
to your web pages. Check out this code:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<section>
  <h2>Is Artificial Intelligence art not art?</h2>
  <p>A debate has sprung up in the world with the rise of AI tools like Midjourney and Dall-E. Is AI art really art?</p>
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/A_mechanical_dove_8274822e-52fe-40fa-ac4d-f3cde5a332ae.png/900px-A_mechanical_dove_8274822e-52fe-40fa-ac4d-f3cde5a332ae.png" alt="artistic representation of a pigeon made up of cogs">
</section>
</panel>
<panel language="css">
img {
  width: 300px;
}
.col {
  margin: 10px;
  padding: 5px 15px;
  background-color: #F1F5F9;
}
</panel>
</code>
</codeblock>

You can see that the heading has a larger
font size and font weight compared to
the other text. We haven't added this
styling. This basic styling comes from
the browser. The browser has some default styling
to ensure that even if developers don't
remember to add these styles, your designs
still look alright. Here is a [link](https://chromium.googlesource.com/chromium/blink/+/master/Source/core/css/html.css) to what
styles Chrome adds to every page that it
displays.
