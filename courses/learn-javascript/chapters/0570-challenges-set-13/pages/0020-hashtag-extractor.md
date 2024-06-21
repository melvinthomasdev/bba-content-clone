
Write a function called `extractHashtags` that accepts a single string parameter, tweet.

1. The function should find all hashtags in the tweet. A hashtag is defined as a # symbol followed by one or more word characters (letters, numbers, and underscores).

2. Each found hashtag should be added to an array.

3. Finally, the function should display the array of hashtags to the console.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code below this line

</code>
<solution>
// Write code below this line
const extractHashtags = (tweet) => {
  const pattern = /#\w+/g;
  const hashtags = tweet.match(pattern);
  console.log(hashtags || []);
};
</solution>
<testcases>
<caller>
extractHashtags(inputTweet);
</caller>
<testcase>
<i>
const inputTweet = "Learning #JavaScript is fun! #coding #developer";
</i>
<o>
["#JavaScript", "#coding", "#developer"]
</o>
</testcase>
<testcase>
<i>
const inputTweet = "No hashtags here!";
</i>
</testcase>
<testcase>
<i>
const inputTweet = "#SingleHashtag at the start.";
</i>
</testcase>
<testcase>
<i>
const inputTweet = "Multiple hashtags in one #tweet, including #numbers123 and #underscores_are_fun!";
</i>
</testcase>
<testcase>
<i>
const inputTweet = "Edge cases: #, ##, and #!";
</i>
</testcase>
<testcase>
<i>
const inputTweet = "Special #characters? #are #not #part #of #hashtags!";
</i>
</testcase>
</testcases>
</codeblock>
