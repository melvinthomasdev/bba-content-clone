##  Tip #3: Variable names are case sensitive.
In python we can declare two variables with names `animals` as well as `Animals`. Python will consider these as two different variables, as their case differs. i.e `a` is capitalized in the second variable.

We can also declare `ANIMALS`, `ANiMaLs`, `AnIMalS` and Python will still recognise these as valid variables. However it is not considered a good practice to have similar variable names in Python.


<codeblock language="python" type="lesson">
<code>
ANIMAL = "cow" # valid variable name
ANiMaL = "pig" # valid variable name
AnIMal = "crocodile" # valid variable name

print(ANIMAL)
print(ANiMaL)
print(AnIMal)
</code>
</codeblock>