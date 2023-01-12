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

## PropTypes and Usage

In C programming, to define a function, you are required to specify the type of each function parameter in the function definition. This ensures that only the correct type of arguments are passed to any given function.

But in JavaScript, you need not specify the parameter type while writing a function. There are several ups and downs to this, one of the downs being difficulty in tracking some errors caused by type mismatch of the arguments passed and the required type.

`PropTypes` are React's mechanism to add type checking to component props.

The above `Button` component implements `PropTypes`. Toward the end of the code, an object is assigned to `Button.propTypes`. The keys of the object are the props passed to the `Button` component and the values are the validators for the corresponding prop.
To use `PropTypes` validators in a component, first of all, `PropTypes` must be imported from `prop-types`.

Below are the validators for the basic data types:

- `PropTypes.any`: The prop can be of any data type
- `PropTypes.bool`: The prop should be a Boolean
- `PropTypes.number`: The prop should be a number
- `PropTypes.string`: The prop should be a string
- `PropTypes.func`: The prop should be a function
- `PropTypes.array`: The prop should be an array
- `PropTypes.object`: The prop should be an object
- `PropTypes.symbol`: The prop should be a symbol

Then assign `Component.propTypes` an object with props as keys and validators as values. Here the `Component` is `Button`, hence `Button.propTypes`.

Enforcing `PropTypes` validation helps in debugging errors due to mismatches between the expected type and the type of props received.

On passing a prop of unexpected type, a console log is created, that warns the developer of the mismatch.

For example, consider a state variable `isButtonDisabled` being passed to the `Button` component as `<Button disabled={isButtonDisabled} />` and `PropTypes` was not used. Also, assume that somewhere in the code before the developer had accidentally set the value of `isButtonDisabled` as `"false"` instead of `false`. i.e. `disabled="false"` in effect.

Since a string value is truthy in JavaScript the `Button` will remain disabled, with no errors thrown. Developers might be able to figure out the issue once they go through the last assignment of `isButtonDisabled`.

But if `PropTypes` was used like in the code above, the console log would read

```Warning: Failed prop type: Invalid prop `disabled` of type `string` supplied to `Button`, expected `boolean`.```

This would help the developer figure out that the `disabled` prop was passed the wrong value, even without looking at the code.

**Note**: It is to be noted that you are required to add `PropTypes` in reusable components only. i.e. Let's say you created a custom table in a large component and you felt it would be better to move the custom table to a separate component file and import it into the parent component. You might be tempted to add `PropTypes` validations to this new component. But you shouldn't.

You might argue that the custom table takes a couple of props, so isn't it a good idea to use `PropTypes` validation?

The reason why you shouldn't add such validations is that you could spend the time writing such validation to work elsewhere. Since the component is used only once, writing code carefully is just enough.

From a technical standpoint, there are no harmful implications to this addition but the time that might be spent on writing all the prop types might be a premature optimization that we are doing right now.

Stressing this point again - **use `PropTypes` validations in reusable components only.**

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
