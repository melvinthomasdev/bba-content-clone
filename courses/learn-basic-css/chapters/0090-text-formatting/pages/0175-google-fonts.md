**Google Fonts** is a great way to
add beautiful fonts to your websites.

Let's see how to use it to get a font for our project:

- Visit Google Fonts website [https://fonts.google.com/](https://fonts.google.com/), and click on the search bar.

  <image>googlefonts1.png</image>

- Search for the required font. For example, let's use the font **Roboto**.

  <image>googlefonts2.png</image>

- Select the required font from the search result.

  <image>googlefonts3.png</image>

- Specimen page of the font will open, scroll down in the same page to view the list of font styles.

  <image>googlefonts4.png</image>

- Click on the **+** button to add the required font style to **selected families**.

  <image>googlefonts5.png</image>

- Click on the **View selected families** button in the top right corner.

  <image>googlefonts6.png</image>

- Now, copy the `<link>` tags and paste them into the `<head>` section of your html, as shown in the example code below.

  <image>googlefonts7.png</image>

Let's look at the example code:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>
<body>
  <h1>Transform Your Website with Google Fonts</h1>

  <p>Google Fonts offer a versatile range of typography choices to enhance your website's design.</p>
</body>
</panel>
<panel language="css">
h1 {
  font-family: 'Roboto', sans-serif;
}

p {
  font-family: 'Roboto', sans-serif;
}
</panel>
</code>
</codeblock>

In the above example, we are using
the Google Font **Roboto**,
by adding the `<link>` tags to
the `<head>` section of our HTML.
