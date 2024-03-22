In the following example,
change the tag name inside the
`document.getElementsByTagName`
method to `h2`
and
notice the change in the console output:

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html" hidden="true">
<div>
  <h1>All about Dogs</h1>
  <h2>Dogs are an interesting species</h2>
  <p>
    Today, some dogs are used as pets, others are used to help humans do their work. They are a popular pet because they are usually playful, friendly, loyal and listen to humans. (Credit: Wikipedia)
  </p>
</div>
</panel>
<panel language="css" hidden="true">
div {
  text-align: center;
}

img {
  width: 15rem;
}

p {
  text-align: left;
}

.details {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  gap: 1rem;
}
</panel>
<panel language="javascript">
let tagName = "p";

console.log(document.getElementsByTagName(tagName));
</panel>
</code>

<solution>
let tagName = "h2";

console.log(document.getElementsByTagName(tagName));
</solution>
</codeblock>
