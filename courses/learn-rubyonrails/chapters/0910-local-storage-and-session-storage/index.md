For the longest time cookies were the only way to maintain state. Then HTML5
came. HTML5 provides two more ways of storing data on the browser - localStorage
and sessionStorage.

## Local storage

[localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
stores the data with no expiration date. It means the data will **not** be
deleted when the browser is closed, and the data will be available the next day,
next week, or even next year.

In chrome browser we can see the contents of localStorage by opening
`Developer tools > Application > Local Storage`.

Setting, retrieving and deleting data from localStorage is pretty easy:

```javascript {
localStorage.setItem("favoriteColor", "black");
localStorage.favoriteColor;
localStorage.removeItem("favoriteColor");
```

localStorage provides at least 5MB of data storage across all major web
browsers. This a lot more than the 4KB (maximum size) that we can store in
cookies.

localStorage data can be read by any JavaScript code. If a hacker is able to
execute JavaScript code on our web application then the hacker will be able to
steal all the data stored in the localStorage.

## Session storage

Data stored in
[sessionStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage)
gets cleared when the page session ends. A page session lasts for as long as the
browser is open and survives over page reloads and restores. Closing a
tab/window ends the session and clears objects in sessionStorage:

```javascript {
// Save data to sessionStorage
sessionStorage.setItem("key", "value");

// Get saved data from sessionStorage
let data = sessionStorage.getItem("key");

// Remove saved data from sessionStorage
sessionStorage.removeItem("key");

// Remove all saved data from sessionStorage
sessionStorage.clear();
```

There is **nothing to commit** in this chapter since all we had done was
learning the basics of localStorage and sessionStorage.
