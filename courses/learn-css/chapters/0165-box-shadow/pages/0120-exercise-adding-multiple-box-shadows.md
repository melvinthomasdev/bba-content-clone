Apply multiple box shadows to the element with
the class **box**. Use the following values:

```css
-8px 8px rgba(255, 165, 0, 0.4)
-12px 12px rgba(255, 165, 0, 0.3)
-16px 16px rgba(255, 165, 0, 0.2)
-20px 20px rgba(255, 165, 0, 0.1)
```

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="container">
  <div class="box"></div>
</div>
</panel>
<panel language="css">
#container {
  display: flex;
  justify-content: space-around;
  height: 95vh;
  background-color: #f5f5f5;
}

.box {
  width: 200px;
  height: 200px;
  margin: 30px;
  border-radius: 10px;
  background-color: coral;
  /*Write your code here*/
}
</panel>
</code>

<solution>
#container {
  display: flex;
  justify-content: space-around;
  height: 90vh;
  background-color: #f5f5f5;
}

.box {
  width: 200px;
  height: 200px;
  margin: 30px;
  border-radius: 10px;
  background-color: coral;
  /*Write your code here*/
  box-shadow:
    -8px 8px rgba(255, 165, 0, 0.4),
    -12px 12px rgba(255, 165, 0, 0.3),
    -16px 16px rgba(255, 165, 0, 0.2),
    -20px 20px rgba(255, 165, 0, 0.1);
}
</solution>
</codeblock>
