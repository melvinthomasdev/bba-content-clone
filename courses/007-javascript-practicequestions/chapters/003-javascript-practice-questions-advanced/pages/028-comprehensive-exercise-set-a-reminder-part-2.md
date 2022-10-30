Create a reminder function, which adds the given reminder to the specific day the user wants, based on the message passed.

1. All the inputs sentences will be in lower case.
2. Create a `Map object` with names of days as keys, and array of reminder strings as values.
3. Convert the Map object to an array, then JSON.stringify and return the output
4. Use the `extractReminderText()` given as an input to extract the reminder text from the message passed.
5. Remove the day keyword from the message. (tomorrow, today, monday etc)
6. Go through the test cases, to get an idea of expected keywords.
7. Week starts at Sunday.
8. Try out the question on Saturday, and make sure your solution works!

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function setReminder(messageArray, extractReminderText) {
// your code here
}
</code>

<solution>
function setReminder(messageArray, extractReminderText) {
  const reminders = new Map();
  const daysOfWeek = [
    "sunday",
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
  ];
  daysOfWeek.map((day) => {
    reminders.set(day, []);
  });
  function formatAndSet(day, keyword, currentValue, newValue) {
    formattedNewValue = newValue.replace(keyword, "");
    reminders.set(day, [...currentValue, formattedNewValue]);
  }
  function handleDayKeywords(keyword, text) {
    const dayKeywords = {
      everyday: (text, keyword) => {
        daysOfWeek.map((day) => {
          formatAndSet(day, keyword, reminders.get(day), text);
        });
      },
      today: (text, keyword) => {
        const number = new Date().getDay();
        const today = daysOfWeek[number];
        formatAndSet(today, keyword, reminders.get(today), text);
      },
      tomorrow: (text, keyword) => {
        const number = new Date().getDay();
        const tomorrow = number === 6 ? daysOfWeek[0] : daysOfWeek[number + 1];
        formatAndSet(tomorrow, keyword, reminders.get(tomorrow), text);
      },
    };
    dayKeywords[keyword](text, keyword);
  }
  for (const message of messageArray) {
    const reminderText = extractReminderText(message);
    const arrayOfWords = reminderText.split(" ");
    const dayKeywords = ["everyday", "today", "tomorrow"];
    for (const value of arrayOfWords) {
      if (daysOfWeek.includes(value)) {
        if (reminders.has(value)) {
          formatAndSet(value, value, reminders.get(value), reminderText);
          break;
        }
      } else if (dayKeywords.includes(value)) {
        handleDayKeywords(value, reminderText);
        break;
      }
    }
  }
  return JSON.stringify([...reminders]);
}
</solution>

<testcases>
<caller>
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
console.log(setReminder(messageArray, extractReminderText));
</caller>
<testcase>
<i>
const messageArray = ['hey there can you remind me to buy groceries tomorrow', 'hi, remind to take the medicine everyday'];
</i>
</testcase>
<testcase>
<i>
const messageArray = ['do one thing remind me about the assignment tomorrow', 'reminder game night today', 'remind me about the weekly show and tell on monday']
</i>
</testcase>
</testcases>
</Editor>