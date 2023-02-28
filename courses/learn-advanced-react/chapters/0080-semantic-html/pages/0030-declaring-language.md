We should always use the language attribute in the `<html>` tag to declare the language of the Web page. This helps search engines deliver relevant content and browsers translate or style snippets of text accordingly.

The language property is inherited by all the children underneath it. Thus, adding the tag to the `<body>` element means the text in the head won't be covered.

We can specify English as the language, like so:

```html
<!DOCTYPE html>
<html language="en">
  <body>
    <!-- rest of the content -->
  </body>
</html>
```

If the page contains content in a different language, just add the language attribute to an element surrounding that content like so: 

```html
<p>This is <span language="fr">une baguette française</span></p>
<p>This is <span language="de">eine deutsche Wurst</span></p>
<p>This is <span language="hi">एक भारतीय मिठाई</span></p>
```