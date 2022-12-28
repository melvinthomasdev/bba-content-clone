Finish the method definition below.

`cart` is an array of items, each of which is a hash with the keys "item" and "paymentStatus", a string representing the name of the item, and a boolean representing the payment status of the item. Given `cart`, the method should return true if atleast one item in the cart has `paymentStatus` as `false`, and false otherwise.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def check_cart(cart)
  # write your code here
end
</code>

<solution>
def check_cart(cart)
  cart.any? { |item| item["paymentStatus"] == false }
end
</solution>

<testcases>
<caller>
puts check_cart(cart)
</caller>
<testcase>
<i>
cart = [
  {
    "item"=> "Snacks",
    "paymentStatus"=> false,
  },
  {
    "item"=> "Pen",
    "paymentStatus"=> false,
  },
  {
    "item"=> "Books",
    "paymentStatus"=> true,
  },
  {
    "item"=> "Notepad",
    "paymentStatus"=> true,
  },
];
</i>
</testcase>
<testcase>
<i>
cart = [
  {
    "item"=> "Rice",
    "paymentStatus"=> false,
  },
  {
    "item"=> "Pasta",
    "paymentStatus"=> true,
  },
  {
    "item"=> "Flour",
    "paymentStatus"=> true,
  },
  {
    "item"=> "Cheese",
    "paymentStatus"=> false,
  },
];
</i>
</testcase>
<testcase>
<i>
cart = [
  {
    "item"=> "Juice",
    "paymentStatus"=> true,
  },
  {
    "item"=> "Coffe Beans",
    "paymentStatus"=> true,
  },
  {
    "item"=> "Sugar",
    "paymentStatus"=> true,
  },
  {
    "item"=> "Milk",
    "paymentStatus"=> true,
  },
];
</i>
</testcase>
</testcases>
</codeblock>