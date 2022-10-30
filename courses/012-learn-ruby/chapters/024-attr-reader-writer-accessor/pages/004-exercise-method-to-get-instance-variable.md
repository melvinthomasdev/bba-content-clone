Change the following code so
that we can access the
instance variables inside
the **dreams_bottled** book instance.

<Editor lang="ruby" type="exercise">
<code>
class Book
  def initialize(type, pages, cover)
    @type = type
    @pages = pages
    @cover = cover
  end
end

dreams_bottled = Book.new("fiction", 542, "softcover")
puts dreams_bottled.type
puts dreams_bottled.pages
puts dreams_bottled.cover
</code>

<solution>
class Book
  attr_reader :type, :pages, :cover
  def initialize(type, pages, cover)
    @type = type
    @pages = pages
    @cover = cover
  end
end

dreams_bottled = Book.new("fiction", 542, "softcover")
puts dreams_bottled.type
puts dreams_bottled.pages
puts dreams_bottled.cover
</solution>
</Editor>