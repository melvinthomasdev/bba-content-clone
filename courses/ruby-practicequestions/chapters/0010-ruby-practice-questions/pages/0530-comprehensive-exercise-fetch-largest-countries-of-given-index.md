Finish the method definition below.

`countries` is an array of country names sorted in descending order of land area. Strings `i` and `j` are indexes of the format 1st, 2nd, 3rd... etc. The method should return both the original array `countries` intact and an array `new_list` that contains `ith` largest to `jth` largest countries in the format below:

```
{
  new_list, countries
}
```

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def fetch_countries(countries, i, j)
  # write your code here
end
</code>

<solution>
def fetch_countries(countries, i, j)
  {
    new_list: countries.values_at(i.to_i - 1, j.to_i - 1),
    countries: countries
  }

end
</solution>

<testcases>
<caller>
countries = ['Russia', 'Canada', 'China', 'United States', 'Brazil', 'Australia', 'India', 'Argentina', 'Kazakhstan', 'Algeria']
puts fetch_countries(countries, i, j)
</caller>
<testcase>
<i>
i = '1st'
j = '2nd'
</i>
</testcase>
<testcase>
<i>
i = '9rd';
j = '10th';
</i>
</testcase>
<testcase>
<i>
i = '2nd'
j = '9th'
</i>
</testcase>
<testcase>
<i>
i = '3rd'
j = '5th'
</i>
</testcase>
</testcases>
</codeblock>