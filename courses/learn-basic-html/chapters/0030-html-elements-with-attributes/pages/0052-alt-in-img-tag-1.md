In the code given below, you can see the first image but not
the second one. Similarly, you cannot see the `alt` text for
the first image, but you can see and read it for the second image.
This is because the first image was properly loaded on the screen,
whereas the second image was not.

<codeblock language="html" type="lesson">
<code>
<img src="https://ucarecdn.com/b9721aee-1c09-4d0c-9bcb-8969afe2751e/-/resize/400x/" alt="The view from a balcony">
<img src="broken-link.jpg" alt="The view from a plane">
</code>
</codeblock>

There could be many reasons why an image
is not loaded. Maybe your internet is not good,
or the link that you have used for the
image is not correct. Here, we have mistakenly
provided a wrong image name. In the code editor
given above, change the `src` value. Change
it from 'broken-link.jpg' to `https://ucarecdn.com/823d310f-252a-4010-9153-6e9718da3b8d/-/resize/235x/`
and you'll see the image loading properly.
