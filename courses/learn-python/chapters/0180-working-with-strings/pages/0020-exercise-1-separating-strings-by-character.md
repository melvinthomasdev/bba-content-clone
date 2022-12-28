Sharat is an automation engineer at ABC Labs. He is currently writing a program to parse CSV files that contain customer information.

Given the CSV headers and the CSV data, help Sharat write a program that gets customer information from a line and prints it to a format given below with the headers.

* The records are present in `data`. Each line in data is separated by `\n`.
* Use the `.split()` method to split the string into different lines and use `.split()` again to split every attribute of the customer.
* Iterate through the headers and each customer attribute to print the information.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
headers = ["Name" ,"Age","Phone","City"]
data = "Tom,25,9838572948,Bengaluru\nBob,29,8273885932,Jaipur\nSuresh,45,9273285631,Goa"

# Split data on every new line and assign to customers
customers = []

for customer in customers:

#   Split every customer data value into data_split
  data_split = []

  for column, value in zip(headers, data_split):
    print(f"{column.capitalize()}: {value}")

  print("---------------------------------")
</code>

<solution>
headers = ["Name" ,"Age","Phone","City"]
data = "Tom,25,9838572948,Bengaluru\nBob,29,8273885932,Jaipur\nSuresh,45,9273285631,Goa"

# Split data on every new line
customers = data.split("\n")

for customer in customers:
#   Split every customer data value
  data_split = customer.split(",")
  for column, value in zip(headers, data_split):
    print(f"{column.capitalize()}: {value}")

  print("---------------------------------")
</solution>
</codeblock>