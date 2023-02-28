It is important to use a state hook to store response data. When a request
promise has been completed, the component needs to be re-rendered and relevant
actions need to be taken. Otherwise, the changes won't reflect on the UI and the
user won't realize anything has happened.

Also, once the response data is sent from the server side, avoid manipulating
the response data before storing it. Any further manipulation should be done
after storage.

Every response could potentially be used by multiple components that need to
process the original data in different ways.

Take this incorrect example of a dashboard that displays both a `Table` and a
`Select` component that needs

```jsx
import { useState, useEffect } from "react"
import { formatMembersForSelect } from "./utils"

const Dashboard = () => {
  const [members, setMembers] = useState([]);

  const fetchMembers = async () => {
    try {
      const { members } = await axios.get("api/v1/members");
      setMembers(formatMembersForSelect(members));
      // ^ This is incorrect, formatting for one component on setState could cause bugs when you expand the code
    } catch () {
      //rest of the code to handle errors
    }
  };

  useEffect(() => fetchMembers(), [])

  return (
    <div className="dashboardContainer">
      <Table rows={members} /> //Table receives data formatted for the Select component which is wrong
      <Select options={members} />
    </div>
  );
};
```

As you can see, the `members` data being passed to the `Table` has already been
formatted for the `Select` component and thus could be wrong. The correct thing
to do here is to store the response data in the state and format it as needed.
This also allows us to format the data for the table if needed.

```jsx
import { useState } from "react"
import { formatMembersForSelect, formatMembersForTable } from "./utils"

const Dashboard = () => {
  const [members, setMembers] = useState([]);

  const fetchMembers = async () => {
    try {
      const { members } = await axios.get("api/v1/members");
      setMembers(members); //Just set the state with raw response data
    } catch () {
      //rest of the code to handle errors
    }
  };

  useEffect(() => fetchMembers(), [])

  return (
    <div className="dashboardContainer">
      <Table
        rows={formatMembersForTable(members)} //This also allows us to format the table data if needed
      />
      <Select
        options={formatMembersForSelect(members)}
      />
    </div>
  );
};
```
