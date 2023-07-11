There are so many HTML tags
that make no visible change
on the page like `main`,
`aside`, `footer`, `<span>`
among others.

Why don't we simply use
a single element like `div`
for all purposes?

Imagine the simplicity.

Wait, don't imagine, let us show you:

<codeblock language="html" type="lesson">
<code>
<panel language="html">
<html>
  <head>
  </head>
  <body>
    <div>
      <ul class="nav">
        <li><a href="/home">Home</a></li>
        <li><a href="/courses">Courses</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </div>
    <div class="header">
      <h1>5 Reasons why <span class="highlight">HTML is the King!</span></h1>
    </div>
    <div class="main">
      <p>In this study, we'll list 5 reasons why HTML is one of the most important languages invented on the web.</p>
      <ul>
        <li>HTML is forgiving</li>
        <li>HTML is easy to understand</li>
        <li>HTML powers the whole web</li>
        <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
        <li>An HTML only website can load really fast</li>
      </ul>
    </div>
    <div class="footer">
      <p>Created by: <span class="highlight">BigBinary Academy</span></p>
    </div>
  </body>
</html>
</panel>
<panel language="css">
.nav {
  display: flex;
  justify-content: space-around;
  list-style: none;
}
.nav > li {
  padding: 5px;
  font-weight: 700;
}
.header {
  display: flex;
  justify-content: center;
}
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.footer {
  display: flex;
  justify-content: center;
  font-weight: 700;
}
.highlight {
  color: blue;
  font-weight: 700;
}
</panel>
</code>
</codeblock>

In the previous code, we
utilized the `<div>` element
to create different sections.
However, it becomes evident
that relying solely on `<div>`
makes the code difficult to
read and to style.

## Best practice

Try updating the below code
using proper semantic html tags
according to best practices.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<html>
  <head>
  </head>
  <body>
    <div>
      <ul class="nav">
        <li><a href="/home">Home</a></li>
        <li><a href="/courses">Courses</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </div>
    <div class="header">
      <h1>5 Reasons why <span class="highlight">HTML is the King!</span></h1>
    </div>
    <div class="main">
      <p>In this study, we'll list 5 reasons why HTML is one of the most important languages invented on the web.</p>
      <ul>
        <li>HTML is forgiving</li>
        <li>HTML is easy to understand</li>
        <li>HTML powers the whole web</li>
        <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
        <li>An HTML only website can load really fast</li>
      </ul>
    </div>
    <div class="footer">
      <p>Created by: <span class="highlight">BigBinary Academy</span></p>
    </div>
  </body>
</html>
</panel>
<panel language="css">
.nav {
  display: flex;
  justify-content: space-around;
  list-style: none;
}
.nav > li {
  padding: 5px;
  font-weight: 700;
}
.header {
  display: flex;
  justify-content: center;
}
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.footer {
  display: flex;
  justify-content: center;
  font-weight: 700;
}
.highlight {
  color: blue;
  font-weight: 700;
}
</panel>
</code>
<solution>
<panel language="html">
<html>
  <head>
  </head>
  <body>
    <nav>
      <ul class="nav">
        <li><a href="/home">Home</a></li>
        <li><a href="/courses">Courses</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </nav>
    <header class="header">
      <h1>5 Reasons why <span class="highlight">HTML is the King!</span></h1>
    </header>
    <main class="main">
      <p>In this study, we'll list 5 reasons why HTML is one of the most important languages invented on the web.</p>
      <ul>
        <li>HTML is forgiving</li>
        <li>HTML is easy to understand</li>
        <li>HTML powers the whole web</li>
        <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
        <li>An HTML only website can load really fast</li>
      </ul>
    </main>
    <footer class="footer">
      <p>Created by: <span class="highlight">Bigbinary Academy</span></p>
    </footer>
  </body>
</html>
</panel>
<panel language="css">
.nav {
  display: flex;
  justify-content: space-around;
  list-style: none;
  font-weight: 700;
}
.header {
  display: flex;
  justify-content: center;
}
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.footer {
  display: flex;
  justify-content: center;
  font-weight: 700;
}
.highlight {
  color: blue;
  font-weight: 700;
}
</panel>
</solution>
</codeblock>

As we can see, the revised code
provided as solution is now clear
and easy to read.
