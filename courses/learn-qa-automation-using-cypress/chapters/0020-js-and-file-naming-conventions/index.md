## JavaScript Conventions

If you are using [Visual Studio Code](https://code.visualstudio.com/) then
download and install these two extensions.
  - [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  - [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

Some people follow indentation of 4 spaces. But in BigBinary, we follow
indentation of **2 spaces** consistently.

Here are the conventions we would be following regarding the naming of variables and their usage.

* Variables should always be in lower camel case. e.g.  `const firstName = Oliver`
* When declaring the variables prefer using `const` instead of `let`.
* `let` can be used when we are modifying the variable. If we are modifying the
object or an array `const` can still be used instead of `let`.

## Comments

1. Commenting involves placing human readable descriptions inside test files
   describing what the test is about.

```javascript
it("should change articles state", () => {
    // verify cancel button functionality of published state modal
    ...
});
```

2. Sometimes the tests can be quite large and long-winded that its actual
   function and use is not quite so apparent from the code itself. In such cases
   adding a comment describing the same would improve code readability vastly.
3. When writing a comment we must ensure that it is meaningful and we must
   always use lowercase alphabets and keep some space after comment.

```javascript
//Add first client steps      => incorrect
// add first client steps     => correct
```

## File Naming Conventions

1. The name of the file must convey the test suite name. e.g. If we are adding
   test case file for login, name of file should be: **_login.spec.js_**
2. All the spec files should be stored in **_e2e_** folder.
3. Follow `JavaScript` conventions for naming the files(i.e **_lowerCamelCase_**). e.g.
   If we are creating spec file for creating a customer, the name of spec file
   should be: **_createCustomer.spec.js_**
4. The **texts** and **selectors** folder should be stored in **_constants_**
   folder. Their corresponding file names should also be in
   **_lowerCamelCase_**.\
    e.g. Selectors:- **_login.js_** contained within `constants/selectors`.\
    e.g. Texts:- **_members.js_** contained within `constants/texts`.

## Function arguments conventions

Consider there is function which accepts more than 2 arguments. The challenge with functions like these is that we need to remember the order of their parameters.
Additionally, we might not always need to provide values for all parameters, which can lead to situations where we have to pass `null` values just to maintain the parameter order.

```js
function login(email, password="welcome", isAdmin){
  ...
  ...
}

login("sam@example.com","welcome", true)
```

In this case, even if I just want to pass the `email` and `isAdmin` parameters,
I have to pass the password also. So the better approach in this case is to
define the argument as an object.

```js
const login = (args = {}) => {
  const {email, password="welcome", isAdmin} = args
  ...
  ...
}

login({ email:"sam@example.com", isAdmin:true })
```

Now the code is more readable and we can pass only the needed parameters.
