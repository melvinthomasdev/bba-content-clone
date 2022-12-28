<!-- TODO: How to introduce the event delegation point? -->
In large applications, we can have
many similar DOM elements on which
we want to watch for an event. Instead
of following this approach, and creating
multiple event listeners, it makes sense
to simply watch for the event on their parent
DOM element.

Look at the example given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h2>First Method - Listening for click event on all children elements</h2>
<div id="first-parent">
</div>

<h2>Second Method - Listening for click event on the parent element</h2>
<div id="second-parent">
</div>
</panel>
<panel language="css">
#first-parent, #second-parent {
  display: flex;
  justify-content: space-around;
  padding: 1rem;
  border: 3px dotted lightpink;
}

.circle {
  width: 50px;
  height: 50px;
  background-color: crimson;
  border-radius: 50%;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
}

h2 {
  text-align: center;
}
</panel>
<panel language="javascript">
// First Method - Listening on event on all children elements
let firstParentDiv = document.querySelector('#first-parent');

for(let i = 0; i < 10; i++) {
  let childDiv = document.createElement('div');
  childDiv.classList.add('circle');
  firstParentDiv.append(childDiv);
  childDiv.addEventListener("click", () => {
      childDiv.style.backgroundColor = "green";
  });
}

// Second Method - Listening on event on the parent element
let secondParentDiv = document.querySelector('#second-parent');
secondParentDiv.addEventListener("click", (e) => {
  e.target.style.backgroundColor = "green";
});

for(let i = 0; i < 10; i++) {
  let childDiv = document.createElement('div');
  childDiv.classList.add('circle');
  secondParentDiv.append(childDiv);
}
</panel>
</code>
</codeblock>

There is a problem with the second method
given above. Try clicking inside the second div,
but avoid the circles. The complete `div` becomes
green. Why did this happen?

This happens because we are watching for the
click event on the whole `div`. We can resolve this by
adding in a condition that ensures that changes only
get applied when we click on a circle. Look at the example
given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h2>Second Method - Listening for click event on the parent element</h2>
<h3>Also ensuring that only the circles react on click</h3>
<div id="second-parent">
</div>
</panel>
<panel language="css">
#second-parent {
  display: flex;
  justify-content: space-around;
  padding: 1rem;
  border: 3px dotted lightpink;
}

.circle {
  width: 50px;
  height: 50px;
  background-color: crimson;
  border-radius: 50%;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
}

h2, h3 {
  text-align: center;
}
</panel>
<panel language="javascript">
// Second Method - Listening on event on the parent element
let secondParentDiv = document.querySelector('#second-parent');
secondParentDiv.addEventListener("click", (e) => {
    if(e.target.classList.contains("circle")) {
        e.target.style.backgroundColor = "green";
    }
});

for(let i = 0; i < 10; i++) {
  let childDiv = document.createElement('div');
  childDiv.classList.add('circle');
  secondParentDiv.append(childDiv);
}
</panel>
</code>
</codeblock>