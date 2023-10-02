There are few important attributes of a `<audio>` tag:

**src:** This attribute accepts a valid URL specifying
the content source as a string.

**controls:** We must provide the `controls` attribute for player to get
displayed. As by default `<audio>` player remains invisible.

**autoplay:** `autoplay` is used to play the audio automatically as soon as the
page loads.

**muted:** This loads the player with the audio `muted`.

**loop:** Plays the audio on a loop, unless paused.

Let us look at an example of
audio element with attributes:
<codeblock language="html" type="lesson">
<code>
<audio src="https://upload.wikimedia.org/wikipedia/commons/f/f8/Hip_hop_Beatmix.ogg" controls autoplay muted loop></audio>
</code>
</codeblock>

