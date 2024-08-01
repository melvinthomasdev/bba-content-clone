To run the code, you can click on the **Run code** button in the code editor and that would run the code.

However, you can also run the code without using the mouse.

If you are using Windows, then press **Ctrl** and then hit **Enter** to run the code.

If you are using Mac, then press **Command** and then hit **Return** to run the code.

By pressing the **ESC** key, you can take the focus out of the editor, and using the **E** key you can re-focus into the editor.

If you are using Windows, then use **Ctrl + Shift + i** to format the code

If you are using Mac, then use **Cmd + Shift + i** to format the code

Now try running the code given below **without** clicking on the **Run code** button.

<codeblock language="reactjs" type="lesson">
<code>
const Introduction = props => <h1>My name is {props.name}</h1>;

const App = () => (
  <div>
    <h1>Hello 👋</h1>
    <Introduction name="John Doe" />
  </div>
);

export default App;
</code>
</codeblock>
