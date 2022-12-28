Akriti is in charge of hiring Engineers for ABC Ltd. She selected 8 candidates and assigned them to Raghav and Rajiv for two rounds of interviews.

After the interviews, Raghav and Rajiv both submitted their list of candidates who have passed their interview.

Akriti has decided to hire only those candidates who have passed both Raghav's and Rajiv's interviews.

Given two sets containing the names of candidates who have passed Raghav's and Rajiv's interviews, help Akriti filter out candidates who are present in both sets. Use .`intersection()` for the same and print the sorted list from the resulting set.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Get the common candidates from raghavs_selection and rajivs_selection
raghavs_selection = {"Bob", "Tom", "Elliot", "Stacy"}
rajivs_selection = {"Stacy", "Philip", "Bob", "Tom", "Vishal"}
</code>

<solution>
# Get the common candidates from raghavs_selection and rajivs_selection
raghavs_selection = {"Bob", "Tom", "Elliot", "Stacy"}
rajivs_selection = {"Stacy", "Philip", "Bob", "Tom", "Vishal"}

print(sorted(raghavs_selection.intersection(rajivs_selection)))
</solution>
</codeblock>