Run the following code and then
change the code so that the error goes away.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class House
  def building_number(new_number)
  end

  def info
    puts "The building number is #{}"
  end
end

house = House.new
house.building_number("A872")
house.info
</code>

<solution>
class House
  def building_number(new_number)
    @number = new_number
  end

  def info
    puts "The building number is #{@number}"
  end
end

house = House.new
house.building_number("A872")
house.info
</solution>
</codeblock>