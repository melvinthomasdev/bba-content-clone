Let's look at some important attributes of `<video>` tag, through this example:

<codeblock language="html" type="lesson">
<code>
<video controls width="320" height="240" autoplay muted loop poster="birds-900.avif">
  <source src="https://storage.googleapis.com/web-dev-assets/video-and-source-tags/chrome.webm" type="video/webm">
</video>
</code>
</codeblock>

**controls:** The `controls` attribute displays the video player, with buttons
like play, pause, volume adjustments, full-screen icon, playback speed and
download.

**width and height:** The `height` and `width` attributes specify the dimensions of the video player. We should use absolute units, such as pixels (`px`), for these values. For consistent styling practices, all styles should ideally be placed in the CSS section.

**autoplay:** `autoplay` is used to play the video automatically as soon as the
page loads.

**muted:** This loads the player with the video `muted`.

**loop:** Plays the video on a `loop`, unless paused.

**poster:** The `poster` attribute adds an image over the video, which is
displayed unless the video gets played.
