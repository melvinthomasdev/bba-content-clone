Let's say that We have an array of strings.
We want to get only the strings that contain the word "iphone".
Use `select` to get the result.

Note that the search needs to be case insensitive. It means if the string is "iPhone 10x max"
then this word should be included in the result

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
def selector(array)
end

array = ["iphone 6", "iPhone 10x max", "apple watch", "iPhone 13 Pro", "Mac laptop"]
puts selector(array)
</code>

<solution>
def selector(array)
  array.select do |record|
    record.downcase.include?("iphone")
  end
end

array = ["iphone 6", "iPhone 10x max", "apple watch", "iPhone 13 Pro", "Mac laptop"]
puts selector(array)
</solution>
</codeblock>