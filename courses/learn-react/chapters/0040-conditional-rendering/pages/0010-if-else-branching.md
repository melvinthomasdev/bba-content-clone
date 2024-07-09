We may need to render different content depending on certain conditions. For those situations, we can use the JavaScript branching statements such as `if...else`, `? :`, `&&`.

Let's start with a simple example using the `if...else` statement. Suppose that we have a list of items. We want to render a star next to the favorite ones. Here's how you can achieve that:

<codeblock language="reactjs" type="lesson">
const Book = ({ isFavorite, name }) => {
  if (isFavorite) {
    return <li>{name} ⭐️</li>;
  }

  return <li>{name}</li>;
};

const BookList = () => (
  <ul>
    <Book isFavorite name="Psychology of Money" />
    <Book name="Rich dad, poor dad" />
  </ul>
);

export default BookList;
</codeblock>


In the example above, we conditionally render the star based on the value of the `isFavorite` prop. If `isFavorite` is `true`, the item is rendered with a star; otherwise, its rendered without the star.


Conditional rendering allows you to control what gets displayed based on specific conditions, making your React components more dynamic and flexible.
