Reusable components are those React components that can be used multiple times
in your application. They need to be generic enough so that they are free from
any business logic.

If a UI component is used across multiple components, then it is better to
extract the generic logic of that UI component into a separate component. Doing
so means you will only have to declare it once and you can import the component
wherever you need to use it.

Let us understand reusability with the help of an example of the button element.
A button is one the most common UI elements. A reusable button component is
shown below:

```jsx
import React from "react";

import PropTypes from "prop-types";

const noop = () => {};

const Button = props => {
  const {
    loading,
    icon = null,
    type = "button",
    label = "",
    onClick = noop,
    disabled = false,
    className = "",
    ...otherProps
  } = props;

  const handleClick = e => {
    if (!loading) onClick(e);
  };

  const Icon =
    typeof icon == "string"
      ? () => <i className={icon} />
      : icon || React.Fragment;

  return (
    <div>
      <button
        type={type}
        onClick={handleClick}
        disabled={loading || disabled}
        className={className}
        {...otherProps}
      >
        <Icon />
        {loading ? "Loading..." : label}
      </button>
    </div>
  );
};

Button.propTypes = {
  type: PropTypes.string,
  label: PropTypes.string,
  loading: PropTypes.bool,
  onClick: PropTypes.func,
  disabled: PropTypes.bool,
  className: PropTypes.string,
};

export default Button;
```

As you can see, the `Button` component will render a button element which can be
reused across multiple components and the attributes specific to each button can
be passed as props.

Component reusability allows you to have a highly scalable and consistent React
application. Code reusability will also make your application easier to
maintain. Rather than updating the UI in multiple places, you will only need to
update a single component.

## Things to keep in mind while creating a reusable component

- It is important that you do not put logic which is specific to a particular
  feature or component inside a reusable component. For example, the `Button`
  component in the above code doesn't contain any style. Different buttons could
  have different styles and to accommodate that we should pass in the
  `className` as a prop rather than creating a whole new component for the
  different style.

- Pass a default value for the props. It is not necessary that all the props
  used inside the component should be passed while using it. Default values for
  props will prevent any errors that could be caused because of a missing prop
  value.

- Use `PropTypes` for type-checking.

- Allow extra props other than the declared props to be passed to the reusable
  components. In the `Button` component, any props other than the ones declared
  can be accessed as a key of the `otherProps` object.

- Reusable components only make sense if that particular component is being used
  more than once. For example, consider a scenario where you have a subheader UI
  component in your application. Subheaders are very common and hence they are
  often reusable but it doesn't make sense to extract the subheader to another
  component if it is only needed once.
