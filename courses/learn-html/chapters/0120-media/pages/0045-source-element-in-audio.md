We can include multiple `<source>`
elements as children of `<audio>` element.

Each `<source>` element should
have the following attributes:
- `src`: This attribute accepts a
valid URL specifying the content
source as a string.
- `type`: This attribute specifies
the audio type of the source file.

The player will automatically
choose and play the first source
that is error free.

<codeblock language="html" type="lesson">
<code>
<audio controls autoplay loop>
  <source src="https://upload.wikimedia.org/wikipedia/commons/5/56/Hip-Hop_P._Pads.wav" type="audio/wav">
  <source src="https://upload.wikimedia.org/wikipedia/commons/f/f8/Hip_hop_Beatmix.ogg" type="audio/ogg">
</audio>
</code>
</codeblock>

