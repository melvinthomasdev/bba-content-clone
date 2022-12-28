Complete the method definition given below.

Given a string `message` as input, the method should return the reminder text.

Go through the test cases, to get an idea of expected keywords to parse, remove and keep. The output should be in sentence case (First letter of first word in capital).

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def extract_reminder_text(message)
 # write your code here
end
</code>

<solution>
def extract_reminder_text(message)
  reminder_words_regex = /reminder |remind |reminders /
  connection_words_regex = /me |about |to /
  message_after_reminder = message.downcase.split(reminder_words_regex)[1].strip
  return message_after_reminder.capitalize unless (message_after_reminder =~ connection_words_regex)

  message_after_reminder.split(connection_words_regex).last.capitalize
end
</solution>

<testcases>
<caller>
puts extract_reminder_text(message)
</caller>
<testcase>
<i>
message = 'Remind me when I get home to check the mail'
</i>
</testcase>
<testcase>
<i>
message = 'I will call you back bye Hey remind me to call John back';
</i>
</testcase>
<testcase>
<i>
message = 'Remind office party'
</i>
</testcase>
<testcase>
<i>
message = 'Hey AI can you remind me to buy groceries'
</i>
</testcase>
<testcase>
<i>
message = "Set Remind Game Night at Joe's place"
</i>
</testcase>
<testcase>
<i>
message = 'Hi there remind me about the meeting with Raj'
</i>
</testcase>
<testcase>
<i>
message = 'Reminders send thank you card'
</i>
</testcase>
<testcase>
<i>
message = 'Please remind me about the assignment'
</i>
</testcase>
</testcases>
</codeblock>