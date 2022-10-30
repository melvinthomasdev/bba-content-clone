There are many more methods like `any?`, `none?`, `one?`,
`take`. All these methods come under `Enumerable` module.

[Here is](https://ruby-doc.org/core-3.1.2/Enumerable.html)
link of the Enumerable documentation.
Please go through this to see what methods mentioned above do.
Besides those methods you will a lot more methods on the left sidebar. Read about those methods and practice them below.

<Editor lang="ruby">
<code>
def number_finder(array)
  array.any? do |element|
    element.even?
  end
end

array = [4, 8,7,3,13, 9,7, 11]
puts number_finder(array)
</code>
</Editor>