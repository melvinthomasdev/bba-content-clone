Inheritance allows us to overwrite the methods and data from the parent class. We could add new functionality in the child class for the same method.

<Editor lang="python">
<code>
class Phone:
  """
  Parent Class
  """
  def send_email(self, email_id):
    print(f"Sending an email to {email_id} via Email")

class IPhone(Phone):
  """
  Child Class
  """
  def send_email(self, email_id): # <-- Child class with same method name and args as parent class
    print(f"Sending an email to {email_id} via Apple Mail")

print("Calling Phone methods")
phone = Phone()
phone.send_email("abc@gmail.com") # <-- Called from Parent class

print()

print("Calling iPhone methods")
iphone = IPhone()
iphone.send_email("abc@gmail.com") # <-- Overwritten method called from Child class
</code>
</Editor>

In the example above we have overwritten the `.send_email()` method to send email using Apple Mail when using iPhone.

