Given below is the
name of a person:

```
Paul Thomas Anderson
```

Write a program which will
print his name in the
following format:

```
P.T.Anderson
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
name = "Paul Thomas Anderson"
# Write your code here
</code>

<solution>
name = "Paul Thomas Anderson"
first_name, middle_name, last_name = name.split

first_letter_of_fn = first_name[0]
first_letter_of_mn = middle_name[0]

short_name = "#{first_letter_of_fn}.#{first_letter_of_mn}.#{last_name}"
puts short_name
</solution>
</codeblock>

<!--  -->
