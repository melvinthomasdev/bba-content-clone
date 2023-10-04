## Basics

Software Testing is a process to check whether the actual software product matches expected requirements and to ensure that the software product is defect-free. It involves the execution of software/system components using manual or automated tools to evaluate one or more properties of interest. Software testing aims to identify errors, gaps, or missing requirements in contrast to actual requirements.

## Why is testing important?

Errors made by us humans, when executed can lead to software failures. Some
errors and mistakes are minor but some are quite dangerous and require constant
evaluation and monitoring. Therefore, it has become vital for software engineers
to implement testing throughout the software life cycle, to ensure the
efficiency of the developed software as well as to verify that no defects or
bugs are left undetected, as they can hamper the intended quality,
effectiveness, & performance of the software. Moreover, testing is a process
that helps to measure the quality of the software and gives confidence in it.

Please [watch the video](https://www.youtube.com/watch?v=TDynSmrzpXw) to
understand why software testing is important.

Before understanding the testing process, let's first understand some basic
terminologies.

## Terminologies:

### White-box Testing

In white-box testing, the tester is aware of the inner workings of the software.
One of the basic goals of white-box testing is to verify working flow for an application.
When a software engineer who built the application does testing then that's a "white-box testing".

### Black-box Testing

In black-box testing, functionalities of software applications are tested
without having knowledge of internal code structure, implementation details and
internal paths. Testing mainly focuses on input and output of software
applications and it is entirely based on software requirements and
specifications. It is also known as 'Behavioral Testing'.

- The tester gets the requirements and specifications of the system.
- Choose valid inputs (positive testing) and invalid inputs (negative testing).
- The tester determines expected outputs for all those inputs.
- The tester constructs the test case and executes it.
- Compares the actual output with the expected output.
- Defects are fixed (if any) and retested.

### Unit Testing

Unit testing consists of the testing of individual modules or components. Its
objective is to test each unit of the software.

### Functional Testing

The testing of the system's functionality and behavior; Functional tests verify
that our application does what it's designed to do. More specifically, we are
aiming to test each functional element of our software to verify that the output
is correct. Functional testing covers _Unit testing_, _Component testing_, and
_UI testing_ among others.

### E2E Testing

The primary goal of end-to-end testing is to ensure the entire application or
system as a unit behaves how we expect it to, regardless of internal workings.

End-to-end testing, also known as E2E testing, is a methodology used for
ensuring that applications behave as expected and that the flow of data is
maintained for all kinds of user tasks and processes. This type of testing
approach starts from the end user’s perspective and simulates a real-world
scenario.

For example, on a sign-up form, we can expect a user to perform one or more of
these actions:

- Enter a blank email and password
- Enter a valid email and password
- Enter an invalid email and password
- Click a sign-up button

We can use end-to-end testing to verify that all these actions work as a user
might expect.

### Happy Path Testing

Happy path test (also, know as _golden path test_) is a well-defined test case
using known input, which executes without exception and produces an expected
output. Happy path testing can show that a system meets its functional
requirements but it doesn't guarantee a graceful handling of error conditions or
aid in finding hidden bugs.

Happy path testing does not duplicate real-world conditions and verifies only
that the required functionality is in place and functions correctly. If valid
alternatives exist, the happy path is then identified as the default scenario or
the most likely positive alternative featuring no exceptional or error
conditions.

For example, when we test the Login page, we know that when valid credentials
are used to login, expected result is the user gets authenticated and gets
logged into the website.

### Regression Testing

Regression testing is defined as a type of software testing to confirm that a
recent code change has not adversely affected existing features.

This testing is done to ensure that new code changes do not have side effects on
the existing functionalities. It ensures that the old code still works once the
latest code changes are done.

### Assertion

An assertion is used in automated testing to assert the expected behavior of the
test. An assertion fails if the result is different than what we expected it to
be. This is a key concept in functional testing. Assertions are commonly used in
Unit testing, but the same concept applies to other forms of automated tests.

### Test Case

A test case is the complete set of pre-requisites, required data, and expected
outcomes for a given instance of a Test. A test case is designed to pass or to
fail. Often this depends on the data passed to the Test

### Test Scenario

A sequence of activities performed in a system, such as logging in, signing up a
customer, ordering products, and printing an invoice. We can combine test cases
to form a scenario especially at higher test levels.

### Test Suite

A Test Suite is a collection of test cases. In automated testing, it can mean a
collection of test scripts.

### Mocking

Mocking means creating a fake version of an external or internal service that
can stand-in for the real one, helping our tests run more quickly and more
reliably. When our implementation interacts with an object's properties, rather
than its function or behavior, a mock can be used.

### Stubbing

Stubbing, like mocking, means creating a stand-in, but a stub only mocks the
behavior, but not the entire object. This is used when our implementation only
interacts with a certain behavior of the object.

## How to test a software?

There are 2 ways to test software.

- **Manual testing** - In Manual testing, testers will write test cases and test
  the software manually. This form of testing involves a human performing all
  the test steps, recording the outcome, and analyzing the results. Manual
  testing can be quite challenging because it often involves repeating the same
  set of steps many times.
- **Automation testing** - In Automation testing, the tester will write code and
  execute it to check the workflow of the application. Automated testing
  describes any form of testing where a computer runs the tests rather than a
  human. Typically, this means automated UI testing. The aim is to get the
  computer to replicate the test steps that a human tester would perform.

### Positive and Negative test cases

- **Positive Testing** is a type of testing which is performed on a software
  application by providing the valid data sets as an input. It checks whether
  the software application behaves as expected with positive inputs or not.
- **Negative Testing** is a testing method performed on the software application by
  providing invalid or improper data sets as input. It checks whether the
  software application behaves as expected with the negative or unwanted user
  inputs.

Let's say that we have the following test case to test.

Test the First Name input field which should accept 3-10 alphabets only.

**Positive Testing:** Enter 6 alphabets in the first name input field and
submit. It should pass.

**Negative Testing:** Enter special characters and click on the submit button,
an error message should appear that only alphabets.
