It is important to maintain consistency and clarity in your `id` or `class` names.

- It should be written in **lowercase letters** e.g.: `.header`, `.content`,
`.footer`.

- Multiple words should be **hyphen-separated**, this is also known as **kebab-case** e.g.:
`.main-menu`, `.primary-button`, `.card-container`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1 class="header">
  BigBinary Academy
</h1>
<p class="main-menu">
  Home
  Courses
  About
  Contact
</p>
<p class="content">
  Learn by actual coding in an interactive environment using BigBinary Academy.
</p>
<p class="footer">
  Big Binary LLC.
  academy@bigbinary.com
</p>
</panel>
<panel language="css">
.header {
  color: darkblue;
}
.main-menu {
  font-size: 18px;
}
.content {
  font-size: 24px;
}
.footer {
  font-size: 12px;
}
</panel>
</code>
</codeblock>
