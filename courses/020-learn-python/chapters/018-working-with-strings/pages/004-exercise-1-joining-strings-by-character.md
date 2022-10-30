Sharath's boss is very happy with the automation work he has done to read CSV's. Given his skills, his boss also wants him to work on improving the output design of the data. He has asked Sharath to display the data from the CSV into a table-like structure with rows and columns.

Given the parsed data, help Sharath format it and display it within a table using - and \|.


<Editor lang="python" type="exercise">
<code>
headers = ["Name" ,"Age","Phone","City"]
data = [
  ['Tom', '25', '9838572948', 'Kochi'],
  ['Bob', '29', '8273885932', 'Delhi'],
  ['Rob', '45', '9273285631', 'Miami'],
]

print("-------------------------------------------------------------")
# join headers using '\t|\t' here and print it


print("-------------------------------------------------------------")
for record in data:
  # join record using '\t|\t' here and print it
</code>

<solution>
headers = ["Name" ,"Age","Phone","City"]
data = [
  ['Tom', '25', '9838572948', 'Kochi'],
  ['Bob', '29', '8273885932', 'Delhi'],
  ['Rob', '45', '9273285631', 'Miami'],
]

print("-------------------------------------------------------------")
print('\t|\t'.join(headers))
print("-------------------------------------------------------------")
for record in data:
  print('\t|\t'.join(record))
</solution>
</Editor>