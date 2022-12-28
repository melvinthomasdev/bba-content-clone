To accept arguments to our class-based decorator, we would have to make subtle changes because of the following issues.

1. The `__init__` method will now receive the decorator argument and not the function.
2. The function will be passed as the first argument to `__call__`.
3. The function arguments will be received in a nested function.

<codeblock language="python" type="lesson">
<code>
'''Expand abbreviations in a sentence i.e lol -> Laughing out Loud'''

class AbbvExpander:
  def __init__(self, mapping): # <-- Decorator argument received
    self.mapping = mapping

  def __call__(self, fn): # <-- __call__ received function argument
    def wrapper(*args): # <-- function arguments received in arg

      string, *_ = args

      # Replace abbreviations with full forms in string
      for abb, full_form in self.mapping.items():
        string = string.replace(abb, full_form)

      # call the funtion
      return fn(string)

    return wrapper


abbv = {
  "ttyl": "Talk to you later",
  "omg": "Oh my God!",
  "gtg": "got to go"
}

@AbbvExpander(abbv) # <-- abbv passed to decorator as argument
def display(sentence):
  print(sentence) # <-- modified sentence is printed

display("omg that's so funny. Anyways I gtg. ttyl okay.")
</code>
</codeblock>

In the snippet above, we are using the `AbbvExpander` decorator on display. We pass it an abbreviation dictionary containing the full forms of common internet slang. These are received within the `__init__` method in the decorator class. The `display()` function is received as an argument in the `__call__` method. We define a wrapper function within the `__call__ `method that will receive the sentence and process it accordingly.

