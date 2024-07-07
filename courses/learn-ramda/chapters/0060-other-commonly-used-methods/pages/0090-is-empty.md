The `isEmpty` function checks if an array or object is empty.

For example, let assume we are in a profile page, and when user click 'Update profile' we want
to call update api only if some data is changed. Using plain JavaScript we can achieve it like this

```js
const updateProfile = async profile => {
  if (Object.keys(profile).length > 0) {
    await fetch("person/update", { person });
  } else {
    alert("No details are updated");
  }
};
```

Now if you use `isEmpty` from Ramda, the above code can be done like below.

```js
const updateProfile = async profile => {
  if (!isEmpty(profile)) {
    await fetch("person/update", { person });
  } else {
    alert("No details are updated");
  }
};
```
