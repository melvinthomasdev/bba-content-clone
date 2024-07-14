Make the image background fill up the entire `div` container:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h1>Meditation</h2>
  <p>
    Meditation is a practice where an individual uses a technique – such as mindfulness, or focusing the mind on a particular object, thought, or activity – to train attention and awareness, and achieve a mentally clear and emotionally calm and stable state.
  </p>
</div>
</panel>
<panel language="css">
div {
  padding: 50px;
  background-image: url('https://images.pexels.com/photos/4466492/pexels-photo-4466492.jpeg?auto=compress&cs=tinysrgb&w=500');
}
</panel>
</code>

<solution>
div {
  padding: 50px;
  background-image: url('https://images.pexels.com/photos/4466492/pexels-photo-4466492.jpeg?auto=compress&cs=tinysrgb&w=500');
  background-size: cover;
}
</solution>
</codeblock>