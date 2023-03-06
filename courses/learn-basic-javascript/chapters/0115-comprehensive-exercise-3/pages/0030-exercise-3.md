- Given is an array of objects, where each object stores details of a wedding guest.
```
[
  {
    "name": "Sam",
    "age": "42",
    "meal-preference": "veg"
  },
  {
    "name": "Patrice",
    "age": "35",
    "meal-preference": "non-veg"
  },
  {
    "name": "John",
    "age": "28",
    "meal-preference": "veg"
  },
  {
    "name": "Jack",
    "age": "55",
    "meal-preference": "mixed"
  },
  {
    "name": "Harry",
    "age": "64",
    "meal-preference": "non-veg"
  },
  {
    "name": "Juliet",
    "age": "23",
    "meal-preference": "mixed"
  }
]
```
- Print `X will have veg meal.`, for the guest who prefers veg.
- Print `Y will have steak.`, for the guest who prefers non-veg.
- Print `Z will have a combo meal.`, for those who prefer mixed meal.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
</code>

<solution>
const guestList = [{
		"name": "Sam",
		"age": "42",
		"meal-preference": "veg"
	},
	{
		"name": "Patrice",
		"age": "35",
		"meal-preference": "non-veg"
	},
	{
		"name": "John",
		"age": "28",
		"meal-preference": "veg"
	},
	{
		"name": "Jack",
		"age": "55",
		"meal-preference": "mixed"
	},
	{
		"name": "Harry",
		"age": "64",
		"meal-preference": "non-veg"
	},
	{
		"name": "Juliet",
		"age": "23",
		"meal-preference": "mixed"
	}
]

const mealPreference = (guestArray) => {
	//Using for..of loop
	for (const guest of guestArray) {
		const mealPreference = guest["meal-preference"];
		//Using switch statement
		switch (mealPreference) {
			case "mixed":
				console.log(`${guest["name"]} will have a combo meal. \n`);
				break;
			case "non-veg":
				console.log(`${guest["name"]} will have steak. \n`);
				break;
			default:
				console.log(`${guest["name"]} will have veg meal. \n`);
				break;
		}
	}
};
mealPreference(guestList);
</solution>
<testcases>
<caller>
mealPreference(newGuestList);
</caller>
<testcase>
<i>
const newGuestList = [{
		"name": "Olivia",
		"age": "42",
		"meal-preference": "non-veg"
	},
	{
		"name": "Noah",
		"age": "21",
		"meal-preference": "veg"
	},
	{
		"name": "Elijah",
		"age": "41",
		"meal-preference": "mixed"
	},
	{
		"name": "Mia",
		"age": "23",
		"meal-preference": "veg"
	},
	{
		"name": "Evelyn",
		"age": "56",
		"meal-preference": "non-veg"
	},
	{
		"name": "Lucas",
		"age": "18",
		"meal-preference": "non-veg"
	}
]
</i>
</testcase>
<testcase>
<i>
const newGuestList = [{
		"name": "Benjamin",
		"age": "38",
		"meal-preference": "mixed"
	},
	{
		"name": "William",
		"age": "31",
		"meal-preference": "veg"
	},
	{
		"name": "Emma",
		"age": "20",
		"meal-preference": "mixed"
	},
	{
		"name": "Liam",
		"age": "35",
		"meal-preference": "non-veg"
	},
	{
		"name": "Eva",
		"age": "56",
		"meal-preference": "veg"
	},
	{
		"name": "Ed",
		"age": "18",
		"meal-preference": "non-veg"
	}
]
</i>
</testcase>
<testcase>
<i>
const newGuestList = [{
		"name": "Matt",
		"age": "37",
		"meal-preference": "mixed"
	},
	{
		"name": "Sam",
		"age": "22",
		"meal-preference": "veg"
	},
	{
		"name": "Frodo",
		"age": "19",
		"meal-preference": "mixed"
	},
	{
		"name": "Kat",
		"age": "25",
		"meal-preference": "non-veg"
	},
	{
		"name": "Eva",
		"age": "56",
		"meal-preference": "veg"
	},
	{
		"name": "Murry",
		"age": "44",
		"meal-preference": "non-veg"
	}
]
</i>
</testcase>
</testcases>
</codeblock>
