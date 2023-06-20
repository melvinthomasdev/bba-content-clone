Add a class level instance
variable `employee_count`
with a value of *2* in
the `Employee` class.

Additionally, add an instance
method `print_employee_count`
which displays the value of
the variable `employee_count`
on the console.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Employee
  # Write your code here
end

employee_1 = Employee.new
employee_1.print_employee_count
</code>
<solution>
class Employee
  @@employee_count = 2

  def print_employee_count
    puts @@employee_count
  end
end

employee_1 = Employee.new
employee_1.print_employee_count
</solution>
</codeblock>
