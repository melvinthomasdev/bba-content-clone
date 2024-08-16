You are working on a user management
system for an online platform.

You have a user object representing
a user in the system.
The user object contains properties
such as name, login status, role, plan,
and
fullAdminPackage.
Your task is to write code that checks the user's login status, role, plan, and fullAdminPackage to determine the access level to the admin panel.

- Check if the user is logged in using the isLogged property. If the user is logged in, log to the console: "User has logged in."
- Based on the user's role, plan, and fullAdminPackage, log the appropriate message regarding access to the admin panel:
  - If the user's role is Admin and they are on the Premium plan, log: "Displaying the Admin Panel with all the admin features."
  - If the user's role is Admin, they are on the Plus plan, and have the fullAdminPackage set to true, log: "Displaying the Admin Panel with all the admin features."
  - If the user's role is Admin, they are on the Plus plan, but do not have the fullAdminPackage set to true, log: "Displaying the Admin Panel with only the Plus plan admin features."
  - If the user's role is Admin and they are on the Free plan, log: "Displaying the Admin Panel with limited admin features."
  - If the user's role is Standard, log: "Access denied."

Use the provided user object for this challenge.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const user = {
  name: "Sam",
  isLogged: true,
  role: "Admin",
  plan: "Premium",
  fullAdminPackage: true,
}

// Write your code below

</code>

<solution>
const user = {
  name: "Sam",
  isLogged: true,
  role: "Admin",
  plan: "Premium",
  fullAdminPackage: true,
}

// Write your code below
if (user.isLogged) {
  console.log("User has logged in.");

  if (user.role === "Admin") {
    if (user.plan === "Premium") {
      console.log("Displaying the Admin Panel with all the admin features.");
    } else if (user.plan === "Plus" && user.fullAdminPackage) {
      console.log("Displaying the Admin Panel with all the admin features.");
    } else if (user.plan === "Plus" && !user.fullAdminPackage) {
      console.log("Displaying the Admin Panel with only the plus with limited admin features.");
    } else if (user.plan === "Free") {
      console.log("Displaying the Admin Panel with limited admin features.");
    }
  } else {
    console.log("Access denied.");
  }
} else {
  console.log("Please log in to access the admin panel.");
}
</solution>
</codeblock>
