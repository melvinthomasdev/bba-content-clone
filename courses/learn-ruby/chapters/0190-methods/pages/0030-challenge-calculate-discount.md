Write a ruby method `calculate_discount`which takes three parameters: `price`, `discount_type`, and `discount_value`. It first checks if the `discount_type` is either `"percent"` or `"fixed"`. If it's neither, the method returns `"Invalid discount type"`. For a `"percent"` discount, it calculates the discount amount as a percentage of the price and subtracts it. For a `"fixed"` discount, it directly subtracts the discount_value from the price. The method then ensures that the final price does not go below zero by comparing it to zero and returning the maximum value. The final price after applying the discount is returned.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Write your code here

puts calculate_discount(100, "percent", 20) # Output: 80.0
puts calculate_discount(100, "fixed", 30) # Output: 70.0
puts calculate_discount(100, "fixed", 150) # Output: 0.0
puts calculate_discount(100, "unknown", 10) # Output: "Invalid discount type"

</code>

<solution>
def calculate_discount(price, discount_type, discount_value)
  if discount_type != "percent" && discount_type != "fixed"
    return "Invalid discount type"
  end

  case discount_type
  when "percent"
    discount_amount = price * (discount_value / 100.0)
  when "fixed"
    discount_amount = discount_value
  end

  final_price = price - discount_amount
  final_price = [final_price, 0].max

  final_price
end

puts calculate_discount(100, "percent", 20) # Output: 80.0
puts calculate_discount(100, "fixed", 30) # Output: 70
puts calculate_discount(100, "fixed", 150) # Output: 0
puts calculate_discount(100, "unknown", 10) # Output: "Invalid discount type"

</solution>
</codeblock>
