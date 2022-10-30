The **break** keyword is used to stop the loop from continuing. It is usually used in circumstances where a particular condition has not been met.

<Editor lang="python">
<code>
weight_of_apples  = [200, 230, 190, 160, 140, 198, 218]

for apple_weight in weight_of_apples:
  if apple_weight < 150:
    print("Apple below 150gm found. Shipment Cancelled.")
    break
  print("Apple is above 150gm ✓")
</code>
</Editor>