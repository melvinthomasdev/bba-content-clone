Look at the example given below:

```
const age = 12;
const newObject = {
    size: 42,
    cost: 100
}
```

In this example, we have 2 variables:
**age** and **newObject**. It might look
like both these operations are similar. After
all, we are simply saving some values in **age**
and
**newObject**, right? Well, not really. JavaScript
treats objects differently than any other type of value.

When we say that **newObject** should hold an
object in it, what JavaScript is going to do
is it will save the whole object in the
computer memory. But, instead of saving it in
**newObject**, it will take the address of that
memory location and save it in **newObject** instead.
So, essentially, you wanted to save the whole
object in a variable, but you ended up saving
an address in the variable instead.

This can be really confusing but with
practice this will become simpler.

Let's look at another example:

<Editor lang="javascript">
<code>
let user = { name: "Sam" };
console.log(user.name); // Sam
let copyUser = user;
copyUser.name = "Oliver";
console.log(user.name); // Oliver
</code>
</Editor>

First of all, we are copying the address of an
object in the **user** variable. Then, we
say **copyUser** should have the same value
as that of **user**, which is the address of the
original object. So now, we have both **user** and
**copyUser** holding the address of the same object
in memory. This means that if we use either
**user** or **copyUser** to make change in the object's values,
the original object will be changed. Now, the changed
value will be visible with both **user** and **copyUser**.