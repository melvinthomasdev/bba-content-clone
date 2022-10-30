In the code given below,
the value of the **feathers** variable
increases by **1**.
Use optional chaining `?.`
to ensure that only when there is a **bird**,
we increase the **feather** count.
If the **bird** variable indicates
that there is no **bird**, the value
of **feathers** should not increase.

<Editor type="exercise" lang="javascript">
<code>
let bird = null;
let feathers = 2;

feathers++;
console.log(feathers);
</code>

<solution>
let bird = null;
let feathers = 2;

bird?.(feathers++);
console.log(feathers);
</solution>
</Editor>