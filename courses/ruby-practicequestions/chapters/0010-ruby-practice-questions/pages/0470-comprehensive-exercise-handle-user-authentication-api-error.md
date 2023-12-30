Complete the method definition given below.

Some of the users in the application are yet to do some major security updates, for such user's ids `third_party_auth_api` method will throw an error. Since we cannot update `third_party_auth_api` as of now, we need to handle the same in our function. Therefore in such a case, return a json object as shown below:

```
  {
    status: error,
    message: <message property as passed by the `third_party_auth_api`>
  }
```

The error received from `third_party_auth_api` will have a message prop, which is to be added in the return object. Return the result. (No need to alter the return statement already given in the method)

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def auth_user(user_id, user_name, third_party_auth_api)
  response = third_party_auth_api(user_id, "#{user_id}#{user_name}")
  response[:login_token] if response[:status] == "success"
end
</code>

<solution>
def auth_user(user_id, user_name, third_party_auth_api)
  response = method(third_party_auth_api).call(user_id, "#{user_id}#{user_name}")
  response[:login_token]
rescue Exception => e
  { status:"error", message: e.message }
end
</solution>

<testcases>
<caller>
def third_party_auth_api(user_id, concatinated_value)
  require "base64"

  if user_id % 13 == 0
    raise 'Please contact the system administrator'
  end

  token = Base64.encode64(concatinated_value)
  {
    status: "success",
    login_token: token
  }
end
puts auth_user(user_id, user_name, :third_party_auth_api)
</caller>
<testcase>
<i>
user_id = 533
user_name = 'Poirot'
</i>
</testcase>
<testcase>
<i>
user_id = 336
user_name = 'Nancy'
</i>
</testcase>
<testcase>
<i>
user_id = 79
user_name = 'Byomkesh'
</i>
</testcase>
<testcase>
<i>
user_id = 195
user_name = 'Sherlock'
</i>
</testcase>
</testcases>
</codeblock>
