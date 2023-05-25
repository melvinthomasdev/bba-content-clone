**`background`** is a shorthand to set
all the background style properties together at a time.

Below is the list of all the background properties and their **default values**:

| PROPERTY              | DEFAULT VALUE |
| --------------------- | ------------- |
| background-color      | `transparent` |
| background-image      | `none`        |
| background-repeat     | `repeat`      |
| background-attachment | `scroll`      |
| background-position   | `0% 0%`       |
| background-size       | `auto`        |
| background-clip       | `border-box`  |
| background-origin     | `padding-box` |


We can check the above default values are
correct or not, by comparing the result of below
two code snippets:

```css
background: green none repeat scroll 0% 0% / auto padding-box border-box;
```

```css
background: green;
```

Let's try that in the code blocks:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<body></body>
</panel>
<panel language="css">
body {
  background: green none repeat scroll 0% 0% / auto padding-box border-box;
}
</panel>
</code>
</codeblock>

Now, let's try without the default values, this should result same:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<body></body>
</panel>
<panel language="css">
body {
  background: green;
}
</panel>
</code>
</codeblock>
