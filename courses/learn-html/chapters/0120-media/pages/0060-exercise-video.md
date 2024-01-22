Change the code given below so that:

The video players gets loaded.

Set the video width to 320px and height to 240px.

Also, the video gets played on loop.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<video>
  <source src="https://storage.googleapis.com/web-dev-assets/video-and-source-tags/chrome.webm" type="video/webm">
</video>
</code>

<solution>
<video controls width="320" height="240" loop>
  <source src="https://storage.googleapis.com/web-dev-assets/video-and-source-tags/chrome.webm" type="video/webm">
</video>
</solution>
</codeblock>
