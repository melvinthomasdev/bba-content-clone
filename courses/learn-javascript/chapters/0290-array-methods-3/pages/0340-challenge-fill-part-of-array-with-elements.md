Use `fill()` to change the values
in the given array. Change only the
values at indexes 3, 4 and 5. Replace
the values at these indexes with an
array: `["Position Vacated", "Email Unavailable", "Phone Number Unavailable"]`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>

const companyData = [
    ["Software Engineer", "johndoe@example.com", "+1234567890"],
    ["Data Scientist", "janesmith@example.com", "+0987654321"],
    ["Product Manager", "alicejohnson@example.com", "+1122334455"],
    ["UX Designer", "bobbrown@example.com", "+2233445566"],
    ["Marketing Specialist", "charliedavis@example.com", "+3344556677"],
    ["HR Manager", "dianawilson@example.com", "+4455667788"],
    ["Content Writer", "evelewis@example.com", "+5566778899"],
    ["Sales Executive", "frankmoore@example.com", "+6677889900"],
    ["Financial Analyst", "gracetaylor@example.com", "+7788990011"],
    ["System Administrator", "henrymartinez@example.com", "+8899001122"]
]

// Write your code below this line


// Write your code above this line
console.log(companyData);
</code>
<solution>
const companyData = [
    ["Software Engineer", "johndoe@example.com", "+1234567890"],
    ["Data Scientist", "janesmith@example.com", "+0987654321"],
    ["Product Manager", "alicejohnson@example.com", "+1122334455"],
    ["UX Designer", "bobbrown@example.com", "+2233445566"],
    ["Marketing Specialist", "charliedavis@example.com", "+3344556677"],
    ["HR Manager", "dianawilson@example.com", "+4455667788"],
    ["Content Writer", "evelewis@example.com", "+5566778899"],
    ["Sales Executive", "frankmoore@example.com", "+6677889900"],
    ["Financial Analyst", "gracetaylor@example.com", "+7788990011"],
    ["System Administrator", "henrymartinez@example.com", "+8899001122"]
]

// Write your code below this line

companyData.fill(["Position Vacated", "Email Unavailable", "Phone Number Unavailable"], 3, 6);

// Write your code above this line
console.log(companyData);
</solution>
</codeblock>
