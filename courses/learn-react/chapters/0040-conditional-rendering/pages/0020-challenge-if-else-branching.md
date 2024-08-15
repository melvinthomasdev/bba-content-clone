In this exercise, you are provided with the `Car` component that receives the `speed` prop. Your task is to modify the component to display `Over the speed limit!` in red color if the `speed` is greater than 60, and `Under the speed limit` otherwise. Update the `Car` component to obtain the desired outcome.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Car = ({ speed }) => <p>Message should be displayed here.</p>;

const CarInfo = () => (
  <div>
    <Car speed={58} />
    <Car speed={90} />
    <Car speed={20} />
  </div>
);

export default CarInfo;
</code>
<solution>
const Car = ({ speed }) => {
  if (speed >= 60) {
    return <p style={{ color: "red" }}>Over the speed limit!</p>;
  }

  return <p>Under the speed limit</p>;
};

const CarInfo = () => (
  <div>
    <Car speed={58} />
    <Car speed={90} />
    <Car speed={20} />
  </div>
);

export default CarInfo;
</solution>
</codeblock>
