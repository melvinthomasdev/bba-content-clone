Check if the **message** expresses happiness
for the day by checking the presence of
the words **happy** and **day** in the **message**.

- Find the index of the word **happy** and
  store the result in **indexOfHappy**.

- Fill in the condition
  inside the **if** statement to
  complete the exercise.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const message = "Wishing you a happy and joyful day!";

const indexOfhappy = ;

if () {
  console.log(`This message expresses happiness for the day. The word "happy" is present at index ${indexOfhappy}.`);
} else {
  console.log(`This message may not be about happiness or the day.`);
}
</code>

<solution>
const message = "Wishing you a happy and joyful day!";

const indexOfHappy = message.indexOf("happy");

if (message.includes("happy") && message.includes("day")) {
  console.log(`This message expresses happiness for the day. The word "happy" is present at index ${indexOfHappy}.`);
} else {
  console.log(`This message may not be about happiness or the day.`);
}
</solution>
</codeblock>
