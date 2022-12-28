Finish the method definition below.

`employee_details_at_joining` is a hash that contains details of an employee.

Given `employee_details_at_joining`, the method should calculate a new hash `updated_employee_details` that contains the same data as `employee_details_at_joining` but with the following changes:

1. the `experience` value should incremented by 1 if it exists, otherwise a new key `experience` with value 1 should be added to the hash.
2. a new key `age` should be added, calculated from `year_of_birth` key.

<br/>
The method should then return a new hash containing both `employee_details_at_joining` and `updated_employee_details` in this format:


```
// return format:
{
  employee_details_at_joining, updated_employee_details
}
```

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def update_employee_details(employee_details_at_joining)
 # write your code here
end
</code>

<solution>
def update_employee_details(employee_details_at_joining)
  employee_age = Time.now.year - employee_details_at_joining["year_of_birth"]
  employee_experience = employee_details_at_joining["experience"] ?
    employee_details_at_joining["experience"] + 1 : 1

  updated_details = {
    employee_details_at_joining: employee_details_at_joining,
    updated_employee_details: employee_details_at_joining.merge({
      age: employee_age,
      experience: employee_experience
    })
  }
end
</solution>

<testcases>
<caller>
puts update_employee_details(employee_details_at_joining)
</caller>
<testcase>
<i>
employee_details_at_joining = {
  "user_id"=> 1,
  "full_name"=> 'Hercule Poirot',
  "first_name"=> "Hercule",
  "last_name"=> "Poirot",
  "experience"=> 2,
  "year_of_birth"=> 1990,
  "phone_number"=> "203203",
  "email"=> "whitehaven.mansions@example.com"
}
</i>
</testcase>
<testcase>
<i>
employee_details_at_joining = {
  "user_id"=> 2,
  "full_name"=> 'John Doe',
  "first_name"=> "John",
  "last_name"=> "Doe",
  "year_of_birth"=> 1995,
  "phone_number"=> "010101",
  "email"=> "nowhere@example.com"
}
</i>
</testcase>
</testcases>
</codeblock>