Complete the method given below.

Given a credit card number `card_number` as input string, the method should delete any spaces if they exist, and then return the remaining credit card number with only the last 4 digits displayed and the rest masked with `*`.

In order to solve this problem you would need to use `rjust`. To see how `rjust` works click [here](https://apidock.com/ruby/String/rjust).

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def mask_credit_card_number(card_number)
  # write your code here
end
</code>

<solution>
def mask_credit_card_number(card_number)
  trimmed_number = card_number.delete(' ')
  trimmed_number[-4..-1].rjust(trimmed_number.length, '*')
end
</solution>

<testcases>
<caller>
puts mask_credit_card_number(card_number)
</caller>
<testcase>
<i>
card_number = '5555 5555 5555 4444'
</i>
</testcase>
<testcase>
<i>
card_number = '5105 1051 0510 5100'
</i>
</testcase>
<testcase>
<i>
card_number = '4111 1111 1111 1111'
</i>
</testcase>
<testcase>
<i>
card_number = '4012 8888 8888 1881'
</i>
</testcase>
</testcases>
</codeblock>