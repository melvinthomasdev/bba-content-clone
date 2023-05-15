Add following non-visual data
to the HTML `div` element:
`student-name = John Doe`

Add another non-visual data
`student-age = 12` using
javascript.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="student-data">I am a student of history.</div>
</panel>
<panel language="javascript">
// Write your code here
</panel>
</code>
<solution>
<panel language="html">
<div id="student-data" data-student-name="John-doe">I am a student of history.</div>
</panel>
<panel language="javascript">
const el = document.querySelector('#student-data');

el.dataset.dataStudentAge = "12";
</panel>
</solution>
</codeblock>
