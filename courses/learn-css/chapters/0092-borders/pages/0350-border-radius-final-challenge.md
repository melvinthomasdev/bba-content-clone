Apply `border-radius: 20px` to the
`.video-button`, `.audio-button`
and
`.text-button` class elements to give
them rounded corners.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="chat-call-interface">
  <div class="background-image"></div>
  <div class="buttons">
    <button class="video-button">Start Video</button>
    <button class="audio-button">Mute Audio</button>
    <button class="text-button">Send Message</button>
  </div>
</div>
</panel>
<panel language="css">
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}
.chat-call-interface {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 300px;
  margin: 20px;
  background: lightcyan;
}
.background-image {
  background-image: url('https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/men-avatar_dMCyM-LPh.jpeg');
  background-size: cover;
  background-position: center;
  width: 100%;
  height: 200px;
}
.buttons {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 30px 0;
}
.video-button,
.audio-button,
.text-button {
  background-color: #3498db;
  color: white;
  padding: 10px 20px;
  border: none;
  margin: 5px;
  cursor: pointer;
}
.video-button:hover,
.audio-button:hover,
.text-button:hover {
  background-color: #2980b9;
}
</panel>
</code>
<solution>
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}
.chat-call-interface {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 300px;
  margin: 20px;
  background: lightcyan;
}
.background-image {
  background-image: url('https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/men-avatar_dMCyM-LPh.jpeg');
  background-size: cover;
  background-position: center;
  width: 100%;
  height: 200px;
}
.buttons {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 30px 0;
}
.video-button,
.audio-button,
.text-button {
  background-color: #3498db;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 20px;
  margin: 5px;
  cursor: pointer;
}
.video-button:hover,
.audio-button:hover,
.text-button:hover {
  background-color: #2980b9;
}
</solution>
</codeblock>
