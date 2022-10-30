Create a reminder function, which returns a reminder text from the message passed to it.

1. Go through the test cases, to get an idea of expected keywords.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function extractReminderText(message) {
// your code here
}
</code>

<solution>
function extractReminderText(message) {
  const arrayOfWords = message.split(" ");
  const reminderKeywords = ["reminder", "remind", "reminders"];
  const connectionWords = ["me", "about", "to"];
  let reminderKeywordFound = false;
  let reminder = arrayOfWords.reduce((accumulator, currentValue, index) => {
    const value = currentValue.toLowerCase();
    if (reminderKeywordFound) {
      return connectionWords.includes(value)
        ? ""
        : `${accumulator} ${arrayOfWords[index]}`;
    }
    if (reminderKeywords.includes(value)) {
      reminderKeywordFound = true;
    }
    return "";
  }, "");
  reminder = reminder.trim();
  return (reminder.charAt(0).toUpperCase() + reminder.slice(1));
}
</solution>

<testcases>
<caller>
console.log(extractReminderText(message));
</caller>
<testcase>
<i>
const message = 'Remind me when I get home to check the mail';
</i>
</testcase>
<testcase>
<i>
const message = 'I will call you back bye Hey remind me to call John back';
</i>
</testcase>
<testcase>
<i>
const message = 'Hey AI can you remind me to buy groceries';
</i>
</testcase>
<testcase>
<i>
const message = 'Remind office party';
</i>
</testcase>
<testcase>
<i>
const message = `Set Remind Game Night at Joe's place`;
</i>
</testcase>
<testcase>
<i>
const message = 'Hi there remind me about the meeting with Raj';
</i>
</testcase>
<testcase>
<i>
const message = `Reminders sent thank you card`
</i>
</testcase>
<testcase>
<i>
const message = `Do one thing remind me about the assignment`
</i>
</testcase>
</testcases>
</Editor>