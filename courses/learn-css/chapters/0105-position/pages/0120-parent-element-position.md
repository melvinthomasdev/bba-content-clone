An `absolute` element's location changes with respect to its parent element. This works only if the parent element has its own `position` set to a value other than `static`.

If this is not so, the `absolute` element looks for the nearest parent whose `position` is set to a value other than `static`. If no such parent element is found, its location changes with respect to the `body` itself:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="outer-container">
  <div id="parent-container">
    <div id="absolute">
    </div>
  </div>
</div>
</panel>
<panel language="css">
#parent-container {
  width: 200px;
  height: 100px;
  background-color: teal;
  /* position: relative; */
  /* No position specified. Hence, position is static */
}
#outer-container {
  width: 300px;
  height: 200px;
  background-color: tomato;
  /* position: relative; */
  /* No position specified. Hence, position is static */
}
#absolute {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: absolute;
  right: 10px;
  top: 0px;
}
</panel>
</code>
</codeblock>

In the above code, we can observe
that the element with **id** absolute
appears at the top
and
right position of the root element,
which is body.

Try uncommenting `position: relative` 
from the element with **parent-container** id
and
notice that the location of element with
id **absolute** changes with respect to
**parent-container**.

Similarly, uncomment the `position: relative`
from the element with **outer-container**
and
notice that the location of element with
id **absolute** changes with respect to
**outer-container**.
