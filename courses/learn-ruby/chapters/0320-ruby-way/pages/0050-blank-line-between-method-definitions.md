Have **one blank line
and only one
blank line** between
two method definitions.

<codeblock language="ruby" type="lesson">
<code>
# WRONG - no blank line
class LogAnalyzer
  def initialize
  end
  def process
  end
end

# WRONG - two blank lines
class LogAnalyzer
  def initialize
  end


  def process
  end
end

# CORRECT - only one blank line
class LogAnalyzer
  def initialize
  end

  def process
  end
end
</code>
</codeblock>