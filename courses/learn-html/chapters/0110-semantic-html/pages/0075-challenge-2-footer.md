Move all the links in the
bottom part of the code inside
a `footer` tag:

<codeblock language="html" type="exercise" testMode="fixedInput">
<body>
  <img src="#">
  <h1>5 Reasons why HTML is the King!</h1>
  <p>In this study, we'll list 5 reasons why HTML is one of the most important languages invented on the web.</p>
  <ol>
    <li>HTML is forgiving</li>
    <li>HTML is easy to understand</li>
    <li>HTML powers the whole web</li>
    <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
    <li>An HTML only website can load really fast</li>
  </ol>
    <a href="/jobs">Careers</a>
    <a href="/contact">Contact</a>
    <a href="/about">About</a>
    <a href="/path">Path</a>
    <a href="/interviews">Interviews</a>
    <a href="/news">News</a>
</body>
</code>
<solution>
<body>
  <img src="#">
  <h1>5 Reasons why HTML is the King!</h1>
  <p>In this study, we'll list 5 reasons why HTML is one of the most important languages invented on the web.</p>
  <ol>
    <li>HTML is forgiving</li>
    <li>HTML is easy to understand</li>
    <li>HTML powers the whole web</li>
    <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
    <li>An HTML only website can load really fast</li>
  </ol>
  <footer>
    <a href="/jobs">Careers</a>
    <a href="/contact">Contact</a>
    <a href="/about">About</a>
    <a href="/path">Path</a>
    <a href="/interviews">Interviews</a>
    <a href="/news">News</a>
  </footer>
</body>
</solution>
</codeblock>
