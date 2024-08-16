In this challenge, you are given the `Status` component, which receives the `isOnline` prop. Your task is to modify the component to display "Online" if the `isOnline` prop is `true`, and "Offline" otherwise. To achieve this, utilize the ternary operator to efficiently express the condition. Update the `Status` component to obtain the desired outcome.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
// Replace STATUS with desired value
const Status = ({ name, isOnline }) => <p>{name} is STATUS</p>;

const UserStatusList = () => (

{" "}
<div>
  <Status isOnline={false} name="Oliver" />
  <Status isOnline name="Eve" />
</div>
);

export default UserStatusList;
</code>
<solution>
const Status = ({ name, isOnline }) => (
  <p>
    {name} is {isOnline ? "Online" : "Offline"}
  </p>
);

const UserStatusList = () => (

{" "}
<div>
  <Status isOnline={false} name="Oliver" />
  <Status isOnline name="Eve" />
</div>
);

export default UserStatusList;
</solution>
</codeblock>
