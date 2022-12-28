There is a boxing match between two boxers. We need to print
the names of both the boxers. Run the following code and you will get error.
Please change the code so that the error goes away.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class BoxingMatch
  def info
    puts "This boxing match is between #{person1} and #{person2} "
  end
end

match = BoxingMatch.new
match.info("Peter", "Larry")
</code>

<solution>
class BoxingMatch
  def info(person1, person2)
    puts "This boxing match is between #{person1} and #{person2} "
  end
end

match = BoxingMatch.new
match.info("Peter", "Larry")
</solution>
</codeblock>