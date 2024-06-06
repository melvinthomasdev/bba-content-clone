The **inset** keyword can be applied to the
**box-shadow** property to create a shadow
inside the element.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="container">
  <div class="box inner-shadow"></div>
  <div class="box sunken-shadow"></div>
  <div class="box sunrise-shadow"></div>
  <div class="box leaf-shadow"></div>
</div>
</panel>
<panel language="css">
#container {
  display: flex;
  justify-content: space-around;
  flex-direction: row;
  flex-wrap: wrap;
  background-color: peachpuff;
}

.box {
  height: 220px;
  width: 220px;
  margin: 30px;
  font-size: 18px;
  background-color: pink;
}

.inner-shadow {
  box-shadow:
    inset 10px 10px darkred,
    inset -10px -10px darkblue;
}

.sunken-shadow {
  box-shadow: 
    inset 15px 15px teal,
    inset 30px 30px darkgreen;
}

.sunrise-shadow {
  background-color: aquamarine;
  box-shadow:
    inset 0px -16px 34px -16px rgba(0, 0, 0, 0.4),
    inset 0px 28px 58px -10px;
}

.leaf-shadow {
  background-color: lightgreen;
  box-shadow:
    inset 0px -24px 25px 0px rgba(0, 0, 0, 0.25),
    inset 0px -36px 32px 0px rgba(0, 0, 0, 0.2),
    inset 0px -78px 42px 0px rgba(0, 0, 0, 0.15);
}
</panel>
</code>
</codeblock>

In the above example, we have shown the use
of the **inset** keyword.
It changes the shadow to be located inside the element
instead of outside.
