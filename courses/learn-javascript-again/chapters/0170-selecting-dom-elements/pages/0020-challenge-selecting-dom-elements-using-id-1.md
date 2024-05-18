In the example given below,
select the image with the id **dog-01**
and
store it in the `firstDog` variable.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img id="dog-01" src="htmldom-dog-01.jpg" height="250px">
<img id="dog-02" src="htmldom-dog-02.jpg" height="250px">
<img id="dog-03" src="htmldom-dog-03.jpg" height="250px">
<img id="dog-04" src="htmldom-dog-04.jpg" height="250px">
</panel>
<panel language="javascript">
let firstDog = ;
/*
  The code below this line will make sense as you study more in the course.
  Right now, simply focus on selecting the element.
*/
firstDog.style.border = "10px solid steelblue";
</panel>
</code>

<solution>
let firstDog = document.getElementById('dog-01');
firstDog.style.border = "10px solid steelblue";
</solution>
</codeblock>