Using the **Styling Tables** knowledge that you have
gained so far, do the following:

  1. Add a background color of `#FF7F50` to header row.
  
  2. Add a background color of `#FFFACD` to `even` rows.

  3. Add a black solid border of `1px` to the whole table,
  and the cells and ensure no double borders.

  4. Apply padding of `10px` to the table cells.

  5. Center the text in the cells both vertically as well as horizontally.

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<table>
  <tr>
    <th>Serial Number</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Email</th>
    <th>Password</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Oliver</td>
    <td>Tran</td>
    <td>tran@gmail.com</td>
    <td>a42df34s</td>
  </tr>

  <tr>
    <td>2</td>
    <td>Priya</td>
    <td>Sen</td>
    <td>priyasen@gmail.com</td>
    <td>54#NASD232</td>
  </tr>

  <tr>
    <td>3</td>
    <td>Mazahir</td>
    <td>H</td>
    <td>mazahirh1999 @gmail.com</td>
    <td>NASDAQ23@#</td>
  </tr>

  <tr>
    <td>4</td>
    <td>Chirag</td>
    <td>Gautham</td>
    <td>chiraggautham@bigbinary.com</td>
    <td>86rfghju#%</td>
  </tr>

  <tr>
    <td>5</td>
    <td>Nithin</td>
    <td>Krish</td>
    <td>nithinkrish@gmail.com</td>
    <td>62ghytwTTY</td>
  </tr>
</table>
</panel>
<panel language="css">
body{
  background-color:#DEB887;
}

/* Write your code here */
</panel>
</code>
<solution>
body{
  background-color:#DEB887;
}

th {
  background-color: #FF7F50;
}

tr:nth-child(even) {
  background-color: #FFFACD;
}

table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}

th, td {
  padding: 10px;
}

th, td {
  vertical-align: middle;
  text-align: center;
}
</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
