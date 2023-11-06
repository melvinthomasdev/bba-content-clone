The `counter-reset` property
is used to define and initialize
the counter to desired value.
By default it resets the counter
to zero.

```css
counter-reset: chapter-counter 2;
```
In the above code snippet,
we are resetting the counter to 2.

The `counter-increment` property
is used to specify the increment
value. The default increment is 1.

```css
counter-increment: chapter-counter 5;
```

In the above code snippet, we are
incrementing the counter by multiples of 5.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="course">HTML</div>
<h2>Introduction to HTML</h2>
<h3>HTML Elements</h3>
<h3>HTML Forms</h3>

<div class="course">CSS</div>
<h2>Introduction to CSS</h2>
<h3>CSS Selectors</h3>
<h3>CSS Layout</h3>

<div class="course">JavaScript</div>
<h2>Introduction to JavaScript</h2>
<h3>JavaScript Functions</h3>
<h3>JavaScript DOM Manipulation</h3>
</panel>
<panel language="css">
body {
  counter-reset: course-counter 2;
}
.course {
  counter-reset: chapter-counter;
  counter-increment: course-counter 2;
  font-size: 32px;
}
h2 {
  counter-reset: lesson-counter;
  counter-increment: chapter-counter;
  margin-left: 20px;
}
h3 {
  margin-left: 40px;
  counter-increment: lesson-counter;
}
.course::before {
  content: "Course " counter(course-counter) ": ";
  font-weight: bold;
  color: #0077b6;
}
h2::before {
  content: "Chapter " counter(course-counter) "." counter(chapter-counter) ": ";
  font-weight: bold;
  color: #0077b6;
}
h3::before {
  content: counter(lesson-counter, upper-roman) ". ";
  font-weight: normal;
  color: #0077b6;
}
</panel>
</code>
</codeblock>

In the above example,
three different counters are used
to generate the numbering for
`courses`, `chapters`, and `lessons`.
We initialized the `course-counter` to 2,
and also incremented it by 2.

Counters are generated as decimal
numbers by default. But we can use
other list style types as well to
style counters. We used the
`upper-roman` characters to display
the `lesson-counter` values.

Commonly used counter list style types are
`decimal`, `lower-alpha`, `upper-alpha`,
`lower-roman` and `upper-roman`.
