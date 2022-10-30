You are the administrator of a social networking website. Your manager has asked you to ban some accounts from logging in to the website as they have violated some of the policies of the website.

Below you are given the banned accounts list which contains a list of banned usernames and a `login()` function which takes in the username and password. Modify the `FilterAccounts` decorator to check if the `username` passed to login is present in the banned accounts list. If it is print **`USERNAME` is banned** else continue by calling the login function with the arguments.


<Editor lang="python" type="exercise">
<code>
banned_accounts = [
  "razorrip341",
  "@stronaut_live",
  "faltu_mann"
]

class FilterAccounts:

# Modify __init__ to accept banned accounts list
  def __init__(self):
#   Uncomment and assign banned list to self.banned below
#     self.banned =

#   Modify __call__ to accept function
  def __call__(self):
    # Create wrapper function which checks if username is banned
    # Print {username} is banned and return if banned
    # Call function if not banned

# Pass banned accounts to FilterAccounts
@FilterAccounts
def login(username, password):
  print(f"Logging into {username}")

login("uman23", "password123")
login("faltu_mann", "password212")
login("@stronaut_live", "password422")
</code>

<solution>
banned_accounts = [
  "razorrip341",
  "@stronaut_live",
  "faltu_mann"
]

class FilterAccounts:
  def __init__(self, banned_list):
    self.banned = banned_list

  def __call__(self, function):
    def wrapper(*args):
      username, _ = args
      if username in self.banned:
        print(f"{username} is banned")
      else:
        return function(*args)
    return wrapper

@FilterAccounts(banned_accounts)
def login(username, password):
  print(f"Logging into {username}")

login("uman23", "password123")
login("faltu_mann", "password212")
login("@stronaut_live", "password422")
</solution>
</Editor>