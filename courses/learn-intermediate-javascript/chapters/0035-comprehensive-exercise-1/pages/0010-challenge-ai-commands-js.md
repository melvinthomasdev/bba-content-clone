- Create a function `getTaskFromCommand` 
which accepts 2 parameters, `keyword` 
and `command`.
- The keyword will be present only ONCE
in the command string.
- Return the task in `command` string
which follows the `keyword`.

For example:
```
Keyword = "Hey Buzz"
String = "Hey Buzz remind me to go to infinity and beyond"
```
Result from the above example is `remind me to go to infinity and beyond`.


<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here.
</code>

<solution>
const getTaskFromCommand = (command, keyword) => {
	const commandStringArray = command.split(keyword + ' ');
	return commandStringArray[1];
};
</solution>
<testcases>
<caller>
console.log(getTaskFromCommand(testCommand, testKeyword));
</caller>
<testcase>
<i>
let testCommand = "Yeah, let me set the reminder. Hey Google remind me to create the JS Intermediate Challenge.";
let testKeyword = "Hey Google";
</i>
</testcase>
<testcase>
<i>
const testCommand = "Wait, I might forget about the match. Hey Siri set an Alarm for 8:30 PM about the football match";
const testKeyword = "Siri";
</i>
</testcase>
</testcases>
</codeblock>
