Keep **one blank line
and
only one blank line**
between two classes.

<Editor lang="ruby">
<code>
# WRONG - no blank line
class LogAnalyzer
  def process
  end
end
class Performance
  def initialize
  end
end

# WRONG - two blank lines
class LogAnalyzer
  def process
  end
end


class Performance
  def initialize
  end
end

# CORRECT - only one blank line
class LogAnalyzer
  def process
  end
end

class Performance
  def initialize
  end
end
</code>
</Editor>