In this chapter, we will discuss in detail the importance of having validations
at various levels of an application.

## Where can we perform data validations?

Generally, in any application, the origin of most data is from the user end. So
it makes sense to add data validations on the client side, where the user
interacts with our application. While this is right, we have to ask ourselves
the question of whether this is sufficient or not.

Front-end validations are useful because they can improve the user experience by
providing immediate feedback to the user when they fill out a form. They can
also reduce the load on the server by catching invalid data before it is sent.
But they are not sufficient. Let us see an example.

Imagine that you are building an application for a clothing store. One of the
features of the application is the ability for customers to purchase items
online. The checkout form includes a field for the customer's billing address.
On the front end, you have added a validation that checks that the billing
address field has been filled out. However, you have not added any server-side
validations.

A malicious user discovers that they can bypass the front-end validation by
using a tool to submit a request directly to the server. They do this and place
an order with a blank billing address.

Since there are no server-side validations in place, the order is accepted and
the blank billing address is persisted to the database. This can cause problems
later on when the store tries to process the order and does not have a valid
billing address for the customer.

The example unveils the importance of adding server-side validations. So as a
workaround, we can implement data validations at the ORM (Object-Relational
Mapping) level as well. ORM-level validations are checks that are performed by
the ORM layer of the application which, in our case, is the Rails Active Record.
They can catch any remaining invalid data before it reaches the database and can
give humanized feedback to the users when they interact with the APIs. Still,
these validations may not be enough.

With only front-end and ORM-level validations, we might run into the same
problems that we faced while adding the `slug` field to a model as we discussed
in the previous chapters. Additionally, say our app is up and running and we
have production data in a database. Later if we want to seed some new data, we
might not be able to validate it with just ORM-level validations. We need to
have database-level constraints to protect against invalid data entering the
database.

Database level validations are checks that are performed by the database itself
on the data being persisted. These can include constraints such as unique keys,
foreign keys, and check constraints. These validations help to ensure the
integrity of the data being persisted. You could think of database validations
as the ultimate arbiter of the validity for data.

After reading the above section one might be persuaded to think along the
following terms: "If database validations stand at the base of the validation
hierarchy, why not we just implement them and omit all other validations and
thus prevent the same logic from being expressed at more than one place".

One disadvantage of having only database-level validations is that they are
typically performed after the data has been submitted to the server. This means
that if there is an issue with the data, the user will not find out until after
the form has been submitted and the server has attempted to persist the data to
the database. This can lead to a poor user experience, as the user may have to
wait for the form to be submitted and then be presented with an error message.
It can also lead to confusion, as the user may not understand why the error
occurred or how to fix it.

Another disadvantage of having only database-level validations is that they are
not able to catch all types of invalid data. For example, a database-level
validation may be able to ensure that a required field has a non-null value, but
it may not be able to check that the value is in the correct format (e.g., a
properly formatted email address).

In general, it is safe to say that having validations at all levels cannot harm
your application. But depending on the specifics of your application, it is your
call whether to include or omit validations at certain levels as a part of
optimizing it.

## General guidelines for the type of validations to be included at various levels

The type of data validation that should be performed at various levels of an
application will depend on the requirements of the application and the data
being validated. Here are some general guidelines for what types of validations
might be appropriate at each level:

### Front-end validations

- Basic input checks, such as checking that a required field has been filled out
  or that a number is within a certain range
- Format checks, such as validating the format of an email address or phone
  number

### ORM level validations

- All front-end validations **should be replicated** at the ORM level
- Validating the presence of a required field
- Validating the length of a string field
- Validating that a number is within a certain range

### Database level validations

- Setting unique constraints on fields
- Setting foreign key constraints
- Setting check constraints
- Setting complex business-logic-orientated validations depending on time-based
  requirements

Let us reflect on the last point under database-level validation, in detail,
with the help of a case study. `neetoCal` is one of the `neeto` products offered
by BigBinary to schedule meetings and manage them. Within it, we have a
`Booking` model that facilitates the scheduling of meetings. During its initial
stages, `neetoCal` just had ORM-level validations, inside the `Booking` model,
to prevent concurrent bookings. But, as the users grew, race conditions started
to occur when the booking slots of users began overlapping. This necessitated
the need for database-level validations to prevent the occurrence of race
conditions. Until then these database validations were not necessary. Following
the principle of not prematurely optimizing, the team had to make a call on
whether a database-level validation of the business logic was required or not.

It's important to note that the points mentioned in this section are just
general guidelines, and the specific validations that are needed will depend on
the requirements of the application. It may also be necessary to perform
additional validations at other points in the process, such as after data has
been retrieved from the database and before it is displayed to the user.
