You are given a dictionary of popular people mapped to their respective countries. Your task is to reverse the dictionary such that every country is mapped to a list of persons in that country.

Once done, use a for loop print all the popular people for each country in the following manner:

**The popular people from `country` are [abc, efg, hij]**

#### Question

<Editor lang="python" type="challenge">
<code>
people = {
  "Conor McGregor": "Ireland",
  "Obama": "United States",
  "Adbul Kalam": "India",
  "AR Rahman": "India",
  "Tom Cruise": "United States",
  "Sharukh Khan": "India"
}
</code>

<solution>
people = {
  "Conor McGregor": "Ireland",
  "Obama": "United States",
  "Adbul Kalam": "India",
  "AR Rahman": "India",
  "Tom Cruise": "United States",
  "Sharukh Khan": "India"
}

country_mapping = {}

for name, country in people.items():
  if country in country_mapping:
    country_mapping[country].append(name)
  else:
    country_mapping[country] = [name]

for country, people in country_mapping.items():
  print(f"The popular people from {country} are {people}")
</solution>
</Editor>