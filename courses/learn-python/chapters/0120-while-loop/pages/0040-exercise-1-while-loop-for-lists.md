There's a queue outside Screen number 4 at a Movie Theatre. People are waiting to enter the cinema hall to watch the newly released Batman movie.

You are in charge of assigning tickets to people before letting them enter the cinema hall. Given to you is a list `screen_four_tickets`  containing ticket numbers.  Use a while loop to pop tickets out of the list and check them into the screening hall. Print **Ticket X: Checked In** for every ticket popped.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# pop tickets out of screen_four_tickets until its empty
# print Ticket X: Checked In for every ticket popped
screen_four_tickets = ['TCKT23', 'TCKT45', 'TCKT06', 'TCKT18', 'TCKT32', 'TCKT11', 'TCKT24']
</code>

<solution>
# pop tickets out of screen_four_tickets until its empty
# print Ticket X: Checked In for every ticket popped
screen_four_tickets = ['TCKT23', 'TCKT45', 'TCKT06', 'TCKT18', 'TCKT32', 'TCKT11', 'TCKT24']
while screen_four_tickets:
  ticket = screen_four_tickets.pop()
  print(f"Ticket {ticket}: Checked In")
</solution>
</codeblock>