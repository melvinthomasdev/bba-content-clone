In this exercise, you have a list of ingredients used in a recipe. Your task is to display a marker (**Non-veg**) next to the ingredients that are non-vegetarian as follows:

<image>ingredients_list.png</image>

Update the `Ingredient` component to obtain the desired outcome.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Ingredient = ({ name, isNonVeg }) => <li>{name}</li>;

const Recipe = () => (
  <ul>
    <Ingredient isNonVeg={false} name="Tomato" />
    <Ingredient isNonVeg name="Chicken" />
    <Ingredient isNonVeg={false} name="Onion" />
  </ul>
);

export default Recipe;
</code>
<solution>
const Ingredient = ({ name, isNonVeg }) => (
  <li>
    {name} {isNonVeg && "(Non-veg)"}
  </li>
);

const Recipe = () => (
  <ul>
    <Ingredient isNonVeg={false} name="Tomato" />
    <Ingredient isNonVeg name="Chicken" />
    <Ingredient isNonVeg={false} name="Onion" />
  </ul>
);

export default Recipe;
</solution>
</codeblock>
