Update the provided code below
to perform the following tasks:

- Set background color as `lightblue`
  and
  font color as `snow` for the
  `<h1>` element.
- Increase the font size of the `<h1>`
  element to 64px.
- Apply the text color `snow` to the
  first 3 paragraphs with the class
  `first-section-details.` Set the background
  color to `cadetblue`.
- When the `Join the workshop` button is
  clicked, change the text of the `<h1>`
  element to `I joined the workshop.`
- When the button with the text
  `Misty Everywhere` is clicked,
  change the author name in each paragraph
  with the class `message` to `Misty.`

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<h1>Welcome to BigBinary Workshop</h1>
<div>
  <h2>About the workshop</h2>
  <p class="first-section-details">
    Learning anything new is not easy. Learning coding is definitely
    challenging.
  </p>
  <p class="first-section-details">
    At BigBinary workshop, our goal is to help you to learn coding in a
    consistent and slow manner.
  </p>
  <p class="first-section-details">
    <span id="quote">Slow learning is good learning.</span> Our society is
    addicted to speed. We all want everything fast. When it comes to
    learning, going slow is a good thing. That's because, when you learn
    slowly, you are more likely to remember the things you have picked up.
    This is why, every BigBinary workshop is structured in such a manner
    that you need to spend only 2 hours per day.
  </p>
</div>
<button>Join the workshop</button>

<p class="message">
  <span class="author">Mahith</span>: Hello everyone . I have solved this
  question ( no.10) from codeWars but when I was going through the other
  solutions I found that they are using ternary operator ,which is
  completely fine , but when the condition is true , the code after " ? "
  should be executed right? Here , why are they putting the even value in
  the "odd" array?
</p>
<p class="message">
  <span class="author">Rohith</span>: It it fault from your side or my
  connection was not good plz let me now One more question flex was the
  last topic everybody has covered.{" "}
</p>
<p class="message">
  <span class="author">Tony</span>: I am able to do it without any issues.
  Completed the first 2 exercises. I'll do the rest too ☺️
</p>
<button>Misty Everywhere</button>
</panel>
<panel language="javascript">
// Write code here
</panel>
</code>
<solution>
// Write code here
const welcomeHeading = document.getElementsByTagName("h1");
welcomeHeading[0].style.backgroundColor = "lightblue";
welcomeHeading[0].style.color = "snow";
welcomeHeading[0].style.fontSize = "64px";

const firstSectionDetails = document.querySelectorAll(".first-section-details");

firstSectionDetails.forEach(section => {
  section.style.color = "snow";
  section.style.backgroundColor = "cadetblue";
});

const joinWorkshopBtn = document.getElementsByTagName("button")[0];
joinWorkshopBtn.addEventListener("click", function() {
  welcomeHeading[0].textContent = "I joined the workshop";
});

const mistyEverywhereBtn = document.getElementsByTagName("button")[1];
mistyEverywhereBtn.addEventListener("click", function() {
  const authors = document.querySelectorAll(".author");
  for (let author of authors) {
    author.textContent = "Misty";
  };
});
</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2d8ias5ud-ywkjF1xRyV9Nbne1_sGQag) to join the community.
