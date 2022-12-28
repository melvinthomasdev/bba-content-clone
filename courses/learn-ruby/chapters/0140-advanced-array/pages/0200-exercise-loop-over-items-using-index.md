We have an array
containing names of cities.
Write a program to
print their names
along with their ranking.
The result should look like this:

```
1. Boston
2. Chicago
3. Seattle
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
cities = %w(Boston Chicago Seattle)
</code>

<solution>
cities = %w(Boston Chicago Seattle)

cities.each_with_index do |name, index|
  puts "#{index + 1}. #{name}"
end
</solution>
</codeblock>