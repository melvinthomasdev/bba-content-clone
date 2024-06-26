Newspaper Ltd. delivers newspapers to homes using delivery persons. Paresh is assigned the task to deliver newspapers from homes 101 to 105.  The rest of the deliveries will be handled by another person.

Write a program that goes through the list of house numbers and prints **Delivered to <house number>** for each house number 
until house number 105. Once it reaches house number 105, print **All newspapers delivered.** and break the loop. The house
numbers will be in increasing order.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# break the loop after house_number 105
house_numbers = [101, 102, 103, 104, 105, 106, 107, 108, 109, 110]
</code>

<solution>
# break the loop after house_number 105
house_numbers = [101, 102, 103, 104, 105, 106, 107, 108, 109, 110]

for house_number in house_numbers:
  if house_number > 105:
    print("All newspapers delivered.")
    break

  print(f"Delivered to {house_number}")
</solution>
</codeblock>