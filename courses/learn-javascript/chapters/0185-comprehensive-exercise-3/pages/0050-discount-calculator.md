Update the function **getDiscountedPrice** to calculate the discounted price of an item based on the original price, membership status, and coupon availability. The function should return the discounted price.

The function parameters are,

- **originalPrice (number):** It is the original price of the item.
- **isMember (boolean):** It indicates if the customer is a member (true) or not (false)
- **hasCoupon (boolean):** It indicates if the customer has a coupon (true) or not (false).

The function should apply the following discounts,

- If the customer is a member, they receive a 10% discount.
- If the customer has a coupon, they receive a 20% discount.
- If the customer is both a member and has a coupon, they receive a 30% discount.
- If the customer is neither a member nor has a coupon, there is no discount applied.

The function should return the final discounted price based on the original price and the applicable discounts.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getDiscountedPrice = (originalPrice, isMember, hasCoupon) => {
    // write your code here
}
</code>

<solution>
const getDiscountedPrice = (originalPrice, isMember, hasCoupon) => {
  let discount = 0;

  if (isMember && hasCoupon) {
    discount = 0.30; // 30% discount
  } else if (hasCoupon) {
    discount = 0.20; // 20% discount
  } else if (isMember){
    discount = 0.10; // 10% discount
  } else {
    discount = 0; // No discount
  }

  const discountedPrice = originalPrice - (originalPrice * discount);
  return discountedPrice;
}
</solution>
<testcases>
<caller>
console.log(getDiscountedPrice(originalPrice, isMember, hasCoupon));
</caller>
<testcase>
<i>
const originalPrice = 100;
const isMember = true;
const hasCoupon = false;
</i>
</testcase>
<testcase>
<i>
const originalPrice = 150;
const isMember = false;
const hasCoupon = true;
</i>
</testcase>
<testcase>
<i>
const originalPrice = 200;
const isMember = true;
const hasCoupon = true;
</i>
</testcase>
<testcase>
<i>
const originalPrice = 50;
const isMember = false;
const hasCoupon = false;
</i>
</testcase>
</testcases>
</codeblock>
