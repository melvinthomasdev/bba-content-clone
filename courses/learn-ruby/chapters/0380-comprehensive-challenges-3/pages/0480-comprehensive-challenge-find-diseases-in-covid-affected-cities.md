Complete the method definition given below.

For research purposes, a team of doctors are looking to find the list of diseases that are prevalent in the cities that are affected with COVID-19.

`locations` is an array of hashes, each of which contains keys "id", "name" and "diseases". "diseases" is an array of strings which are the diseases affecting the location.

Given `locations`, the method should return a unique list of disease names that are prevalent in cities that are affected with COVID-19. The result should not contain "COVID-19".

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def other_diseases(locations)
  # Write your code here
end
</code>

<solution>
def other_diseases(locations)
  diseases = []
  locations.each do |location|
    if location[:diseases].include? "COVID-19"
      diseases << location[:diseases]
    end
  end
  diseases.flatten!.uniq!
  diseases.delete('COVID-19')

  diseases
end
</solution>

<testcases>
<caller>
puts other_diseases(locations)
</caller>
<testcase>
<i>
locations = [
  {
    id: 1,
    name: "Gotham",
    diseases: ['COVID-19', 'Disease-A', 'Disease-B']
  },
  {
    id: 2,
    name: "NeverLand",
    diseases: ['Disease-R', 'Disease-H', 'Disease-G']
  },
  {
    id: 3,
    name: "Asgard",
    diseases: ['Disease-L', 'COVID-19', 'Disease-B']
  }
]
</i>
</testcase>
<testcase>
<i>
locations = [
  {
    id: 1,
    name: "Shire",
    diseases: ['Disease-G', 'Disease-A', 'Disease-L']
  },
  {
    id: 2,
    name: "Galaxy",
    diseases: ['Disease-S', 'Disease-H', 'Disease-I']
  },
  {
    id: 3,
    name: "Narnia",
    diseases: ['COVID-19', 'Disease-R', 'Disease-E']
  },
  {
    id: 4,
    name: "Somewhere",
    diseases: ['COVID-19', 'Disease-P', 'Disease-N']
  }
]
</i>
</testcase>
</testcases>
</codeblock>
