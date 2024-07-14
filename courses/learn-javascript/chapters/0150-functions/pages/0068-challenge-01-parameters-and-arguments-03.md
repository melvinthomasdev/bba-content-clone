We have a function **showCapitalCity** 
that takes a country's name and 
its capital city's name and puts 
on the screen the relation between the two. 

For example, if the country name is 
France and the capital city provided is 
Paris, the statement of the screen will 
be **Paris is the capital of France.**

Run the function once and provide it 
the country name as **New Zealand** and 
the capital city as **Wellington**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
// Write your code below this line

const showCapitalCity = (countryName, capitalName) => {
  console.log(`${capitalName} is the capital of ${countryName}.`);
}
</code>

<solution>
// Write your code below this line

const showCapitalCity = (countryName, capitalName) => {
  console.log(`${capitalName} is the capital of ${countryName}.`);
}

showFullName("New Zealand", "Wellington");
</solution>
</codeblock>
