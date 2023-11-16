Ramda is very powerful and helps us in a lot of use cases. But, it is still a tool that helps make our code easier to read and write. We can decide where and where not to use it.

While writing code using Ramda functions, it's important to keep in mind that most Ramda functions are slower than their Vanilla JS counterparts. This is because
1. Vanilla JS operators are directly interpreted and executed by the JS engine. Equivalent Ramda functions are wrappers over these operators. More lines to execute means slower performance.
2. Ramda functions are curried. So there are additional checks to verify if sufficient arguments are passed or not.
3. Ramda focuses on function purity and builds a new output object all the time. If all we need to do is make changes to a local object, then we should be careful about performance if Ramda is preferred.


This doesn’t mean that we shouldn’t use Ramda. We don’t need to over optimize web apps for performance. These days, computers are very fast, and DOM manipulation and content rendering take far more time than data manipulation using Ramda. Even if we wrote all the boilerplate using Vanilla JS, the performance gain we would get would be minimal.


Ultimately, it is not about performance. It is about code quality. If Ramda shortens the code and improves its readability, we shouldn't think twice and go with it. If the improvement in code quality is negligible or zero, always prefer vanilla JS.

We need to strike an optimal balance between Ramda and vanilla JS for our code to be readable. We can make use of all the Ramda functions we have learned till now and even use them mixed inside vanilla JS as we have seen in some examples to leverage the full power of Ramda.

We can also go through the definition of all the functions we have learned till now on the [Ramda docs](https://ramdajs.com/docs/) as well as learn about more functions, and run the examples and code on the [Ramda REPL](https://ramdajs.com/repl/).
