Create a page heading with the following text, **Welcome to My Website**

Below the heading, add a paragraph with the following text,
**Hello! I am a web developer passionate about HTML and CSS. This is my website where I share my knowledge and experiences.**

Then, create the following:

1. Create an unordered list with
   the following three list items:
   - Home
   - About
   - Contact
2. Create an ordered list with the
   following three list items:
   - Define the project requirements
   - Create basic setup
   - Code the website using basic HTML
3. Insert a line break after the ordered list.
4. Insert an image with the source as **https://ucarecdn.com/4f018f4c-5f28-45f5-87dc-dd477c00517c/-/preview/500x700/**
   and add the following alternative text, **A houseboat on a river in Kerala.**
5. Create a table with the caption **Monthly Expenses** and add the following content to it,

| Category      | Amount | Date       |
| ------------- | ------ | ---------- |
| Groceries     | $150   | 2023-08-02 |
| Clothes       | $100   | 2023-08-02 |
| Entertainment | $50    | 2023-08-02 |

Add a table footer with the following text, **Total: $300**

### Note:
- Each unordered list item should
be a link with href set as **#**.
- Since, there is no proper link
for the images,
we should see the alternate text
in their place.

Now, add a paragraph with the following
text:
**© 2023 BigBinary. All rights reserved.**

<codeblock language="html" type="exercise" testMode="fixedInput" matchSolutionCode="true">
<code>
<!-- Write your code below -->
</code>
<solution>
<!-- Write your code below -->
<h1>Welcome to My Website</h1>

<p>Hello! I am a web developer passionate about HTML and CSS. This is my website where I share my knowledge and experiences.</p>

<ul>
  <li><a href="#">Home</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Contact</a></li>
</ul>
<ol>
  <li>Define the project requirements</li>
  <li>Create basic setup</li>
  <li>Code the website using basic HTML</li>
</ol>
<br>
<img src="https://ucarecdn.com/4f018f4c-5f28-45f5-87dc-dd477c00517c/-/preview/500x700/" alt="A houseboat on a river in Kerala.">
<table>
  <caption>Monthly Expenses</caption>
  <thead>
    <tr>
      <th>Category</th>
      <th>Amount</th>
      <th>Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Groceries</td>
      <td>$150</td>
      <td>2023-08-02</td>
    </tr>
    <tr>
      <td>Clothes</td>
      <td>$100</td>
      <td>2023-08-02</td>
    </tr>
    <tr>
      <td>Entertainment</td>
      <td>$50</td>
      <td>2023-08-02</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Total:</td>
      <td>$300</td>
    </tr>
  </tfoot>
</table>

<p>© 2023 BigBinary. All rights reserved.</p>
</solution>
</codeblock>
