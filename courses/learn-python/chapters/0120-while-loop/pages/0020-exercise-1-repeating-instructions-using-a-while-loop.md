Sam is in charge of assigning seats to attendees at an event. The hall for the event has a limited seating capacity of 100.

The seats must be assigned in ascending order from 1 to 100.
Help Sam assign seats to people as they attend. Use a while loop to print **You have been assigned seat number X** to every person. Stop when 100 seats are assigned and  print **All seats are occupied** to the screen.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Use a while loop to assign seats until seat_number is 100
# Print **All seats have been assigned** once done
available_seats = 100
seat_number = 1
</code>

<solution>
# Use a while loop to assign seats until seat_number is 100
# Print **All seats have been assigned** once done
available_seats = 100
seat_number = 1

while seat_number <= available_seats:
  print(f"You have been assigned seat number {seat_number}")
  seat_number += 1

print("All seats are occupied")
</solution>
</codeblock>