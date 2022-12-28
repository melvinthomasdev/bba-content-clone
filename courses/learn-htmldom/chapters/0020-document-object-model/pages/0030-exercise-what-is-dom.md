In the following example,
change the tag name inside the
`document.getElementsByTagName` method
to either `h2`, `img` or a `p` and notice
the change in the console output.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h2>Dogs 101</h2>
  <h3>Dogs are an interesting species</h3>
  <div class="details">
    <picture>
      <img src="htmldom-dog-02.jpg"/>
    </picture>
    <p>
        Today, some dogs are used as pets, others are used to help humans do their work. They are a popular pet because they are usually playful, friendly, loyal and listen to humans. Thirty million dogs in the United States are registered as pets. Dogs eat both meat and vegetables, often mixed together and sold in stores as dog food. Dogs often have jobs, including as police dogs, army dogs, assistance dogs, fire dogs, messenger dogs, hunting dogs, herding dogs, or rescue dogs. (Credit: Wikipedia)
    </p>
  </div>
</div>
</panel>
<panel language="css">
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
let tagName = "div";
console.log(document.getElementsByTagName(tagName));
</panel>
</code>
</codeblock>