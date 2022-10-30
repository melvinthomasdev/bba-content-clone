Some of the users in the application are yet to do some major security updates, for such user's Ids`thirdPartyAuthAPI` function will throw an error. Since we cannot update `thirdPartyAuthAPI` as of now, we need to handle the same in our function. Therefore in such a case, return a json object.

```
  {
      status: error,
      message: <message property as passed by the `thirdPartyAuthAPI`>
  }
```

1. The error received from 'thirdPartyAuthAPI' will have a message prop, which is to be added in the return object.
2. Return stringified object. (No need to alter the return statement already given in the function)

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const authUser = (userId, userName, thirdPartyAuthAPI) => {
  const response = thirdPartyAuthAPI(userId, userId+userName);
  if (response.status === 'success') {
    return response.loginToken;
  }
}
</code>

<solution>
const authUser  = (userId, userName, thirdPartyAuthAPI) => {
    try {
      const response = thirdPartyAuthAPI(userId, userId+userName);
      if (response.status === 'success') {
          return response.loginToken;
      }
    } catch (error) {
      return JSON.stringify({
        status: 'error',
        message: error.message
      });
    }
}
</solution>

<testcases>
<caller>
const thirdPartyAuthAPI = (userId, concatinatedValue) => {
    if(userId % 13 == 0) {
      throw new Error('Please contact the sytem administrator');
    }
    const loginToken = concatinatedValue.split("").reduce(function(a,b){a=((a<<5)-a)+b.charCodeAt(0);return a&a},0);
    return {
        status: 'success',
        loginToken
      };
}
console.log(authUser(userId, userName, thirdPartyAuthAPI));
</caller>
<testcase>
<i>
userId = 533;
userName = 'Poirot';
</i>
</testcase>
<testcase>
<i>
userId = 336;
userName = 'Nancy';
</i>
</testcase>
<testcase>
<i>
userId = 79;
userName = 'Byomkesh';
</i>
</testcase>
<testcase>
<i>
userId = 195;
userName = 'Sherlock';
</i>
</testcase>
</testcases>
</Editor>