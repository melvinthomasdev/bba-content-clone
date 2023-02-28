When multiple components work together to have a shared state and handle logic
together, they are called compound components. You've probably already
encountered it when using HTML components like the `table` or the `select` tag
shown below:

```html
<label>
  Current Status :
  <select name="userStatus">
    <option value="active">Active</option>
    <option value="afk">Away from keyboard</option>
    <option value="meeting">In a meeting</option>
    <option value="inactive">Inactive</option>
  </select>
</label>
```

The `select` tag and the `option` tag work together to create a dropdown menu.
This communication between the parent and child is what defines a compound
component.

This pattern of coding is intuitive to read and also helps avoid prop drilling.
