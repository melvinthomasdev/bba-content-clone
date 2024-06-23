Until now, our primary focus has been on presentational components, which don't require extensive user interactions. Let's now pivot toward components dedicated to gathering user input and transmitting it for system processing or storage. These components, known as **Forms**, will be our primary focus in this lesson. We'll delve into React's native form handling techniques, and see how libraries like Formik and Yup can manage forms more effectively.

## Key facets of a form

Form handling typically entails these key units:

1. **Input fields**: Input fields serve as the entry points for users to provide information. These fields come in various types such as text inputs, checkboxes, radio buttons, dropdowns, and more, each tailored to capture specific types of data.
2. **State management**: State management ensures that as users interact with the form, the application captures and manages these changes in real-time. This dynamic handling of data lets users see immediate updates as they fill out the form.
3. **Validation**: Validation ensures the accuracy and completeness of the entered data. It encompasses verifying mandatory fields, validating correct formats like emails or dates, and applying constraints or rules to ensure data integrity. Validation often comes with error messages to help users correct any input discrepancies.
4. **Submission handling**: Upon completion, the submission handling process manages the processing of form data. This could involve sending data to servers for further processing, triggering specific actions based on the user's input, or storing the information within the application's database.

Let us understand these aspects in more detail using an example. We will build a basic contact form that accepts name, email, and message from users, with the aforementioned points in mind. Let's start by defining the input fields. We will use `form`, `input` and `textarea` elements to create the form.

<codeblock language="reactjs" type="lesson" >
<code>
const ContactForm = () => {
  return (
    <form>
      <div>
        <label>Name:</label>
        <input
          type="text"
          name="name"
        />
      </div>
      <div>
        <label>Email:</label>
        <input
          type="email"
          name="email"
        />
      </div>
      <div>
        <label>Message:</label>
        <textarea
          name="message"
        />
      </div>
      <button type="submit">Submit</button>
    </form>
  );
};

const App = () => {
  return <ContactForm />
};

export default App;
</code>
</codeblock>

Now, let's associate each input field with a key in the state object variable `formData`. This object will be updated using the `handleChange` function whenever the user inputs data into the fields. The `value` attribute of each input field element will be bound to its respective state in the `formData` state object. This ensures that the input fields reflect the current state and any changes made by the user are captured.

<codeblock language="reactjs" type="lesson" packages="ramda" foldLines="15-44">
<code>
import { useState } from "react";

const ContactForm = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });

  const handleChange = e => {
    const { name, value } = e.target;
    setFormData(R.assoc(name, value));
  };

  return (
    <form>
      <div>
        <label>Name:</label>
        <input
          type="text"
          name="name"
          value={formData.name}
          onChange={handleChange}
        />
      </div>
      <div>
        <label>Email:</label>
        <input
          type="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
        />
      </div>
      <div>
        <label>Message:</label>
        <textarea
          name="message"
          value={formData.message}
          onChange={handleChange}
        />
      </div>
      <button type="submit">Submit</button>
    </form>
  );
};

const App = () => {
  return <ContactForm />
};

export default App;
</code>
</codeblock>

Our next task is to add validations. At BigBinary, we prefer [eager validation](https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2Fa9ldtg9kx0371.gif) since it provides immediate feedback to users as they interact with the form.

We will validate the form fields using the `validateField` function whenever the user inputs data into the fields or navigates away from them. It will check if the required fields are empty and if the `email` field follows a valid format using a simple regex check. When validation fails for any field, an error message will be stored in the `errors` state object corresponding to that field. Error messages will be displayed against each input field if there are validation errors. Additionally, we'll include `noValidate` in the `form` element to bypass default HTML form validations during submission.

<codeblock language="reactjs" type="lesson" packages="ramda" foldLines="44-79">
<code>
import { useState } from "react";

const ContactForm = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });

  const [errors, setErrors] = useState({
    name: "",
    email: "",
    message: "",
  });

  const validateField = (name, value) => {
    let error = "";
    if (name === 'name' && !value.trim()) {
      error = "Name is required";
    } else if (name === 'email' && (!value.trim() || !/^\S+@\S+\.\S+$/.test(value))) {
      error = value.trim() ? "Invalid email format" : "Email is required";
    } else if (name === 'message' && !value.trim()) {
      error = "Message is required";
    }

    return error;
  };

  const performValidation = e => {
    const { name, value } = e.target;
    const error = validateField(name, value);
    setErrors(R.assoc(name, error));
  };

  const handleChange = e => {
    const { name, value } = e.target;
    setFormData(R.assoc(name, value));
    performValidation(e);
  };

  return (
    <form noValidate>
      <div>
        <label>Name:</label>
        <input
          type="text"
          name="name"
          value={formData.name}
          onBlur={performValidation}
          onChange={handleChange}
        />
        {errors.name && <span>{errors.name}</span>}
      </div>
      <div>
        <label>Email:</label>
        <input
          type="email"
          name="email"
          value={formData.email}
          onBlur={performValidation}
          onChange={handleChange}
        />
        {errors.email && <span>{errors.email}</span>}
      </div>
      <div>
        <label>Message:</label>
        <textarea
          name="message"
          value={formData.message}
          onBlur={performValidation}
          onChange={handleChange}
        />
        {errors.message && <span>{errors.message}</span>}
      </div>
      <button type="submit">Submit</button>
    </form>
  );
};

const App = () => {
  return <ContactForm />
};

export default App;
</code>
</codeblock>

Finally, we'll define the `handleSubmit` function to handle form submission. This function will be invoked when the form is submitted. To avoid the default form behavior, which reloads the page, we'll use `e.preventDefault()`. Then, we will call `validateField` on all form fields to validate them upon submission. If the form is valid, the logic for form submission is executed.

<codeblock language="reactjs" type="lesson" packages="ramda">
<code>
import { useState } from "react";

const ContactForm = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });

  const [errors, setErrors] = useState({
    name: "",
    email: "",
    message: "",
  });

  const validateField = (name, value) => {
    let error = "";
    if (name === 'name' && !value.trim()) {
      error = "Name is required";
    } else if (name === 'email' && (!value.trim() || !/^\S+@\S+\.\S+$/.test(value))) {
      error = value.trim() ? "Invalid email format" : "Email is required";
    } else if (name === 'message' && !value.trim()) {
      error = "Message is required";
    }

    return error;
  };

  const performValidation = e => {
    const { name, value } = e.target;
    const error = validateField(name, value);
    setErrors(R.assoc(name, error));
  };

  const handleChange = e => {
    const { name, value } = e.target;
    setFormData(R.assoc(name, value));
    performValidation(e);
  };

  const handleSubmit = e => {
    e.preventDefault();

    let newErrors = {};
    Object.entries(formData).forEach(([name, value]) => {
      const error = validateField(name, value);
      if (error) {
        newErrors = { ...newErrors, [name]: error };
      }
    });
    setErrors(newErrors);

    const isValid = Object.values(newErrors).every(error => error === "");

    if (isValid) {
      // Perform form submission logic here
      alert(`Form submitted with data: ${JSON.stringify(formData)}`);
    }
  };

  return (
    <form onSubmit={handleSubmit} noValidate>
      <div>
        <label>Name:</label>
        <input
          type="text"
          name="name"
          value={formData.name}
          onBlur={performValidation}
          onChange={handleChange}
        />
        {errors.name && <span>{errors.name}</span>}
      </div>
      <div>
        <label>Email:</label>
        <input
          type="email"
          name="email"
          value={formData.email}
          onBlur={performValidation}
          onChange={handleChange}
        />
        {errors.email && <span>{errors.email}</span>}
      </div>
      <div>
        <label>Message:</label>
        <textarea
          name="message"
          value={formData.message}
          onBlur={performValidation}
          onChange={handleChange}
        />
        {errors.message && <span>{errors.message}</span>}
      </div>
      <button type="submit">Submit</button>
    </form>
  );
};

const App = () => {
  return <ContactForm />
};

export default App;
</code>
</codeblock>

## Limitations of native form handling in React

Using only built-in React features to handle forms, as we did in the `ContactForm` example, can lead to a lot of repetitive code and complexity:

- **Complex State Management**: Manually managing form state necessitates creating and updating state variables for each form field, resulting in verbosity and potential synchronization issues. For instance, in the `ContactForm`, tracking changes for `name`, `email`, and `message` led to verbose code.

- **Validation Logic**: Implementing validation without external libraries involves crafting custom validations for individual fields, managing error messages, and manually checking input values. In the `ContactForm`, we added manual validation in the `validateField` function to ensure non-empty names, valid email formats, and non-blank messages.

- **Form Submission Handling**: Manual form handling can blur the separation between form validation and submission processes, requiring explicit validation before submission. In the `ContactForm`, calling the `validateField` function on each of the form fields within the `handleSubmit` event handler exemplifies this intertwined nature.

- **Error Handling and Display**: Displaying validation errors alongside form fields involves additional logic for conditional rendering. In the `ContactForm`, managing error messages for each field using the `errors` state and conditional rendering added complexity to the codebase.

These limitations highlight the need for libraries to encapsulate the boilerplate code. There are several libraries that make form management easier in React. Two standout examples are [Formik](https://www.npmjs.com/package/formik) for handling forms and [Yup](https://www.npmjs.com/package/yup) for validation. In the next section, we'll see how these tools make form handling more efficient.

## Form handling with Formik and Yup

Formik and Yup streamline the form-building process by cutting down on boilerplate code and substantially reducing code verbosity. Here's an overview of how they accomplish this:

- Formik centralizes form state management, reducing boilerplate code by automatically handling form values, errors, touched fields, and form submission.

- Yup schema allows for declarative and concise form validation, simplifying the process of defining and executing validation rules. Formik provides various validation strategies, allowing developers to choose how and when validation should occur.

- Formik decouples form submission logic from validation. Upon successful validation, Formik's `onSubmit` handler is solely responsible for executing form submission logic.

- Formik offers built-in error handling mechanisms that seamlessly integrate with the form fields, providing a more user-friendly way to display validation errors.

In the upcoming lessons, we'll explore the specifics of managing forms using Formik and implementing validation with Yup.
