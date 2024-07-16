Let's try to use **pseudo-classes** with links using ID and class selectors.

Let's look at some examples:

1. **Using ID Selector with Pseudo-classes:**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>
Hover over the download link button.
</h3>
<a href="#" id="download-link">DOWNLOAD</a>
</panel>
<panel language="css">
#download-link {
  font-family:sans-serif;
  padding: 10px;
  background-color: #00ad20;
  border-radius: 5px;
  color: white;
  text-decoration: none;
}
#download-link:hover {
  background-color: green;
}
</panel>
</code>
</codeblock>

In the above example, we are using the ID selector
`#download-link` to target the `<a>` tag.


2. **Using Class Selector with Pseudo-classes:**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>You have received a Friend Request.</h2>
<a href="#" class="btn btn-accept">
  Accept
</a>
<a href="#" class="btn btn-decline">
  Decline
</a>
</panel>
<panel language="css">
.btn {
  display: inline-block;
  margin: 10px;
  font-family:sans-serif;
  padding: 10px;
  background-color: gray;
  border-radius: 5px;
  color: white;
  text-decoration: none;
}
.btn-accept:hover {
  background-color: green;
}
.btn-decline:hover {
  background-color: red;
}
</panel>
</code>
</codeblock>

In the above example, the classes `.btn-accept:hover` and
`.btn-decline:hover` are used to change the background color of the
**Accept** and **Decline** buttons, when they are hovered over.
