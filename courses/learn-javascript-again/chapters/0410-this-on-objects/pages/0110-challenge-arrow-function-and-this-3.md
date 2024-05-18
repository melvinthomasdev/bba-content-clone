Modify the code below to get the output as:

**Preparing a Medium Latte...**

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const orderCoffee = {
  type: "Latte",
  size: "Medium",
  prepare: () => {
    return () => {
      console.log(`Preparing a ${this.size} ${this.type}...`);
    };
  },
};

const orderLatte = orderCoffee.prepare();
orderLatte();
</code>

<solution>
const orderCoffee = {
  type: "Latte",
  size: "Medium",
  prepare: function() {
    return () => {
      console.log(`Preparing a ${this.size} ${this.type}...`);
    };
  },
};

const orderLatte = orderCoffee.prepare();
orderLatte();
</solution>
</codeblock>
