Here is a table specifying the props for a component for rendering Avatar:

|      Name     |   Type   | Default Value  |              Description               |
|---------------|----------|----------------|----------------------------------------|
|   isActive    |  boolean |                | Indicates whether the user is online or offline. Used to display a `lightgreen` color border if active or `lightgrey` color border if inactive. |
|     size      |  number  |      90        | Sets the size of the avatar. The value is used to set the width and height of the image tag. |
|     shape     |  string  |    "circle"    | Sets the border radius of the avatar. Possible values: "square", "rounded", "circle". |
|   imageUrl    |  string  |                | URL of the image to be displayed in the avatar. |
|   userName    |  string  |    "Oliver"    | Used to display alt text if the image URL is broken. |

Your task is to modify the codeblock based on the above requirements.

The output should look like the image given below.

<image>props-challenge-output.png</image>

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Avatar = ({ isActive, size, shape, imageUrl, userName }) => {
  const borderRadius = { square: 0, rounded: 10, circle: size / 2 };

  return (
    <img
      src={imageUrl}
      style={{
        borderStyle: "solid",
        borderWidth: 3,
      }}
    />
  );
};

const App = () => <Avatar imageUrl="https://i.pravatar.cc/150?img=2" />;

export default App;
</code>
<solution>
const Avatar = ({ isActive, size, shape, imageUrl, userName }) => {
  const borderRadius = { square: 0, rounded: 10, circle: size / 2 };

  const borderColor = isActive ? "lightgreen" : "lightgrey";

  return (
    <img
      alt={userName}
      height={size}
      src={imageUrl}
      width={size}
      style={{
        borderRadius: borderRadius[shape],
        borderColor,
        borderStyle: "solid",
        borderWidth: 3,
      }}
    />
  );
};

const App = () => (
  <Avatar
    isActive
    imageUrl="https://i.pravatar.cc/150?img=2"
    shape="circle"
    size={90}
    userName="Oliver"
  />
);

export default App;
</solution>
</codeblock>
