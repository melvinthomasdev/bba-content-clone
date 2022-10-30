Change the `background-size` of the `p` element so that its background image has **200px** width:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  Body language is a type of nonverbal communication in which physical behaviors, as opposed to words, are used to express or convey the information. Such behavior includes facial expressions, body posture, gestures, eye movement, touch and the use of space. Body language exists in both animals and humans, but this article focuses on interpretations of human body language. It is also known as kinesics.
</p>
</panel>
<panel lang="css">
p {
  padding: 50px 140px;
  background-image: url('https://images.pexels.com/photos/390574/pexels-photo-390574.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=300');
  background-repeat: no-repeat;
}
</panel>
</code>

<solution>
p {
  padding: 50px 140px;
  background-image: url('https://images.pexels.com/photos/390574/pexels-photo-390574.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=300');
  background-repeat: no-repeat;
  background-size: 200px;
}
</solution>
</Editor>