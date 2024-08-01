Complete the method definition given below.

`campaign_details` is an array of hashes that contains the details of a campaign. Each hash contains the following keys: "name", "state", "id" and "completed". `new_locations` is an array of hashes that contains the details of new locations, where each hash has the same keys as the hashes in `campaign_details`. `completed_location_id` is an array of ids of locations where the campaign has been completed.

Given `campaign_details`, `new_locations` and `completed_location_id`, the method should add the `new_locations` to existing `campaign_details`. For each location in the updated `campaign_details`, the method should set the `completed` key to `true` if the location's id is in `completed_location_id`. The method should finally return the updated `campaign_details`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def update_campaign_details(campaign_details, completed_locations_id, new_locations)
  # Write your code here
end
</code>

<solution>
def update_campaign_details(campaign_details, completed_locations_id, new_locations)
  campaign_details.push(*new_locations)
  campaign_details.each do |campaign|
    campaign[:completed] = true if completed_locations_id.include? campaign[:id]
  end

  campaign_details
end
</solution>

<testcases>
<caller>
puts update_campaign_details(campaign_details, completed_locations_id, new_locations)
</caller>
<testcase>
<i>
completed_locations_id = [1, 3]
campaign_details = [
  {
    name: "Aizawl",
    state: "Mizoram",
    id: 1,
    completed: false
  },
  {
    name: "Kochi",
    state: "Kerala",
    id: 2,
    completed: false
  },
  {
    name: "Nagercoil",
    state: "Tamil Nadu",
    id: 3,
    completed: false
  },
]

new_locations = [
  {
    name: "Kurnool",
    state: "Andhra Pradesh",
    id: 4,
    completed: false
  },
  {
    name: "Warangal",
    state: "Telangana",
    id: 5,
    completed: false
  }
]
</i>
</testcase>
<testcase>
<i>
completed_locations_id = [1, 3]
campaign_details = [
  {
    name: "Thrissur",
    state: "Kerala",
    id: 1,
    completed: false
  },
  {
    name: "Alandur",
    state: "Tamil Nadu",
    id: 2,
    completed: false
  },
  {
    name: "Agartala",
    state: "Tripura",
    id: 3,
    completed: false
  },
]

new_locations = [
  {
    name: "Tawang",
    state: "Arunachal Pradesh",
    id: 4,
    completed: false
  },
  {
    name: "Kohima",
    state: "Nagaland",
    id: 5,
    completed: false
  }
]
</i>
</testcase>
</testcases>
</codeblock>
