​
The `bind()` method is used to
create a function that invokes a
specific function
and
provides the object that
the `this` keyword inside the function
should refer to.

<codeblock language="javascript" type="lesson">
<code>
const admin = { name: "Sam Smith" };

function displayName() {
  console.log(`Hi. I am ${this.name}.`);
}

displayName.bind(admin);
</code>
</codeblock>

In the example given above,
we do not get an output because,
unlike `call()` and `apply()` methods,
`bind()` does not invoke the function.
`bind()` returns a function
and
we need to invoke that returned function.

<codeblock language="javascript" type="lesson">
<code>
const admin = { name: "Sam Smith" };

function displayName() {
  console.log(`Hi. I am ${this.name}.`);
}

const displayAdminName = displayName.bind(admin);

displayAdminName();
</code>
</codeblock>

In the above example,
`displayName.bind(admin)` returns a function
inside which,
the `this` keyword always refers to
the object passed
as the first argument in the `bind()` call.
In the above example,
the `this` keyword inside the
`displayAdminName()` function
will always refer to `admin`.

<codeblock language="javascript" type="lesson">
<code>
function displayName() {
  console.log(`Hi. I am ${this.name}.`);
}

const admin = {
  name: "Sam Smith",
};

const displayAdminName = displayName.bind(admin);

const member = {
  name: "Oliver Smith",
  displayName,
  displayAdminName,
};

member.displayName();
member.displayAdminName();
</code>
</codeblock>

In the example above,
both `displayName` and `displayAdminName` methods
belong to the `member` object.
However, we have fixed what
the `this` keyword refers to
inside the `displayAdminName` function
and
it refers to the `admin` object
even though it's a method of the `member` object.

We can also fix the arguments
to be passed to the function
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Oliver Smith",
};

function displayMeeting(meetingTitle, meetingTime) {
  console.log(`${this.name} has a meeting - "${meetingTitle}" at ${meetingTime}`);
}

const displayProjectMeeting = displayMeeting.bind(user, "Project Discussion", "12PM, today");
const displayBudgetMeeting = displayMeeting.bind(user);
const displayClientMeeting = displayMeeting.bind(user, "Client Meeting");

displayProjectMeeting();
displayBudgetMeeting("Budget Review", "06PM, today");
displayClientMeeting("10PM, today");
</code>
</codeblock>In the example above:

- `displayProjectMeeting` has both it's arguments passed by the `bind` method.

- `displayBudgetMeeting` needs both arguments to be passed on invocation.

- `displayClientMeeting` has it's first argument passed by the `bind` method,
  and needs the second argument to be passed on invocation.
