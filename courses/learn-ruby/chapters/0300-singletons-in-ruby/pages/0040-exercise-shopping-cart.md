 Consider a `ShoppingCart` class that represents a shopping cart. It has an `items` attribute to store the items in the cart and a `total_price` method to calculate the total price of the items. You are given an `Item` class that represents an item with a name and a price attribute. Your task is to complete the code by defining a singleton method on `cart2` that applies a 20% tax to the total price. Modify the code above by adding the necessary code to define the singleton method on `cart2`.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class ShoppingCart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def total_price
    @items.sum(&:price)
  end
end

class Item
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

item1 = Item.new("Book", 10)
item2 = Item.new("Shoes", 50)
item3 = Item.new("Headphones", 30)

cart1 = ShoppingCart.new
cart1.add_item(item1)
cart1.add_item(item2)

cart2 = ShoppingCart.new
cart2.add_item(item3)

puts "Cart 1 total price: $#{cart1.total_price}"
puts "Cart 2 total price (with tax): $#{cart2.total_price}"
</code>

<solution>
class ShoppingCart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def total_price
    @items.sum(&:price)
  end
end

class Item
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

item1 = Item.new("Book", 10)
item2 = Item.new("Shoes", 50)
item3 = Item.new("Headphones", 30)

cart1 = ShoppingCart.new
cart1.add_item(item1)
cart1.add_item(item2)

cart2 = ShoppingCart.new
cart2.add_item(item3)

def cart2.total_price
  @items.sum { |item| item.price * 1.2 }
end

puts "Cart 1 total price: $#{cart1.total_price}"
puts "Cart 2 total price (with tax): $#{cart2.total_price}"
</solution>
</codeblock>