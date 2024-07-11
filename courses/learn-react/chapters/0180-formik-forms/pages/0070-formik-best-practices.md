### When should we disable the "Save changes" and "Cancel" buttons

Let's consider a scenario, where we have a form with some input fields along with `Save changes` and `Cancel` buttons like so:

<image>form-with-buttons.png</image>

At BigBinary, we follow a convention not to disable the `Cancel` button, regardless of the situation. The reason is that the cancel button will be used to close the pane/modal or go back to the previous page in addition to resetting the form content. The user should be able to perform these actions irrespective of the form state.

However, for the `Save changes` button, the default state should be disabled. It should only become enabled when the form becomes `dirty`. Furthermore, we will disable the `Save changes` button when the form is in a submitting state.

To ensure consistency throughout the application, we can utilize the [ActionBlock](https://github.com/bigbinary/neeto-ui/blob/main/src/components/formik/ActionBlock.jsx) component from `neetoUI`. This component exports both the `Save changes` and `Cancel` buttons, while also managing their disabled state internally.

### When to do form validations

At BigBinary, we follow a practice of eager form validation, where the first validation triggers only when the user leaves the input field and then if the input is invalid, we aggressively show inline validations until the input is valid. Additionally, validation should also triggered upon clicking the `Save Changes` button.

This approach is preferred because, in the case of lengthy forms, if validation only occurs upon submitting the form and an error arises, it becomes challenging to identify which input field triggered the error unless we add a custom logic to automatically scroll to the field that caused the error. Furthermore, in scenarios involving complex validation mechanisms, displaying validation errors solely at the time of submission can lead to poor user experience.

This is how the eager validation works:

<image>formik-validation.gif</image>
