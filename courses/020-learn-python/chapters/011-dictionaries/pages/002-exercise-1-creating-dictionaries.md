Pema is in charge of maintaining a registry of citizens along with their date of birth. She is noting them down as key-value pairs where the key is the citizen's name  and the value is their date of birth.

Given Pema's notes, help her to digitize this data by storing the registry in a Python dictionary named `registry`. Print out the dictionary once created.

Data:

| Name                | Date of Birth      |
| ------------------- | -----------------  |
| Luis Castelino      | 21st July 1951     |
| Michael Thompson    | 24th Aug 1990      |
| Bob Elliot          | 5th  Jan 1993      |
| Sheryl Mendes       | 13th Apr 2009      |

<Editor lang="python" type="exercise">
<code>
# Create a dicitionary called `registry` with the data given above and print it
</code>

<solution>
# Create a dicitionary called `registry` with the data given above and print it

registry = {
  "Luis Castelino": "21-July-1951",
  "Michael Thompson": "24-August-1990",
  "Bob Elliot": "05-January-1993",
  "Sheryl Mendes": "13-April-2009",
}
print(registry)
</solution>
</Editor>