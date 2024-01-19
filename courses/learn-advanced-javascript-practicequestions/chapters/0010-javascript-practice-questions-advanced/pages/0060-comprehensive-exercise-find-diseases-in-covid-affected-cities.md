For research purposes, a team of doctors are looking to find the list of diseases that are prevalent in the cities that are affected with COVID-19.

1. The return value should not contain the word `COVID-19`
2. Not all cities are affected by `COVID-19`
3. The term used will always be `COVID-19`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findOtherDiseases = locations => {
  // your code here
}
</code>

<solution>
const findOtherDiseases  = locations => {
  const locationsWithCovid = locations.filter(location => location.diseases.includes('COVID-19'))
  const diseases = [];
  locationsWithCovid.map(location => diseases.push(...location.diseases));
  const diseasesSet = new Set(diseases);
  diseasesSet.delete('COVID-19');
  return [...diseasesSet];
}
</solution>

<testcases>
<caller>
console.log(findOtherDiseases(locations));
</caller>
<testcase>
<i>
const locations =  [
    {
        "id": 1,
        "name": "Gotham",
        "diseases": ['COVID-19', 'Disease-A', 'Disease-B']
    },
    {
        "id": 2,
        "name": "NeverLand",
        "diseases": ['Disease-R', 'Disease-H', 'Disease-G']
    },
    {
        "id": '3',
        "name": "Asgard",
        "diseases": ['Disease-L', 'COVID-19', 'Disease-B']
    }
];
</i>
</testcase>
<testcase>
<i>
const locations =  [
    {
        "id": '1',
        "name": "Shire",
        "diseases": ['Disease-G', 'Disease-A', 'Disease-L']
    },
    {
        "id": 2,
        "name": "Galaxy",
        "diseases": ['Disease-S', 'Disease-H', 'Disease-I']
    },
    {
        "id": 3,
        "name": "Narnia",
        "diseases": ['COVID-19', 'Disease-R', 'Disease-E']
    },
    {
        "id": 3,
        "name": "Somewhere",
        "diseases": ['COVID-19', 'Disease-P', 'Disease-N']
    }
];
</i>
</testcase>
<testcase>
<i>
const locations =  [
  {
    "id": 1,
    "name": "Metropolis",
    "diseases": ['Disease-X', 'Disease-Y', 'Disease-Z']
  },
  {
    "id": 2,
    "name": "Atlantis",
    "diseases": ['Disease-A', 'Disease-B', 'Disease-C']
  },
  {
    "id": '3',
    "name": "Central City",
    "diseases": ['Disease-P', 'Disease-Q', 'Disease-R']
  }
];
</i>
</testcase>
<testcase>
<i>
const locations =  [
  {
    "id": '1',
    "name": "Olympus",
    "diseases": ['Disease-M', 'Disease-N', 'Disease-O']
  },
  {
    "id": 2,
    "name": "Avalon",
    "diseases": ['Disease-D', 'Disease-E', 'Disease-F']
  },
  {
    "id": 3,
    "name": "Wakanda",
    "diseases": ['Disease-G', 'Disease-H', 'Disease-I']
  },
  {
    "id": 4,
    "name": "Neverland",
    "diseases": ['COVID-19', 'Disease-X', 'Disease-Y']
  }
];
</i>
</testcase>
</testcases>
</codeblock>