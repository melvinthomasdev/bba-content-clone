Procedural programming follows top down approach. Control flows from the top to
the bottom.

Let's assume that we are building a ticketing system for a park. Right now there
is only one rule. The adults will pay the full price and the young people, who
are of age less than 18, will get a 20% discount on the price.

Let's see how we can implement this solution using procedural style of
programming.

```rb
 # This is an input to the program.
 # Let's assume that the age of the person is 12.
age = 12

FULL_PRICE = 20
DISCOUNT_IN_PERCENTAGE_FOR_YOUNG = 20

def is_young
  age < 18 ? true : false
end

new_price = is_young ? FULL_PRICE * (1 - (DISCOUNT_IN_PERCENTAGE_FOR_YOUNG.to_f/100)) : FULL_PRICE

puts "The price of ticket for a #{age} years old person will be $#{new_price}."
```

In the above case we have a method called `is_young`. It's a bit of
simplification but in the older programming languages it is also called
subroutines or procedures. This is why this style of programming is called
"procedural style" because this style makes use of procedures.

In the Object Oriented World we would solve the same problem using classes.
Let's now solve the same problem using Object Oriented style.

```rb
class Person
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def is_young
    age < 18
  end
end

class Ticket
  FULL_PRICE = 20
  DISCOUNT_IN_PERCENTAGE_FOR_YOUNG = 20
  attr_reader :person

  def initialize(person)
    @person = person
  end

  def price
    person.is_young ? FULL_PRICE * (1 - (DISCOUNT_IN_PERCENTAGE_FOR_YOUNG.to_f / 100)) : FULL_PRICE
  end
end

age = 12
person = Person.new(12)
ticket = Ticket.new(person)
puts "The price of ticket for a #{age} years old person will be $#{ticket.price}.
```

Both the style of programming gets the work done. However the procedural style
takes only 11 lines of code while the object oriented style takes a whopping 30
lines of code.

At this time it might seem that procedural style of programming is better. It's
shorter and it's easier to follow.

## Summer break and more discounts

Our park is doing well and after a few months of the opening of the park we got
the following requirements.

- All folks above the age of 60 should have 10% discount.
- All Adults will get 5% discount but only on Tuesdays.
- During summer break (month of June) people below the age of 18 will get an
  additional 10% discount.

Let's incorporate the above requirements in the procedural style first.

```rb
require "date"
age = 12

FULL_PRICE = 20
DISCOUNT_IN_PERCENTAGE_FOR_YOUNG = 20
DISCOUNT_IN_PERCENTAGE_FOR_ADULT_ON_TUESDAY = 5
DISCOUNT_IN_PERCENTAGE_FOR_SENIOR = 10
DISCOUNT_IN_PERCENTAGE_FOR_YOUNG_IN_SUMMER = 10

def is_young
  age < 18 ? true : false
end

def is_adult
  ((age >= 18) && (age < 60)) ? true : false
end

def is_senior
  age >= 60 ? true : false
end

def is_today_tuesday?
  Date.today.strftime("%A").downcase == "tuesday"
end

def is_current_month_june?
  Date.today.strftime("%B").downcase == "june"
end

def discounted_price(discount_in_percentage)
  FULL_PRICE * (1 - (discount_in_percentage.to_f/100))
end

new_price = FULL_PRICE

if is_young
  new_price = discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_YOUNG)

  if is_current_month_june?
    new_price = new_price * (1 - DISCOUNT_IN_PERCENTAGE_FOR_YOUNG_IN_SUMMER/100)
  end
end

if is_senior
  new_price = discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_SENIOR)
end

if is_adult && is_today_tuesday?
  new_price = discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_ADULT_ON_TUESDAY)
end

puts "The price of ticket for a #{age} years old person will be $#{new_price}."
```

Here is the Object Oriented version.

```rb
require 'date'

class Person
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def is_young
    age < 18
  end

  def is_adult
    (age >= 18) && (age < 60) ? true : false
  end

  def is_senior
    age > 60
  end
end

class Ticket
  FULL_PRICE = 20
  DISCOUNT_IN_PERCENTAGE_FOR_YOUNG = 20
  DISCOUNT_IN_PERCENTAGE_FOR_ADULT_ON_TUESDAY = 5
  DISCOUNT_IN_PERCENTAGE_FOR_SENIOR = 10
  DISCOUNT_IN_PERCENTAGE_FOR_YOUNG_IN_SUMMER = 10

  attr_reader :person

  def initialize(person)
    @person = person
  end

  def price
    if person.is_young && is_current_month_june?
      new_price = discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_YOUNG + DISCOUNT_IN_PERCENTAGE_FOR_YOUNG_IN_SUMMER)
    elsif person.is_young
      discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_YOUNG)
    elsif person.is_senior
      discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_SENIOR)
    elsif person.is_adult && is_today_tuesday?
      discounted_price(DISCOUNT_IN_PERCENTAGE_FOR_ADULT_ON_TUESDAY)
    end
  end

  private

  def discounted_price(discount_in_percentage)
    FULL_PRICE * (1 - (discount_in_percentage.to_f / 100))
  end

  def is_today_tuesday?
    Date.today.strftime('%A').downcase == 'tuesday'
  end

  def is_current_month_june?
    Date.today.strftime('%B').downcase == 'june'
  end
end

age = 12
person = Person.new(12)
ticket = Ticket.new(person)
puts "The price of ticket for a #{age} years old person will be $#{ticket.price}."

```

Notice that in the Procedural style we keep adding methods as we need them
because of its top down approach.

In the Object Oriented style we have a place for everything. Anything that has
to do with the attributes of a person will go to the `Person` class and anything
that has to do with ticket and pricing will go to the `Ticket` class.

In the Object Oriented style if the complexity in the `Ticket` class grows too
much the we can create a new classes to take some load off of the `Ticket`
class.

## Group buying and reservations

A few months later we got some new requirements.

- People should be able buy tickets online for future date. It means now we need
  to deal with reservation. People should be able to cancel the reservations.
- Park has limited parking facility and now folks can also reserve parking spot.
- Park has started offering group purchase. If a group of 10 people buy the
  tickets together then there is 20% discount. If the group consists of 20
  people or more than there is 25% discount.

As we can see the complexity in the logic keeps increasing.

In a procedural style because of its top down approach we will have many methods
all one after another and soon things will be less manageable.

In the Object Oriented style we can create new classes like `Reservation`,
`GroupPurchase`, `Parking` to manage such complexities.
