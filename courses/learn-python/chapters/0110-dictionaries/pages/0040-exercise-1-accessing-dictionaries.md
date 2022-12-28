Given the below `registry`, fetch the date of birth of the person by the given `name` and print it in the following text:

| Name                | Date of Birth      |
| ------------------- | -----------------  |
| Luis Castelino      | 21st July 1951     |
| Michael Thompson    | 24th Aug 1990      |
| Bob Elliot          | 5th  Jan 1993      |
| Sheryl Mendes       | 13th Apr 2009      |


Text: **`name` was born on `date of birth`**

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Fetch the DOB of the person via `name` and print it to the screen

registry = {
  "Luis Castelino": "21-July-1951",
  "Michael Thompson": "24-August-1990",
  "Bob Elliot": "05-January-1993",
  "Sheryl Mendes": "13-April-2009",
}

name = 'Bob Elliot'
</code>

<solution>
# Fetch the DOB of the person via `name` and print it to the screen

registry = {
  "Luis Castelino": "21-July-1951",
  "Michael Thompson": "24-August-1990",
  "Bob Elliot": "05-January-1993",
  "Sheryl Mendes": "13-April-2009",
}

name = 'Bob Elliot'

print(f"{name} was born on {registry[name]}")
</solution>
</codeblock>