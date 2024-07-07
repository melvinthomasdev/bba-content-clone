Update the locations where the marketing campaigns have already run, based on the list of location Ids. Also add a few new locations which were missed earlier, right after the second location in the list.

For example:
```js
Input:
completedLocationIds = [1, 2, 3];
campaignDetails = [
  {
    id: 1,
    name: "London",
    state: "England",
    completed: false,
  },
  {
    id: 2,
    name: "Paris",
    state: "France",
    completed: false,
  },
  {
    id: 3,
    name: "Rome",
    state: "Italy",
    completed: false,
  },
];
newLocations = [];

Output:
[
  {
    id: 1,
    name: "London",
    state: "England",
    completed: true,
  },
  {
    id: 2,
    name: "Paris",
    state: "France",
    completed: true,
  },
  {
    id: 3,
    name: "Rome",
    state: "Italy",
    completed: true,
  },
]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const updateCampaignDetails = ({ campaignDetails, completedLocationIds, newLocations }) => {
  // write your code here
}
</code>

<solution>
const updateCampaignDetails = ({ campaignDetails, completedLocationIds, newLocations }) => {
  const updatedCampaignDetails = campaignDetails.map(location => {
    if (!completedLocationIds.includes(location.id))
      return location;

    return {...location, completed: true};
  });
  updatedCampaignDetails.splice(2,0,newLocations);
  return updatedCampaignDetails;
}
</solution>

<testcases>
<caller>
console.log(updateCampaignDetails({ campaignDetails, completedLocationIds, newLocations }));
</caller>
<testcase>
<i>
const completedLocationIds = [1, 3];
const campaignDetails = [
  {
    id: 1,
    name: "Aizawl",
    state: "Mizoram",
    completed: false,
  },
  {
    id: 2,
    name: "Kochi",
    state: "Haryana",
    completed: false,
  },
  {
    id: 3,
    name: "Nagercoil",
    state: "Tamil Nadu",
    completed: false,
  },
];
const newLocations = [
  {
    id: 4,
    name: "Kurnool",
    state: "Andhra Pradesh",
    completed: false,
  },
  {
    id: 5,
    name: "Warangal",
    state: "Telangana",
    completed: false,
  },
];
</i>
</testcase>
<testcase>
<i>
const completedLocationIds = [1, 2];
const campaignDetails = [
  {
    id: 1,
    name: "Thrissur",
    state: "Kerala",
    completed: false,
  },
  {
    id: 2,
    name: "	Alandur",
    state: "Tamil Nadu",
    completed: false,
  },
  {
    id: 3,
    name: "Agartala",
    state: "Tripura",
    completed: false,
  },
];
const newLocations = [
  {
    id: 4,
    name: "Tawang",
    state: "Arunachal Pradesh",
    completed: false,
  },
  {
    id: 5,
    name: "Kohima",
    state: "Nagaland",
    completed: false,
  },
];
</i>
</testcase>
<testcase>
<i>
const completedLocationIds = [];
const campaignDetails = [
  {
    id: 1,
    name: "Delhi",
    state: "Delhi",
    completed: false,
  },
  {
    id: 2,
    name: "Mumbai",
    state: "Maharashtra",
    completed: false,
  },
];
const newLocations = [
  {
    id: 3,
    name: "Chennai",
    state: "Tamil Nadu",
    completed: false,
  },
  {
    id: 4,
    name: "Kolkata",
    state: "West Bengal",
    completed: false,
  },
];
</i>
</testcase>
<testcase>
<i>
const completedLocationIds = [1, 2];
const campaignDetails = [
  {
    id: 1,
    name: "Seattle",
    state: "Washington",
    completed: false,
  },
  {
    id: 2,
    name: "San Francisco",
    state: "California",
    completed: false,
  },
];
const newLocations = [];
</i>
</testcase>
</testcases>
</codeblock>
