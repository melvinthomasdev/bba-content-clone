The design team of a
company has 3 members,
Ram as a team-lead.
Shyam and Ramesh are fellow
team members.

Give team-lead's name
a font size of `30px`
and color blue.
While, team-member names
should have font-size
of `20px` and color green.

Give all emails a size
of `10px`.


<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h2>Ram</h2>
  <p>ram@abc.com</p>
</div>
<div>
  <h2>Shyam</h2>
  <p>shyam@abc.com</p>
</div>
<div>
  <h2>Ramesh</h2>
  <p>ramesh@abc.com</p>
</div>
</panel>
<panel language="css">
</panel>
</code>
<solution>
<panel language="html">
<div>
  <h2 id="team-lead">Ram</h2>
  <p class="email">ram@abc.com</p>
</div>
<div>
  <h2 class="team-member">Shyam</h2>
  <p class="email">shyam@abc.com</p>
</div>
<div>
  <h2 class="team-member">Ramesh</h2>
  <p class="email">ramesh@abc.com</p>
</div>
</panel>
<panel language="css">
#team-lead {
  font-size: 30px;
  color: blue;
}
.team-member {
  font-size: 20px;
  color: green;
}
.email {
  font-size: 10px;
}
</panel>
</solution>
</codeblock>