We can have multiple `<source>` which defines an audio file source. The player
will choose the first valid source.

<codeblock language="html" type="lesson">
<code>
<audio controls autoplay muted loop>
  <source src="https://upload.wikimedia.org/wikipedia/commons/f/f8/Hip_hop_Beatmix.ogg" type="audio/ogg">
  <source src="https://upload.wikimedia.org/wikipedia/commons/5/56/Hip-Hop_P._Pads.wav" type="audio/wav">
</audio>
</code>
</codeblock>

There are few important attributes of a `<audio>` tag:

**controls:** We must provide the `controls` attribute for player to get
displayed. As by default `<audio>` player remains invisible.

**autoplay:** `autoplay` is used to play the audio automatically as soon as the
page loads.

**muted:** This loads the player with the audio `muted`.

**loop:** Plays the audio on a loop, unless paused.
