It is crucial to carefully inspect
the HTML elements
and
their structure within the document.

Make sure that all HTML elements
have proper opening and closing tags.

Let us look at an example:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <img src= "https://upload.wikimedia.org/wikipedia/commons/b/ba/Javascript_badge.svg"
  <h1>Master Builder</h1>

  <h2>Let's build and make new things. </h2>

  <a href="#" id="follow">
    Follow
  </a>

  <a href="#" id="remove">
    Remove
  </a>
</div>
</panel>
<panel language="css">
img {
  width: 50%;
  height: 50%;
  margin-left: 25%;
}

h1 {
  font-size: 25px;
  text-align: center;
  color: red;
}

h2 {
  text-align: center;
  margin-bottom: 50px;
  font-size: 100%;
  font-family: "Lucida Grande" ;
}

a {
  font-family:'Lucida Grande';
  text-decoration: none;
  background-color: black;
  color: white; 
  padding: 15px;
  border-radius: 15%;
  margin-bottom: 80px;
}

#follow {
  margin-left: 20%;
}

#remove {
  margin-left: 5%;
}

a:hover {
  background-color: green;
}

a:hover#remove {
  background-color: red;
}

div {
  background-color: rgb(245, 249, 255);
  border-radius: 100% 100% 0% 0%;
  width: 300px;
  height: 350px;
  border: solid gray 1px;
  margin: auto;
}
</panel>
</code>
</codeblock>

In the above code, we can see
that the applied CSS properties
are not being reflected on the
`h1` element.

When we examine the HTML elements
from start to finish we will
notice that the `<img>` tag
is not closed properly.

This causes the CSS rules to
not apply properly on `<h1>` tag.
