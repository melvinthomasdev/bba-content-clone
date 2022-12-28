There is another important thing to note about
the `img` tags. You'll notice that the `img` tag
uses `alt` as shown below:

<codeblock language="html" type="lesson">
<code>
<img src="view-from-a-balcony.jpg" alt="The view from a balcony" width="400px"/>
<img src="view-from-a-somewhere.jpg" alt="The view from a plane" width="235"/>
</code>
</codeblock>

We use `alt` in an `img` tag to provide
a description of the image. This is particularly
useful in situations when our image is
not properly loaded on the screen. Also, the `alt`
text is used by screen readers to explain
the image to visually impaired people.

In the code given above, you can see the first image but not
the second one. Similarly, you cannot see the `alt` text for
the first image, but you can see and read it for the second image.
This is because the first image was properly loaded on the screen,
whereas the second image was not.

There could be many reasons why an image
is not loaded. Maybe your internet is not good,
or the link that you have used for the
image is not correct. Here, we have mistakenly
provided a wrong image name. In the code editor
given above, change the `src` value. Change
it to `view-from-a-plane.jpg`
and you'll see the image loading properly.
