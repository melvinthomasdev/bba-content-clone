We have an array **appliances** with
a list of appliance names.

```ruby
appliances = ["Refrigerator", "Air Conditioner", "Heater", "Refrigerator", "Television", "Heater", "Air Conditioner", "Refrigerator"]
```

You can see that there are 
some items which are repeated
in this array. If we wanted to 
get a clear understanding of 
how many items are repeated, 
we have a handy method, **tally** 
at our disposal.

Let us take a look at an example:

<codeblock language="ruby" type="lesson">
<code>
appliances = ["Refrigerator", "Air Conditioner", "Heater", "Refrigerator", "Television", "Heater", "Air Conditioner", "Refrigerator"]

puts appliances.tally
</code>
</codeblock>

As we can see from the code,
the **tally** method returns a hash. 
This gives us a clear idea of how many 
times each item is repeated in our list.
