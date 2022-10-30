Follow the steps given below
to write a program:

1. Create an object **employee**
and
store the following key-value pairs:
`skill: Software`, `numberOfYears: 6`.
Also, create a variable **giftCoupons**
with the value **0**.

2. The first `if` statement
is satisfied when
the skill is **Software**
and
the employee has been working
for **7** or more years.
Then re-assign the value of **giftCoupons** to **100**
and
display the message
**Number of gift-coupons: 100**.

3. The `else...if` statement
is satisfied when
either
the skill is **Management**
OR
the employee has been working
for **5** or more years.
Then re-assign the value of `giftCoupons` to **80**
and
display the message
**Number of gift-coupons: 80**.

4. Use the `else` statement to
re-assign the value of **giftCoupons** to **20**
and
display the message
**Number of gift-coupons: 20**.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let employee = {
  skill: "Software",
  numberOfYears: 6
}

let giftCoupons  = 0;

if(employee.skill == "Software" && employee.numberOfYears >= 7) {

  giftCoupons += 100;
  console.log(`Number of gift-coupons: ${giftCoupons}`);

} else if (employee.skill == "Management" || employee.numberOfYears >= 5) {

  giftCoupons += 80;
  console.log(`Number of gift-coupons: ${giftCoupons}`);

} else {

  giftCoupons += 20;
  console.log(`Number of gift-coupons: ${giftCoupons}`);

}
</solution>
</Editor>