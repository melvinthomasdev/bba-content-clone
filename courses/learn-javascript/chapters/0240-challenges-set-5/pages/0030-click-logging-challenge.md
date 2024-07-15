Create a dynamic webpage with styled sections and interactive features focused on click logging, using JavaScript for DOM manipulation according to these requirements,

<image>click-log-challenge-demo.gif</image>

**Create Section Divs**

Inside the `div` with the class "container", using JavaScript dynamically create three `<div>` elements with the class `section` and an additional class named `section-one`, `section-two`, and `section-three` respectively. Applying these classes will take care of the styling.
  
**Add Click Log Section**

Inside the `div` with the class "log-section", create another `<div>` element with the class `click-log` and a `<h2>` heading with the text **"Click Log"** using JavaScript.

**Hover Effect**

Add an event listener to each section `<div>` so that when the cursor hovers over any section, its background color changes to red, and reverts to its original color on mouseout.

**Click Event Logs**

Implement functionality such that when a user clicks on any section `<div>`, dynamically add a `<p>` element to the `click-log` section with the text **"Clicked on div 1**", **"Clicked on div 2"**, or **"Clicked on div 3"** based on the `<div>` number.

**Clear Button**

Inside the `div` with the class "log-section" itself, at the bottom of the `click-log` section, create a `<button>` with JavaScript that clears all entries from the log when clicked.


Make sure all tasks are completed using JavaScript for element creation, event handling, and DOM manipulation to improve user interaction and logging functionality. Use the `sectionDetails` array of objects provided in the code to construct the challenge.

Make sure all tasks are accomplished using JavaScript for element creation, event handling, and DOM manipulation to enhance user interaction and logging functionality. Make use of the `sectionDetails` array of objects provided in the code to construct the challenge.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="container">
</div>
<div class="log-section">
</div>
</panel>
<panel language="css"  hidden="true">
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 50vh;
    background-color: #f0f0f0;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    margin: auto;
}

.section {
    width: 80%;
    margin: 10px 0;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.click-log {
    margin-top: 20px;
    width: 100%;
    text-align: left;
}


.section-one {
	background-color: #ffcccc;
}

.section-two {
	background-color: #ccffcc;
}

.section-three {
	background-color: #ccccff;
}
</panel>
<panel language="javascript">
const sectionDetails = [
  {
    id: 1,
    className: "section-one",
    backgroundColor: "#ffcccc"
  },
  {
    id: 2,
    className: "section-two",
    backgroundColor: "#ccffcc"
  },
  {
    id: 3,
    className: "section-three",
    backgroundColor: "#ccccff"
  }
];
// Write code below 

</panel>
</code>
<solution>
const sectionDetails = [
  {
    id: 1,
    className: "section-one",
    backgroundColor: "#ffcccc"
  },
  {
    id: 2,
    className: "section-two",
    backgroundColor: "#ccffcc"
  },
  {
    id: 3,
    className: "section-three",
    backgroundColor: "#ccccff"
  }
];

// Write code below 

const containerSection = document.querySelector('.container');
const logSection = document.querySelector('.log-section');

sectionDetails.forEach(({ id, className }) => {
  const section = document.createElement('div');
  section.classList.add('section', className);
  section.textContent = `Section ${id}`;
  containerSection.appendChild(section);

  section.addEventListener('mouseover', () => {
    section.style.backgroundColor = 'red';
  });

  section.addEventListener('mouseout', () => {
    const sectionDetail = sectionDetails.find(detail => section.classList.contains(detail.className));
    if (sectionDetail) {
      section.style.backgroundColor = sectionDetail.backgroundColor;
    }
  });

  section.addEventListener('click', () => {
    const paragraph = document.createElement('p');
    paragraph.textContent = `Clicked on div ${id}`;
    clickLog.appendChild(paragraph);
  });
});

const clickLogDiv = document.createElement('div');
clickLogDiv.classList.add('click-log');
logSection.appendChild(clickLogDiv);

const headingElement = document.createElement('h2');
headingElement.textContent = 'Click Log';
clickLogDiv.appendChild(headingElement);

const clearLogButton = document.createElement('button');
clearLogButton.setAttribute('id', 'clear-log-button');
clearLogButton.textContent = 'Clear Log';
logSection.appendChild(clearLogButton);

const clickLog = document.querySelector('.click-log');

clearLogButton.addEventListener('click', () => {
  clickLog.innerHTML = '';
  clickLog.appendChild(headingElement);
});

</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
