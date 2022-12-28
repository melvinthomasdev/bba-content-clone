We have an array with names of people.
The names are in an inconsistent manner.
Write a program so that the names
are printed as shown below:

```
1. Linh Tran
2. Carlos Alberti
3. Lao Xun
4. Renu Sen
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
names = []
names << " linh tran"
names << "carlos alberti "
names << "lao xun"
names << " renu sen"

# write your code here
</code>

<solution>
names = []
names << " linh tran"
names << "carlos alberti "
names << "lao xun"
names << " renu sen"

names.each_with_index do |name, index|
  first_name, last_name = name.split
  f_name = first_name.strip.capitalize
  l_name = last_name.strip.capitalize
  new_name = "#{f_name} #{l_name}"
  line = "#{index + 1}. #{new_name}"
  puts line
end
</solution>
</codeblock>