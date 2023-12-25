An `absolute` element's location changes with respect to its parent element. This works only if the parent element has its own `position` set to a value other than `static`.

If this is not so, the `absolute` element looks for the nearest parent whose `position` is set to a value other than `static`. If no such parent element is found, it's location changes with respect to the `body` itself:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent2">
  <div id="parent1">
    <div id="absolute">
    </div>
  </div>
</div>
</panel>
<panel language="css">
#parent2 {
  width: 300px;
  height: 200px;
  background-color: tomato;
  position: relative;
}
#parent1 {
  width: 200px;
  height: 100px;
  background-color: teal;
  /* No position specified. Hence, position is static */
}
#absolute {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: absolute;
  right: 10px;
  bottom: 0px;
}
</panel>
</code>
</codeblock>

Try adding `position: relative` to **parent1** element and notice that the location of **absolute** div changes with respect to **parent1**.

Next, remove the `position: relative` from both **parent1** and **parent2** and notice that the location of **absolute** div changes with respect to the `body` itself.
