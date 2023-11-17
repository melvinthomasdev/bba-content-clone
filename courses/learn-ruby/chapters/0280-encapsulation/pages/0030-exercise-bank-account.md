Consider the provided `BankAccount` class and its access control levels: 
public, protected, and private. 

Your task is to implement the `withdraw` method and the 
`sufficient_funds?` method in the `BankAccount` class. 

The `withdraw` method should adjust the account balance by subtracting 
the withdrawal amount if there are sufficient funds as determined by the 
`sufficient_funds?` method. Make the `withdraw` method a protected 
method, restricting direct access from outside the class.

The `sufficient_funds?` method should return a boolean value based on 
whether the account has sufficient funds for the intended withdrawal. 
Define the `sufficient_funds?` method as private to restrict its access 
to the object's context only.

Additionally, you need to define a secondary `withdraw` method in the 
`SavingsAccount` class, allowing a withdrawal of up to `$1000` at a time.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class BankAccount
  def initialize(account_number, balance)
    @account_number = account_number
    @balance = balance
  end

  def display_balance
    puts "Account Number: #{@account_number}"
    puts "Balance: $#{@balance}"
  end

  protected

  private

end

class SavingsAccount < BankAccount
end

account = SavingsAccount.new("123456789", 5000)
account.display_balance
account.withdraw(500)
account.display_balance
</code>

<solution>
class BankAccount
  def initialize(account_number, balance)
    @account_number = account_number
    @balance = balance
  end

  def display_balance
    puts "Account Number: #{@account_number}"
    puts "Balance: $#{@balance}"
  end

  protected

    def withdraw(amount)
      @balance -= amount if sufficient_funds?(amount)
    end

  private

    def sufficient_funds?(amount)
      amount <= @balance
    end
end

class SavingsAccount < BankAccount
  def withdraw(amount)
    super(amount) if amount <= 1000
  end
end

account = SavingsAccount.new("123456789", 5000)
account.display_balance
account.withdraw(500)
account.display_balance
</solution>
</codeblock>