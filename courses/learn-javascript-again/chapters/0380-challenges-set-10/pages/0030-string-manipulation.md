Given a variable `message` a string value, as an argument.

Create a program `comprehensiveExercise`
which takes `message`  as a parameter
and does the following operations:

1. Log to the console the length of the variable message like `The length of [message] is [length]`.
2. Log to the console the character at index 0 of the variable message like `The first character of [message] is [character]`.
3. Log to the console the last character of message using length like `The last character of [message] is [character]`.
4. Log to the console the index of word "tell" in message.
5. Log to the console whether the word "the" exist in message or not, output should be a boolean (true or false).
6. Log to the console whether the word "The" exist in message or not, output should be a boolean (true or false).
7. Check and log to the console whether the word from index 12 to 15 is "you", output should be a boolean (true or false).
8. Check and log to the console whether the last  character in message is "heard.", output should be a boolean (true or false).
9. Log message as `lowercase` to the console.
10. Log message as `UPPERCASE` to the console.
11. Replace the word "greatest" to "worst" using newMessage variable, and re-assign the output to the variable `newMessage` and log it to the console.
12. Log all the characters from the message variable separately to the console as such:
'character-1'
'character-2'
'character-3'
13.  Split all the words in message and store it in a variable `messageArray` and log all the words of `messageArray` to the console.
14.  Log the message for first 6 characters of quote like this.
  `The character at index 0 is [character]`
  `The character at index 1 is [character]`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here.
const comprehensiveExercise = () => {}
</code>

<solution>
const comprehensiveExercise = (message) => {
	console.log(`The length of ${message} is ${message.length}`);

	console.log(`The first character of ${message} is ${message.charAt(0)}`);

	console.log(`The last character of ${message} is ${message.charAt(message.length-1)}`);

	console.log(message.indexOf("tell"));

	console.log(message.split(" ").includes("the"));

	console.log(message.split(" ").includes("The"));

	console.log(message.slice(12, 15) === "you");

	console.log(message.slice(-6) === "heard.");

	console.log(message.toLowerCase());

	console.log(message.toUpperCase());

	const newMessage = message.replace("greatest", "worst");
	console.log(newMessage);

  [...message].forEach((character) => {
    console.log(character);
  });

  message.split(" ").forEach((word) => {
    console.log(word);
  });

	const indices = [0, 1, 2, 3, 4, 5];
  indices.forEach((index) => {
    console.log(`The character at index ${index} is '${message[index]}'`);
  });
}
</solution>
<testcases>
<caller>
comprehensiveExercise(testMessage);
</caller>
<testcase>
<i>
const testMessage = "Frankly, my dear, I won't give it a thought."
</i>
</testcase>
<testcase>
<i>
const testMessage = "I'm gonna make him an offer he can't refuse."
</i>
</testcase>
<testcase>
<i>
const testMessage = "Toto, I've a feeling we're not in Kansas anymore."
</i>
</testcase>
</testcases>
</codeblock>
