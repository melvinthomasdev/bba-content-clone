In this chapter, we will discuss some common naming conventions followed at
BigBinary.

## Choose names that are descriptive and meaningful

It is important to choose descriptive and meaningful names for variables,
functions and other elements in your code for several reasons:

- Readability: Descriptive names make your code easier to read and understand,
  both for yourself and for other developers who may work on the code in the
  future.

- Maintainability: Descriptive names make it easier to identify and fix bugs, as
  well as make changes to the code.

Developers often tend to use variable names like `temp`, `x`, `thing` among
others, in their code. These are the type of variable or function names that one
must **strictly avoid**. They do not add any value to the code nor does it save
you any time. Instead one should resort to names that reflect their purpose in
the code base. For example, a name like `currentUser` clearly tells its reader
that it refers to a user who is currently using the application.

## Do not unnecessarily elaborate variable names

While it is important to use descriptive names, it is equally important to
ensure that they do not get unnecessarily elongated. Using unnecessarily long or
elaborate names can make it harder for readers to understand what a variable is
used for. For example, a name like `articleSlug` would be more appealing to a
reader than `slugOfTheArticle`.

## Do not abbreviate variable names

It is generally not a good practice to abbreviate variable names in your code,
as this can make your code more difficult to read and understand.

For example, it might be unclear what `nu` stands for, whereas `number` is more
obvious.

## Using verbs while naming functions

It is recommended that you use verbs while naming functions as this helps to
make it clear what the function does.

Using verbs in function names can also help to make your code more maintainable,
as it can be easier to find and modify functions if you know what they do. For
example, if you need to modify the way data is fetched, it will be easier to
find the `fetchData` function than it would be to search for a function with a
more generic or abstract name like `data`.

## Use appropriate prefixes and suffixes

It is a good practice to use prefixes or suffixes to indicate the type or
purpose of a variable or function. For example, you can use `is` as a prefix for
a boolean variable or `_id` as a suffix for an identifier. Using appropriate
prefixes and suffixes can also make it easier to maintain and update your code.
Let us see some examples

- `isLoading`: A boolean variable that indicates whether data is currently being
  loaded. The `is` prefix helps to convey that the variable is a boolean.

- `user_id`: An identifier for a user. The `_id` suffix helps to convey that the
  variable is an identifier.

It is important to use these conventions consistently throughout your codebase.
Some developers might tend to name entities carelessly first and later correct
them after the functionality has been tested. While it is not wrong to do so, it
is advised that you conform to good naming conventions as you code. This will
help reduce careless errors.
