Complete the method definition given below.

`messages` is an array of sentences. Given `messages` and a method `extract_method`, the method `set_reminder` should map extracted reminders to days of the week based on the message passed.

1. All the input sentences will be in lower case.
2. Create a hash with names of days as keys, and array of reminder strings as values.
3. Use the `extract_method` given as an input to extract the reminder text from the message passed.
4. You can call the method as follows `extract_method.call(message)`
5. Remove the day keyword from the message.(tomorrow, today, monday etc)
6. Go through the test cases, to get an idea of expected keywords.
7. Week starts at Sunday.

<br/>
<codeblock language="ruby" type="exercise" testMode="multipleInput" cache="false">
<code>
def set_reminder(messages, extract_reminder_text)
 # Write your code here
end
</code>

<solution>
DAYS_OF_WEEK = %w[sunday monday tuesday wednesday thursday friday saturday]
CURRENT_WDAY = Time.now.wday

def set_reminder(messages, extract_method)
  day_keywords = %w[today tomorrow yesterday everyday]
  reminders = Hash[DAYS_OF_WEEK.map{|day| [day, []]}]
  messages.each do |message|
    days, message = find_and_remove_day(message, day_keywords)
    next unless days
    reminder = extract_method.call(message)
    days.map{|day| reminders[day] << reminder}
  end
  reminders
end

def find_and_remove_day(message, day_keywords)
  (day_keywords + DAYS_OF_WEEK).each do |keyword|
    if keyword_present?(message, keyword)
      return [keyword_to_days(keyword), remove_keywords(message, keyword)]
    end
  end
  false
end

def keyword_to_days(keyword)
  case keyword
  when 'today'
    [DAYS_OF_WEEK[CURRENT_WDAY]]
  when 'tomorrow'
    [DAYS_OF_WEEK[CURRENT_WDAY + 1]]
  when 'yesterday'
    [DAYS_OF_WEEK[CURRENT_WDAY - 1]]
  when 'everyday'
    DAYS_OF_WEEK
  else
    [keyword]
  end
end

def keyword_present?(message, keyword)
  message.downcase.include?(keyword)
end

def remove_keywords(message, keyword)
  message.gsub(keyword, '').gsub('on','').strip
end
</solution>

<testcases>
<caller>
def extract_reminder_text(message)
  reminder_words_regex = /reminder |remind |reminders /
  connection_words_regex = /me |about |to /
  message_after_reminder = message.downcase.split(reminder_words_regex)[1].strip
  return message_after_reminder.capitalize unless (message_after_reminder =~ connection_words_regex)

  message_after_reminder.split(connection_words_regex).last.capitalize
end
puts set_reminder(messages, method(:extract_reminder_text))
</caller>
<testcase>
<i>
messages = ["hey there can you remind me to buy groceries tomorrow", "hi, remind to take the medicine everyday"]
</i>
</testcase>
<testcase>
<i>
messages = ["do one thing remind me about the assignment tomorrow", "reminder about game-night today", "remind me about the weekly show and tell on monday"]
</i>
</testcase>
</testcases>
</codeblock>
