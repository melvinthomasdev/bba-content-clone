Let's say that we need to produce a message as shown below.

```
Dear Mike,

Thank you for choosing the monthly plan of $19/month.

Please note that we also provide annual plan of $190/year which
you can upgrade to at anytime.

If you need any help then please contact us.
- neetoChat team
```

In the above case the amount and the currency might change.

We can solve this by writing code like this.

```rb
currency = "$"
monthly_price = 19
annual_price = 190

greetings = "Dear Mike,"
line1 = "Thank you for choosing the monthly plan of #{currency}#{monthly_price}/month."

line2 = "Please note that we also provide annual plan of #{currency}#{annual_price}/year"
line2 << " which you can upgrade to at anytime."

line3 = "If you need any help then please contact us."
line4 = "- neetoChat team"

puts greetings
puts line1
puts line2
puts line3
puts line44
```

As we have seen before this style of writing code is called "Procedural style of
programming".

Let's take a look at how to solve the same problem using "Object Oriented style
of programming". We will start with creating a class called `Price`.

```rb
class Price
end
```

Currently this class has nothing. Let's move all the lines from procedural to
object oriented style.

```rb
class Price
  def self.greetings
    "Dear Mike,"
  end

  def self.line1(currency, monthly_price)
    "Thank you for choosing the monthly plan of #{currency}#{monthly_price}/month."
  end

  def self.line2(currency, annual_price)
    "Please note that we also provide annual plan of #{currency}#{annual_price}/year" <<
    " which you can upgrade to at anytime."
  end

  def self.line3
    "If you need any help then please contact us."
  end

  def self.line4
    "- neetoChat team"
  end
end

currency = "$"
monthly_price = 19
annual_price = 190

puts Price.greetings
puts Price.line1(currency, monthly_price)
puts Price.line2(currency, monthly_price)
puts Price.line3
puts Price.line4
```

We created a few "class methods" and moved the procedural code there.

For methods "line1" and "line2" we need to pass currency to both the methods.
why do we need to pass same currency two times. We need to do that here because
the class Price does not hold currency.

Rather than passing currency twice we will let the class hold the value of
currency and then use it when we need currency.

In Ruby when we instantiate a class then `initialize` method is called. That's a
good place to pass any state level information for that class.

```rb
class Price
  def initialize(currency)
    @currency = currency
  end
 end
```

Now the instantiated object will hold the state called currency which can be
used by other methods. Also we need to change methods from class methods to
instance methods. After the change the class looks like this.

```rb
class Price
  def initialize(currency)
    @currency = currency
  end

  def greetings
    "Dear Mike,"
  end

  def line1(monthly_price)
    "Thank you for choosing the monthly plan of #{@currency}#{monthly_price}/month."
  end

  def line2(annual_price)
    "Please note that we also provide annual plan of #{@currency}#{annual_price}/year" <<
    " which you can upgrade to at anytime."
  end

  def line3
    "If you need any help then please contact us."
  end

  def line4
    "- neetoChat team"
  end
end

currency = "$"
monthly_price = 19
annual_price = 190

price = Price.new(currency)
puts price.greetings
puts price.line1(monthly_price)
puts price.line2(annual_price)
puts price.line3
puts price.line4
```

In the above case methods "line1" and "line2" are reaching out to "@currency".
This is not ideal. A class should be able to control what is available and what
is not.

In this case we can use `attr_reader` to make `currency` available to all the
methods. Note these methods need to use `currency` and not `@currency`.

Here is the modified solution.

```rb
class Price

  attr_reader :currency

  def initialize(currency)
    @currency = currency
  end

  def greetings
    "Dear Mike,"
  end

  def line1(monthly_price)
    "Thank you for choosing the monthly plan of #{currency}#{monthly_price}/month."
  end

  def line2(annual_price)
    "Please note that we also provide annual plan of #{currency}#{annual_price}/year" <<
    " which you can upgrade to at anytime."
  end

  def line3
    "If you need any help then please contact us."
  end

  def line4
    "- neetoChat team"
  end
end

currency = "$"
monthly_price = 19
annual_price = 190

price = Price.new(currency)
puts price.greetings
puts price.line1(monthly_price)
puts price.line2(annual_price)
puts price.line3
puts price.line4
```

So far we have been instantiating an object and on that object we have been
invoking all these methods. However we can move the call to these methods to
inside the class and have only one method from outside to call it.

Here is a modified solution.

```rb
class Price

  attr_reader :currency

  def initialize(currency)
    @currency = currency
  end

  def message(monthly_price, annual_price)
    msg = []
    msg << greetings
    msg << line1(monthly_price)
    msg << line2(annual_price)
    msg << line3
    msg << line4
    msg.each { |m| puts m }
  end

  private

  def greetings
    "Dear Mike,"
  end

  def line1(monthly_price)
    "Thank you for choosing the monthly plan of #{currency}#{monthly_price}/month."
  end

  def line2(annual_price)
    "Please note that we also provide annual plan of #{currency}#{annual_price}/year" <<
    " which you can upgrade to at anytime."
  end

  def line3
    "If you need any help then please contact us."
  end

  def line4
    "- neetoChat team"
  end
end

currency = "$"
monthly_price = 19
annual_price = 190

price = Price.new(currency)
price.message(monthly_price, annual_price)
```

In the above case while calling the method `message` we are passing
"monthly_price" and "annual_price". We can pass on the pricing information when
we are instantiating the class. Let's do that.

Here is the modified code.

```rb
class Price

  attr_reader :currency, :monthly_price, :annual_price

  def initialize(currency, monthly_price, annual_price)
    @currency = currency
    @monthly_price = monthly_price
    @annual_price = annual_price
  end

  def message
    msg = []
    msg << greetings
    msg << line1
    msg << line2
    msg << line3
    msg << line4
    msg.each { |m| puts m }
  end

  private

  def greetings
    "Dear Mike,"
  end

  def line1
    "Thank you for choosing the monthly plan of #{currency}#{monthly_price}/month."
  end

  def line2
    "Please note that we also provide annual plan of #{currency}#{annual_price}/year" <<
    " which you can upgrade to at anytime."
  end

  def line3
    "If you need any help then please contact us."
  end

  def line4
    "- neetoChat team"
  end
end

currency = "$"
monthly_price = 19
annual_price = 190
price = Price.new(currency, monthly_price, annual_price)
price.message
```
