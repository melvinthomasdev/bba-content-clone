Update the locations where the marketing campaigns have already run, based on the a list of location Ids. Also add few of new locations which were missed earlier, right after the second location in the list.

1. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const updateCampaignDetails = (campainDetails, completedLocationIds, newLocations) => {
// write your code here
}
</code>

<solution>
const updateCampaignDetails = (campainDetails, completedLocationIds, newLocations) => {
  campainDetails = campainDetails.map(location => {
      if (completedLocationIds.includes(location.id)) {
        return {...location, completed: true};
      } else {
        return location;
      }
    });
    campainDetails.splice(2,0,newLocations);
    return JSON.stringify(campainDetails);
}
</solution>

<testcases>
<caller>
console.log(updateCampaignDetails(campainDetails, completedLocationIds, newLocations));
</caller>
<testcase>
<i>
const completedLocationIds = [1, 3];
const campainDetails = [
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
const completedLocationIds = [1, 3];
const campainDetails = [
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
</testcases>
</Editor>