Counters in CSS are generated as decimal numbers by default.
However, we can customize the appearance of
counters using different list style types.

Commonly used list style types include
`decimal`, `lower-alpha`, `upper-alpha`,
`lower-roman`, and `upper-roman`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h1 class="course">HTML</h1>
  <h2>Introduction to HTML</h2>
  <h3>HTML Elements</h3>
  <h3>HTML Forms</h3>

  <h1 class="course">CSS</h1>
  <h2>Introduction to CSS</h2>
  <h3>CSS Selectors</h3>
  <h3>CSS Layout</h3>

  <h1 class="course">JavaScript</h1>
  <h2>Introduction to JavaScript</h2>
  <h3>JavaScript Functions</h3>
  <h3>JavaScript DOM Manipulation</h3>
</div>
</panel>
<panel language="css">
div {
  counter-reset: course-counter;
}

h1 {
  counter-reset: chapter-counter;
  counter-increment: course-counter;
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
We utilized the `upper-roman`
style to present the `lesson-counter` values.
