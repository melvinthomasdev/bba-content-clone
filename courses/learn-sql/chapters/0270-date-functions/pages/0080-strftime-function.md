Let's say we just need the month part of the current timestamp.

STRFTIME is a SQL function that can be used over DATETIME to extract specific information.
Look at the example below.

<codeblock language="sql" dbName="clean-slate.db" type="lesson">
<code>
SELECT STRFTIME('%m', DATETIME('Now'))
</code>
</codeblock>

Let's say we need the current hour. The query would look like this:

<codeblock language="sql" dbName="clean-slate.db" type="lesson">
<code>
SELECT STRFTIME('%H', DATETIME('Now'))
</code>
</codeblock>

Here are a few basic parameters that you can use to extract specific datetime related information.

<table>
  <tr>
    <td>%d</td>
    <td>day of month: 00</td>
  </tr>
  <tr>
    <td>%f</td>
    <td>fractional seconds: SS.SSS</td>
  </tr>
  <tr>
    <td>%H</td>
    <td>hour: 00-24</td>
  </tr>
  <tr>
    <td>%j</td>
    <td>day of year: 001-366</td>
  </tr>
  <tr>
    <td>%J</td>
    <td>Julian day number</td>
  </tr>
  <tr>
    <td>%m</td>
    <td>month: 01-12</td>
  </tr>
  <tr>
    <td>%M</td>
    <td>minute: 00-59</td>
  </tr>
  <tr>
    <td>%s</td>
    <td>seconds since 1970-01-01</td>
  </tr>
  <tr>
    <td>%S</td>
    <td>seconds: 00-59</td>
  </tr>
  <tr>
    <td>%w</td>
    <td>day of week 0-6 with Sunday==0</td>
  </tr>
  <tr>
    <td>%W</td>
    <td>week of year: 00-53</td>
  </tr>
  <tr>
    <td>%Y</td>
    <td>year: 0000-9999</td>
  </tr>
</table>

You can also combine one or more date parameters to get information the way you need it.
Suppose we want the time stamp in format `DD/MM/YYYY HH:MM:SS`.
Look at the query below

<codeblock language="sql" dbName="clean-slate.db" type="lesson">
<code>
SELECT STRFTIME('%d/%m/%Y %H:%M:%S', DATETIME('Now')) AS timestamp
</code>
</codeblock>