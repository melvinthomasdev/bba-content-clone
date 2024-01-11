Add a rest prop named `otherProps` to the `Input` component and spread it to the HTML input tag.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Input = ({ label, type }) => (
  <p>
    <label>{label}:</label>
    <br />
    <input name={label} type={type} />
  </p>
);

const Form = () => (
  <form>
    <Input label="Name" placeholder="Enter your name" type="text" />
    <Input disabled label="Email address" type="email" />
  </form>
);

export default Form;
</code>
<solution>
const Input = ({ label, type, ...otherProps }) => (
  <p>
    <label>{label}:</label>
    <br />
    <input name={label} type={type} {...otherProps} />
  </p>
);

const Form = () => (
  <form>
    <Input
      label="Name"
      placeholder="Enter your name"
      type="text"
    />
    <Input
      disabled
      label="Email address"
      type="email"
    />
  </form>
);

export default Form;
</solution>
</codeblock>
