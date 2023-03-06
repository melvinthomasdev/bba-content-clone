- Create a function which takes 2 arguments, one is a keyword and another a command.
- The keyword should be present only once in the command string.
- Return the task in command string after the keyword.

For example:
```
Keyword = "Hey Buzz"
String = "Hey Buzz remind me to go to infinity and beyond"
```
Result from the above example is `remind me to go to infinity and beyond`.

Use the following to test the function.
```
keyword = "Alexa"
command = "Alexa remind me to Call Arun tomorrow"

```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here.
</code>

<solution>
const getTaskFromCommand = (command, keyword) => {
	const commandString = command.split(keyword + ' ');
	console.log(commandString[commandString.length-1]);
};

const keyword = "Alexa";
const command = "Alexa remind me to Call Arun tomorrow";


getTaskFromCommand(command, keyword);
</solution>
<testcases>
<caller>
getTaskFromCommand(newCommand, newKeyword);
</caller>
<testcase>
<i>
const newKeyword = "Hey Google";
const newCommand = "Yeah, let me set the reminder. Hey Google remind me to create the JS Intermediate Challenge."
</i>
</testcase>
<testcase>
<i>
const newKeyword = "Siri";
const newCommand = "Wait, I might forget about the match. Hey Siri set an Alarm for 8:30 PM about the football match"
</i>
</testcase>
</testcases>
</codeblock>
