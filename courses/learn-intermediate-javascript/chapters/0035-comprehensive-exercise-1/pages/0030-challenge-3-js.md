Given is a variable `message` which stores a string `Let me tell you the greatest story I ever heard.`
Create a program `comprehensiveExercise` which takes `message` and does the following operations:
1. Log the length of the variable message like `The length of [message] is [length]`.
2. Log the character at index 0 of the variable message like `The first character of [message] is [character]`.
3. Log the last character of message using length like `The last character of [message] is [character]`.
4. Log the index of word "tell" in message.
5. Log true or false based on whether the word "the" exist in message or not.
6. Log true or false based on whether the word "The" exist in message or not.
7. Check and log whether the word from index 12 to 15 is "you" or not
8. Check and log whether the last  character in message is "heard." or not
9. Log the message as `lowercase`.
10. Log the message as `UPPERCASE`.
11. Replace the word "greatest" to "worst" using newMessage variable, and re-assign the output to the variable `newMessage` and log it.
12. Log all the characters from the message variable
13. Split all the words in message and store it in a variable messageArray.
14. Log all the words of messageArray.
15. Log the message for first 6 characters of quote like this.
  The character at index 0 is 'L'
  The character at index 1 is 'e'
  The character at index 2 is 't'
  The character at index 3 is ' '
  The character at index 4 is 'm'
  The character at index 5 is 'e'

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here.
const comprehensiveExercise = () => {}
</code>

<solution>
const message = "Let me tell you the greatest story I ever heard.";

const comprehensiveExercise = (message) => {
	console.log(`The length of ${message} is ${message.length}`);

	console.log(`The first character of ${message} is ${message.charAt(0)}`);

	console.log(`The last character of ${message} is ${message.charAt(message.length-1)}`);

	console.log(message.indexOf("tell"));

	console.log(message.indexOf("the") === -1 ? false : true)

	console.log(message.indexOf("The") === -1 ? false : true)

	console.log(message.slice(12, 15) === "you" ? true : false)

	console.log(message.slice(-6) === "heard." ? true : false)

	console.log(message.toLowerCase())

	console.log(message.toUpperCase())

	const newMessage = message.replace("greatest", "worst")
	console.log(newMessage)

	for (const character of message) {
		console.log(character)
	}

	let messageArray = message.split(" ");
	for (const character of messageArray) {
		console.log(character)
	}
	for (let i = 0; i < 6; i++) {
		console.log(`The character at index ${i} is '${message[i]}'`)
	}
}

comprehensiveExercise(message);
</solution>
<testcases>
<caller>
comprehensiveExercise(newMessage);
</caller>
<testcase>
<i>
const newMessage = "Frankly, my dear, I don't give a damn"
</i>
</testcase>
<testcase>
<i>
const newMessage = "I'm gonna make him an offer he can't refuse."
</i>
</testcase>
<testcase>
<i>
const newMessage = "Toto, I've a feeling we're not in Kansas anymore."
</i>
</testcase>
</testcases>
</codeblock>
