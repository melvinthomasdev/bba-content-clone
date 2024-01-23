Create a reminder function, which adds the given reminder to the specific day the user wants, based on the message passed.

1. All the input sentences will be in lowercase.
2. Create a `Map` object with names of days as keys, and an array of reminder strings as values.
3. Convert the `Map` object to an array, then return the output.
4. Use the `extractReminderText()` given as an input to extract the reminder text from the message passed.
5. Remove the day keyword from the message. (tomorrow, today, monday etc)
6. Go through the test cases, to get an idea of expected keywords.
7. The week starts on Sunday.
8. Try out the question on Saturday, and make sure your solution works!

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const setReminder = ({ messageArray, extractReminderText }) => {
  // your code here
}
</code>

<solution>
const setReminder = ({ messageArray, extractReminderText }) => {
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
  daysOfWeek.map(day => {
    reminders.set(day, []);
  });

  const formatAndSet = ({ day, keyword, currentValue, newValue }) => {
    formattedNewValue = newValue.replace(keyword, "");
    reminders.set(day, [...currentValue, formattedNewValue]);
  };

  const handleDayKeywords = ({ keyword, text }) => {
    const dayKeywords = {
      everyday: ({ text, keyword }) => {
        daysOfWeek.map(day => {
          formatAndSet({
            day,
            keyword,
            currentValue: reminders.get(day),
            newValue: text,
          });
        });
      },
      today: ({ text, keyword }) => {
        const number = new Date().getDay();
        const today = daysOfWeek[number];
        formatAndSet({
          day: today,
          keyword,
          currentValue: reminders.get(today),
          newValue: text,
        });
      },
      tomorrow: ({ text, keyword }) => {
        const number = new Date().getDay();
        const tomorrow = number === 6 ? daysOfWeek[0] : daysOfWeek[number + 1];
        formatAndSet({
          day: tomorrow,
          keyword,
          currentValue: reminders.get(tomorrow),
          newValue: text,
        });
      },
    };
    dayKeywords[keyword]({ text, keyword });
  };

  messageArray.forEach(message => {
    const reminderText = extractReminderText(message);
    const arrayOfWords = reminderText.split(" ");
    const dayKeywords = ["everyday", "today", "tomorrow"];
    arrayOfWords.forEach(value => {
      if (daysOfWeek.includes(value)) {
        if (reminders.has(value)) {
          const currentValue = reminders.get(value);
          formatAndSet({
            day: value,
            keyword: value,
            currentValue,
            newValue: reminderText,
          });
        }
      } else if (dayKeywords.includes(value)) {
        handleDayKeywords({ keyword: value, text: reminderText });
      }
    });
  });
  return [...reminders];
};
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
console.log(setReminder({ messageArray, extractReminderText }));
</caller>
<testcase>
<i>
const messageArray = ['hey there can you remind me to buy groceries tomorrow', 'hi, remind to take the medicine everyday'];
</i>
</testcase>
<testcase>
<i>
const messageArray = ['do one thing remind me about the assignment tomorrow', 'reminder game night today', 'remind me about the weekly show and tell on monday'];
</i>
</testcase>
<testcase>
<i>
const messageArray = ['remind to water the plants everyday', 'remind me to call mom today'];
</i>
</testcase>
<testcase>
<i>
const messageArray = ['remind me about meeting with the team tomorrow', 'remind me about the conference call on wednesday'];
</i>
</testcase>
</testcases>
</codeblock>