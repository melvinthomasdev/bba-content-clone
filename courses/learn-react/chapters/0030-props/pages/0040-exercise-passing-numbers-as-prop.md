The `RandomNumber` component in the following code snippet returns a random number between 0 and a given `limit`. Use `RandomNumber` to display a random number from the `LuckyNumber` component. Set the `limit` as 10.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const RandomNumber = ({ limit }) => {
  const randomNumber = Math.floor(Math.random() * limit);

  return <b>{randomNumber}</b>;
};

const LuckyNumber = () => (
  <div>
    <h1>Your Lucky number</h1>
    Replace this line with RandomNumber component.
  </div>
);

export default LuckyNumber;
</code>
<solution>
const RandomNumber = ({ limit }) => {
  const randomNumber = Math.floor(Math.random() * limit);

  return <b>{randomNumber}</b>;
};

const LuckyNumber = () => (
  <div>
    <h1>Your Lucky number</h1>
    <RandomNumber limit={10} />
  </div>
);

export default LuckyNumber;
</solution>
</codeblock>
