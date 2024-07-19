Eve, Sam and Renu are competing as a team for India in the Olympics relay race.
Each has to do 1 lap then pass the baton.

The average speed of each of them are given in the variables
`averageSpeedEve`, `averageSpeedSam`, and `averageSpeedRenu` respectively.

Store the average speed to a variable called `averageSpeed`,
and then log it to the console in the format:

`The Average speed of Team India was [Average Speed] meters per second.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const averageSpeedEve = 42;
const averageSpeedSam = 43;
const averageSpeedRenu = 39;

//Write code here

</code>
<solution>
const averageSpeedEve = 42;
const averageSpeedSam = 43;
const averageSpeedRenu = 39;

const averageSpeed = (averageSpeedEve + averageSpeedSam + averageSpeedRenu)/3;

console.log(`The Average speed of Team India was ${averageSpeed} meters per second.`);
</solution>
</codeblock>
