Remove the class **censor** from
the span elements using the `classList`
property.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p><span class="censor">"My Immortal"</span> is popularly regarded as one of the worst works of fan fiction ever written. Since the work's publication, it has gained infamy for its constant grammar and spelling errors, plot inconsistencies and complete disregard for the original <span class="censor">Harry Potter</span> source material. Despite this, the series has also inspired multiple derivative works, including a YouTube web series, and is viewed with nostalgia for adolescent fan life. The author's identity has never been confirmed and has been deemed by many as "unsolvable". The author published the story under the username <span class="censor">"XXXbloodyrists666XXX"</span> and self-identified as <span class="censor">Tara Gilesbie.</span></p>
</panel>
<panel language="css">
p {
  font-size: 24px;
  font-family: Roboto;
}

.censor {
  background-color: black;
}
</panel>
<panel language="javascript">
let spanText = document.querySelectorAll('span');
for (let span of spanText) {
  // Write your solution here
}
</panel>
</code>

<solution>
let spanText = document.querySelectorAll('span');
for (let span of spanText) {
  span.classList.remove('censor');
}
</solution>
</codeblock>