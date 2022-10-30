Run the following code and then
change the code so that the error goes away.

<Editor lang="ruby" type="exercise">
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
</Editor>