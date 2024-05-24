Before we learn about configuring Playwright, we need to have a brief idea about environment variables.

Environment variables or ENV variables are dynamic values that are set outside of an application and are accessible to it during runtime.
They provide a way to customize and configure the behavior of an application without modifying its code. Environment
variables are typically set at the operating system level or by deployment platforms and are accessed by the
application's code through an API provided by the programming language or runtime environment.

These variables are useful for storing sensitive information like API keys, database credentials, or configuration settings
that may vary between different environments (such as development, testing, and production). Using environment variables
enhances security by keeping sensitive information out of source code repositories and allows for greater flexibility.

In many programming languages and frameworks, accessing environment variables is straightforward, often through built-in
functions or libraries provided by the language runtime. Developers can read and use these variables within their applications
to adjust behavior dynamically based on the environment in which the application is running. The following command sets the `TEST_ENV`
environment variable to `development` in the local terminal.

```bash
# Unix (Linux and Mac)(Bash)
export TEST_ENV=development

# Windows (Powershell)
set TEST_ENV=development
```

While we can access the values set in these variables, there is a major issue with this approach. The environment variables set using
this method are volatile. This means that these variables are only accessible during the terminal session in which these variables
were defined. So if we close the terminal or restart the machine, we have to redeclare all these variables from scratch which can
be a cumbersome task. This issue can be solved using the `.env` files.

A `.env` file allows us to define the variables required for an environment as a file on the secondary memory (disc). This allows us
to retain the contents of the variables across sessions. Each variable is added as an entry on a new line statement with the variable name
on the left-hand side and the value of the right-hand side separated by an equals(`=`) symbol.

```
# .env

ENV_VARIABLE_ONE=value1
ENV_VARIABLE_TWO=value2
```

In env definition given above, we can notice a few things:

1. There are NO spaces between the variable name, value and the assignment operator. This is because some parsers tend to interpret the
   space as a part of the value and can hinder with the way the env variable is read in the programming language or framework. This means
   that defining.
   Eg: Configuring `ENV_VARIABLE= value1` might result in the language or framework interpreting the value of the environment
   variable as `" value1"` instead of `"value1"`.

2. We do not enclose the values of the environment variables in quotes (`"`) even if the value is a string. This is again due to the same
   reason as the first point. Depending on the parser that parses these variables, the quotes may be considered to be part of the value.
   Eg: Configuring `ENV_VARIABLE="value1` might result in the language or framework interpreting the value of the environment
   variable as `"\"value1\""` instead of "value".

3. When defining multi-line values for ENV variables, we SHOULD enclose them within quotes (`"`). Eg: `ENV_VARIABLE="value1\nvalue2"`.

JavaScript doesn't have native support for accessing environment variables in a `.env` file. For accessing these variables we have
to use the [dotenv](https://www.npmjs.com/package/dotenv) package. This package reads all the ENV variables in the specified `.env` file and
the system at the point of executing the script and adds them to the `process.env` object (in the default configuration). All the OS level environments will be present on the `process.env` object when we start a NodeJS application (depending on the framework). To access the values
of the `.env` file, we can use the `dotenv` package as follows.

```ts
import dotenv from "dotenv";

dotenv.config({
  path: `./.env`,
});

console.log(process.env);
```

```
// Output

{
    ENV_VARIABLE_ONE: "value1",
    ENV_VARIABLE_TWO: "value2"
}
```

We can access the values in the the process.env object anywhere in our codebase by calling `process.env.ENV_VARIABLE_NAME`. For example, to access the values of the `ENV_VARIABLE_ONE`, we can call, `process.env.ENV_VARIABLE_ONE`.

We saw how we can define environment variables dynamically and how we can retain them between sessions using the `.env` file. But our current
implementation works exactly same as defining a constant in JavaScript. If we use a `.env` file, how can we change the variable definitions
according to the environment we are currently on? The solution to this problem is to combine the concepts of setting a dynamic environment
variable per session and defining multiple ENV files based on environment.

```
# .env.development

NEETO_CI_JOB_ID=ABCD123
RECORD_KEY=ABCD123
PROJECT_ID=ABCD123
TAG=development
BASE_URL=http://localhost:3000

# .env.staging

NEETO_CI_JOB_ID=EFG456
RECORD_KEY=EFG456
PROJECT_ID=EFG456
TAG=staging
BASE_URL=https://subdomain.neetoapp.net

# .env.review

NEETO_CI_JOB_ID=XYZ789
RECORD_KEY=XYZ789
PROJECT_ID=XYZ789
TAG=review
BASE_URL=https://subdomain.neetoapp.com
```

In the configuration above, we have defined the environment variables in files called `.env.development`, `.env.staging`, `.env.review` for
the development, staging and review environments respectively. What we mean by this is that the value of the environment variable
`NEETO_CI_JOB_ID` should be, `ABCD123` for the development environment, `EFG456` for the staging environment and `XYZ789` for the review
environment.

The following code snippet loads the environment variables defined in a `.env` file based on OS level `TEST_ENV` variable we set earlier.

```ts
// read-env-variables.js

import dotenv from "dotenv";

dotenv.config({
  path: `.env.${process.env.TEST_ENV}`,
});

console.log(process.env.NEETO_CI_JOB_ID);
console.log(process.env.TAG);
```

```bash
TEST_ENV=development node read-env-variables.js

ABCD123
development

TEST_ENV=staging node read-env-variables.js

EFG456
staging

TEST_ENV=review node read-env-variables.js

XYZ789
review
```

NOTE: Executing a command as `VARIABLE_NAME=value command` is a short-hand for setting an environment variable and then executing the command.
The only difference here is that the environment variable is only available to the command we execute and not for other commands or terminal sessions that
follow.

Now we can access the variables defined in the `.env` files as `process.env.BASE_URL`, `process.env.NEETO_CI_JOB_ID` normally in the
code and they will be populated with the proper values for the environment with no additional effort from the developer.

## Committing .env files in Git

One of the first advantages we said about environment variables is that they were _"useful for storing sensitive information"_.
If we commit the .env files into git, doesn't that defeat this advantage? Anyone with access to the repository can access the .env
files as well. There are multiple ways to handle this situation ranging from encrypting the secrets to not committing the files at all.
Since the latter is the most common and easiest of the methods, we will look at that in detail.

While working with Git, we have the option to define a `.gitignore` file which is used to specify file patterns that git should avoid tracking.
After creating the `.env` files for the environments, let's add the pattern of these files to `.gitignore`.

```
# .gitignore

.env.*
```

The pattern `.env.*` means that we are specifying Git to ignore all files with names starting with `.env.`. Now if we commit our changes and push it to a remote repository like GitHub, the sensitive data inside the `.env` files are not pushed thus keeping them safe and confidential.

If we want to share these credentials with someone, then we should use private and safe channels of communication through which we only share these with trusted people. This makes sure that only trusted actors have access to sensitive information.

There is nothing to commit in this chapter. If you have made some changes to the project, clean them up by executing the following command.

```bash
git clean -fd
```