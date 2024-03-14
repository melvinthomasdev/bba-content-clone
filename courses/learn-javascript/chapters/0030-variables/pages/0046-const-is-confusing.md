_Please note that this lesson refers to technical materials that have not yet been covered.
So, if you cannot fully grasp everything mentioned in this lesson, 
don't worry. You can go ahead and go to the next lesson and return to this lesson later._

_It's important to add this lesson because many people come to learn JavaScript after having learned other programming
languages like Java and Python. In those languages, the meaning of a constant is very different from how variables
are declared using `const` in JavaScript. This lesson is for those folks so that they fully understand what exactly
`const` means in JavaScript._

In JavaScript, `const` is used to declare variables.
In JavaScript, not only can `const` be used to declare variables, but
it's also the most recommended way to create variables.

First, let's see an example.

<codeblock language="javascript" type="lesson">
<code>
const fruit = { name: "Apple" }

fruit.name = "Banana"
console.log(fruit)
</code>
</codeblock>

In the above case, we can change `fruit` even though it's declared as a `const`.
However, if we try to achieve the same result by assigning a new object, then `const` will not allow us to do so.

<codeblock language="javascript" type="lesson">
<code>
const fruit = { name: "Apple" }
fruit = { name: "Banana" }
</code>
</codeblock>

## Assignment vs Mutation

To better understand what's going on here, we need to understand the difference between
**Assignment** and **Mutation**.

let's take an example of an array.


```
["Apple", "Banana", "Mango"]
```

This is a valid JavaScript code.
When JavaScript sees this statement, it creates an array in the memory.
Before this statement, the memory would be empty and look like this.

<image>figure-1.png</image>

After that statement, the memory will look like this.

<image>memory-array.png</image>

Let's give the array a name by assigning it to a variable.

```
let fruits = ["Apple", "Banana", "Mango"]
```

Now, we are assigning that array to a variable. The equal sign here acts like an assignment.

Now, in memory, we have a variable called "fruits," which points to the array.

<image>fruits-variable-assignment.png</image>

Now, let's create one more variable.

```
let cities = ["Paris", "London", "Chicago"]
```

Now we have two variables, "cities" and "fruits" and the memory would look like this.

<image>cities-variable-assignment.png</image>

Now, let's **assign** a different value to the "fruits" variable.

```
fruits = ["Strawberry", "Blueberry"]
```

Now, the memory looks like this.

<image>fruits-reassignment.png</image>

As we can see, fruits point to a different array because of this assignment.
We have not changed the original array. We have created a new array, which is what Fruits is now pointing to.
This is because the variable fruits is **assigned** a new value.

Now let's change the first item in fruits to "Pineapple".

<codeblock language="javascript" type="lesson">
<code>
fruits[0] = "Pineapple"
</code>
</codeblock>

In this case, the existing item was changed. This is called **mutation**.
In this case, there was no "assignment" using `=` sign.
Notice that in the case of mutation, the variable didn't change what it's pointing to.
All variables continue to point to the same item. It's the item that itself changed.
This is **mutation**.

## Differences between let and const

Once a variable is pointing to something, then `let` allows us to **assign** a different item to the variable
so that the variable can point to something else.

`const` doesn't allow that. In the case of `const`, once a variable points to an item, JavaScript
will not allow us to change the variable to something else. However, JavaScript allows us to change the item
to which `let` and `const` are pointing. In other words, both `let` and `const` allow **mutation**, but only `let` allows **assigning** new values.
