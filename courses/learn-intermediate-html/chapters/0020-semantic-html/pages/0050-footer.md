A `footer` is a simple way to
organize some of our HTML. Stuff
that goes down below in our web page,
like address, copyright information, we
can put in a `footer`.

<codeblock language="html" type="lesson">
<code>
<header>
    <h1>The World Awaits its heroes!</h1>
</header>
<main>
    <h2>Is everyone fine on the spaceship?</h2>
    <p>There have been rumors about the safety of the space pilots.</p>
    <img src="">
    <p>We need to ensure that no harm comes to these people.</p>
</main>
    <p> Copyright 1999-2022 by Ref DT. All Rights Reserved. </p>
</code>
</codeblock>

In the example given above, we can
see that all our major content is
about the spaceship. The copyright
information doesn't sound like
the **main** content. It needs to be
in a footer as shown below:

<codeblock language="html" type="lesson">
<code>
<header>
    <h1>The World Awaits its heroes!</h1>
</header>
<div>
    <h2>Is everyone fine on the spaceship?</h2>
    <p>There have been rumors about the safety of the space pilots.</p>
    <img src="">
    <p>We need to ensure that no harm comes to these people.</p>
</div>
<footer>
    <p> Copyright 1999-2022 by Ref DT. All Rights Reserved. </p>
</footer>
</code>
</codeblock>

We use a `footer` to organize content
that goes at the end of our web pages.

Take a look at the following example:

<codeblock language="html" type="lesson">
<code>
<html>
    <head>
    </head>
    <body>
        <img src="#">
        <h1>5 Reasons why HTML is the King!</h1>
        <p>In this study, we'll list 10 reasons why HTML is one of the most important languages invented on the web.</p>
        <ol>
            <li>HTML is forgiving</li>
            <li>HTML is easy to understand</li>
            <li>HTML powers the whole web</li>
            <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
            <li>An HTML only website can load really fast</li>
        </ol>
        <p>Copyright belongs to Our Company Inc.</p>
    </body>
</html>
</code>
</codeblock>

We can rewrite this example
using the `footer` tag.

<codeblock language="html" type="lesson">
<code>
<html>
    <head>
    </head>
    <body>
        <img src="#">
        <h1>5 Reasons why HTML is the King!</h1>
        <p>In this study, we'll list 10 reasons why HTML is one of the most important languages invented on the web.</p>
        <ol>
            <li>HTML is forgiving</li>
            <li>HTML is easy to understand</li>
            <li>HTML powers the whole web</li>
            <li>HTML can be easily configured with other languages like JavaScript, and Python</li>
            <li>An HTML only website can load really fast</li>
        </ol>
        <footer>
            <p>Copyright belongs to Our Company Inc.</p>
        </footer>
    </body>
</html>
</code>
</codeblock>

We can add more stuff like this
in the footer. Sometimes, you'll find
the footer section in a web page includes
links to different sections of the web
site.
