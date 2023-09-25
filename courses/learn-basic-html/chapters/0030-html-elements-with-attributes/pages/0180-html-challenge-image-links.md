Update the provided code
below according to the
following requirements:

- Ensure that all five images are
correctly loaded and displayed
on the screen.
- Add this link to the fourth picture:
`https://en.wikipedia.org/wiki/Ferrari`
- Add appropriate alt text to all images

<codeblock language="html" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="page">
  <h1 id="main-heading">Welcome to HTML Challenge - Image and Links Challenge</h1>
  <h2> Fix the problems with the code below and display all the Images </h2>
  <p>1. HTML</p>
  <img scr = "https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg"></img>

  <p>2. CSS</p>
  <img scr = "https://upload.wikimedia.org/wikipedia/commons/d/d5/CSS3_logo_and_wordmark.svg">

  <p>3. JavaScript</p>
  <img scr = "https://upload.wikimedia.org/wikipedia/commons/b/ba/Javascript_badge.svg>

  <p>4. React</p>
  <img scr = https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg>

  <p class="red">5. Ruby</p>
  <img scr="https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg"
  alt="Ruby">
</div>
</panel>
<panel language="css" hidden="true">
body {
  padding: 0px;
  margin: 0px;
}

#main-heading {
  text-align: center;
  color: rgb(66, 64, 219) !important;
}

img {
  display: block;
  width: 150px;
  padding: 20px;
}

.page {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</panel>
</code>
<solution>
<div class="page">
  <h1 id="main-heading">Welcome to HTML Challenge - Image and Links Challenge</h1>
  <h2> Fix the problems with the code below and display all the Images </h2>
  <p>1. HTML</p>
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg"
  alt="HTML"></img>

  <p>2. CSS</p>
  <img src="https://upload.wikimedia.org/wikipedia/commons/d/d5/CSS3_logo_and_wordmark.svg"
  alt="CSS">

  <p>3. JavaScript</p>
  <img src="https://upload.wikimedia.org/wikipedia/commons/b/ba/Javascript_badge.svg"
  alt="JavaScript">

  <p>4. React</p>
  <img src="https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg"
  href="https://en.wikipedia.org/wiki/Ferrari"
  alt="React">

  <p class="red">5. Ruby</p>
  <img src="https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg"
  alt="Ruby">
</div>
</solution>
</codeblock>
