Newspaper Ltd. delivers newspapers to homes using delivery persons. Paresh is assigned the task to deliver newspapers from homes 101 to 105.  The rest of the deliveries will be handled by another person.

Write a program that prints Delivered to **house number** until 105 using a For loop. Once done, break the loop and print **All newspapers delivered.**

<Editor lang="python" type="exercise">
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
</Editor>