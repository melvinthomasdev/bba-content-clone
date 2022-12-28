Build a currency converter that can convert US dollar values to any one of the following currencies.
* Indian Rupee (INR)
* Japanese Yen (JPY)
* Euro (EUR)

Your task is to convert the given US dollar value to the currency of the given country using If/Else conditions
and print the result.

**Example**

USD value: 180

Target Currency: INR

INR Value: 13690

You can consider the exchange rate for the target currencies to be the following:

| USD | Target Currency    | Converted Value  |
| --- | ------------------ | ---------------- |
|  1  | INR                | 76               |
|  1  | JPY                | 126              |
|  1  | EUR                | 0.9              |

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
usd_value = 5000
target_currency = "INR"
</code>

<solution>
usd_value = 5000
target_currency = "INR"

if target_currency == "INR":
  target_value = usd_value * 76
elif target_currency == "JPY":
  target_value = usd_value * 126
elif target_currency == "EUR":
  target_value = usd_value * 0.9

print(target_value)
</solution>
</codeblock>