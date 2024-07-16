Look at the two code examples given below:

**Without CSS nesting:**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="outer">
  <div class="inner">
    <p>Without CSS Nesting</p>
  </div>
</div>
</panel>
<panel language="css">
.outer {
  background-color: coral;
  padding: 20px;
}

.outer .inner {
  background-color: teal;
  padding: 20px;
}

.outer .inner p {
  color: black;
  background-color: cadetblue;
  padding: 10px;
  text-align: center;
  font-size: 2rem;
}

.outer .inner p:hover {
  color: white;
  background-color: purple;
}
</panel>
</code>
</codeblock>

**With CSS nesting:**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="outer">
  <div class="inner">
    <p>With CSS Nesting</p>
  </div>
</div>
</panel>
<panel language="css">
.outer {
  background-color: coral;
  padding: 20px;

  & .inner {
    background-color: teal;
    padding: 20px;

    & p {
      color: black;
      background-color: cadetblue;
      padding: 10px;
      text-align: center;
      font-size:2rem;

      &:hover {
        color: white;
        background-color: purple;
      }
    }
  }
}
</panel>
</code>
</codeblock>

After analyzing the above two code blocks,
we can clearly see how CSS nesting brings
structure and clarity to our CSS code, making
it more organized and easier to maintain.
