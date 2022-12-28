[neetoUI](https://neetoui.netlify.app/) is a component library developed
in-house at `BigBinary`. It is built in a way to give developers a lot of
flexibility in terms of building a UI using `neetoUI` components.

At BigBinary we follow certain practices when using some of the components from
`neetoUI`. In this chapter we will talk about these best practices. It is worth
noting however that these are very generic things to keep in mind and these
practices can be bypassed as per the needs of the application. Since `neetoUI`
is built to be flexible and easy to use, it would defeat the purpose if we
impose strict rules for how the components should be used.

## Alert component vs Modal component

An [Alert](https://neetoui.netlify.app/?path=/story/overlays-alert--default)
component should be used for displaying an alert message before an action that
cannot be reversed. For example, deleting a record.

Whereas a
[Modal](https://neetoui.netlify.app/?path=/story/overlays-modal--default)
component should be used for displaying a dialog box with some information upon
performing an action. For example, upon updating the login credentials, the user
should be informed that after the update the user will be logged out of the
application. If need be then a form for confirmation password should be added in
the `Modal` itself for such actions.

## Best practices associated with the use of a Table component

- If the table cells only contain a string then the text should be left-aligned.
  If the cells contain a number or an icon then the cell content should be
  centre-aligned.

- Always use the `MenuHorizontal` icon from `neetoIcons` as the icon for a
  dropdown menu for actions like `edit` and `delete` inside a table cell. Do not
  use a `pencil` icon or a text as the title of the dropdown menu.

- The text for a sensitive action should be in `danger(red-500)` color. For
  example, a `delete` option inside the dropdown menu.

- Refrain from using `icons` or `buttons` inside the `list` items of a dropdown
  menu unless the application or the wireframe requires you to do so. This rule
  can be applied to dropdowns outside of a `Table` component as well.

- Make sure that the list items inside a dropdown menu are left-aligned.

## Ordering buttons

In the [Alert](https://neetoui.netlify.app/?path=/story/overlays-alert--default)
component there are two buttons. One button performs the action described in the
body of the alert. Let's call it the primary button. The other closes the alert.
Let's call it the secondary button. Both buttons are displayed in the same line.
The primary button is on the left and the secondary button is on the right

In similar cases, where there are two buttons with a primary action and a
secondary action displayed in the same line, keep the primary button on the left
and the secondary button on the right.
