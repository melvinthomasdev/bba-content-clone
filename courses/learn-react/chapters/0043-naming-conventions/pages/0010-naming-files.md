React component and their filenames should have the same "PascalCased" name.

If you have a file containing a component called `ContactTable` like so :

```jsx
const ContactTable = () => {
  // rest of the component
};
```
Do name it `ContactTable.jsx` so that any reader will easily be able to understand exactly which component lies within from the folder structure itself.

Refrain from naming the file `Table.jsx`, `Contacts.jsx`.

However, If the filename is `index.jsx` then the component name should be the same as the folder name.

For example, consider a folder structure like so:

```js
UserCard/
├── index.jsx
├── Header.jsx
├── Footer.jsx
└── utils.js
```

This would be correct assuming the `index.jsx` file contains a `UserCard` component like so :

```jsx
const UserCard = () => {
  //rest of the component
};
```

The file extension for any files containing JSX should be `.jsx` to help autocompleters, linters and any readers trying to figure out whether a given file contains JSX.

Helper files that contain utility functions should preferably be named `utils.js` or `utils.jsx`.

If it needs to be broken down into smaller files, you can create a `utils` folder and add the files within.