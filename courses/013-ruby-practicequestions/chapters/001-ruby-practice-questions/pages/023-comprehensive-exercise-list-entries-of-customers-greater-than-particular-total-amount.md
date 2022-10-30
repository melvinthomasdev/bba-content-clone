Finish the method definition below.

`customers` is an array of hashes, each of which has three keys: "name", "owes" and "debts". "debts" again stores an array of hashes, each of which has three keys: "amount", "date" and "customer".

Given `customers` and a certain `amount`, the method should return a list of all debt entries of customers who owe more than `amount`.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def get_entries(customers, amount)
  # write your code here
end
</code>

<solution>
def get_entries(customers, amount)
  customers_list = customers.select { |entry| entry["owes"] > amount }
  customers_list.map  { |customer| customer["debts"] }.flatten
end
</solution>

<testcases>
<caller>
puts get_entries(customers, amount)
</caller>
<testcase>
<i>
customers = [
  {
    "name"=> "Alan",
    "owes"=> 30000,
    "debts"=> [
      {
        "amount"=> 10000,
        "date"=> "28-June-2020",
        "customer"=> "Alan"
      },
      {
        "amount"=> 20000,
        "date"=> "30-June-2020",
        "customer"=> "Alan"
      },
      {
        "amount"=> 5000,
        "date"=> "5-July-2021",
        "customer"=> "Alan"
      }
    ]
  },
  {
    "name"=> "Eric",
    "owes"=> 60000,
    "debts"=> [
      {
        "amount"=> 30000,
        "date"=> "28-June-2020",
        "customer"=> "Eric"
      },
      {
        "amount"=> 20000,
        "date"=> "30-June-2020",
        "customer"=> "Eric"
      },
      {
        "amount"=> 10000,
        "date"=> "5-July-2021",
        "customer"=> "Eric"
      }
    ]
  },
  {
    "name"=> "John",
    "owes"=> 90000,
    "debts"=> [
      {
        "amount"=> 45000,
        "date"=> "28-June-2020",
        "customer"=> "John"
      },
      {
        "amount"=> 25000,
        "date"=> "30-June-2020",
        "customer"=> "John"
      },
      {
        "amount"=> 20000,
        "date"=> "5-July-2021",
        "customer"=> "John"
      }
    ]
  },
  {
    "name"=> "Juan",
    "owes"=> 95000,
    "debts"=> [
      {
        "amount"=> 35000,
        "date"=> "28-June-2020",
        "customer"=> "Juan"
      },
      {
        "amount"=> 45000,
        "date"=> "30-June-2020",
        "customer"=> "Juan"
      },
      {
        "amount"=> 15000,
        "date"=> "5-July-2021",
        "customer"=> "Juan"
      }
    ]
  }
]
amount = 85000
</i>
</testcase>
<testcase>
<i>
customers = [
  {
    "name"=> "Alan",
    "owes"=> 30000,
    "debts"=> [
      {
        "amount"=> 10000,
        "date"=> "28-June-2020",
        "customer"=> "Alan"
      },
      {
        "amount"=> 20000,
        "date"=> "30-June-2020",
        "customer"=> "Alan"
      },
      {
        "amount"=> 5000,
        "date"=> "5-July-2021",
        "customer"=> "Alan"
      }
    ]
  },
  {
    "name"=> "Eric",
    "owes"=> 60000,
    "debts"=> [
      {
        "amount"=> 30000,
        "date"=> "28-June-2020",
        "customer"=> "Eric"
      },
      {
        "amount"=> 20000,
        "date"=> "30-June-2020",
        "customer"=> "Eric"
      },
      {
        "amount"=> 10000,
        "date"=> "5-July-2021",
        "customer"=> "Eric"
      }
    ]
  },
  {
    "name"=> "John",
    "owes"=> 90000,
    "debts"=> [
      {
        "amount"=> 45000,
        "date"=> "28-June-2020",
        "customer"=> "John"
      },
      {
        "amount"=> 25000,
        "date"=> "30-June-2020",
        "customer"=> "John"
      },
      {
        "amount"=> 20000,
        "date"=> "5-July-2021",
        "customer"=> "John"
      }
    ]
  },
  {
    "name"=> "Juan",
    "owes"=> 95000,
    "debts"=> [
      {
        "amount"=> 35000,
        "date"=> "28-June-2020",
        "customer"=> "Juan"
      },
      {
        "amount"=> 45000,
        "date"=> "30-June-2020",
        "customer"=> "Juan"
      },
      {
        "amount"=> 15000,
        "date"=> "5-July-2021",
        "customer"=> "Juan"
      }
    ]
  }
]
amount = 50000
</i>
</testcase>
<testcase>
<i>
customers = [
  {
    "name"=> "Alan",
    "owes"=> 30000,
    "debts"=> [
      {
        "amount"=> 10000,
        "date"=> "28-June-2020",
        "customer"=> "Alan"
      },
      {
        "amount"=> 20000,
        "date"=> "30-June-2020",
        "customer"=> "Alan"
      },
      {
        "amount"=> 5000,
        "date"=> "5-July-2021",
        "customer"=> "Alan"
      }
    ]
  },
  {
    "name"=> "Eric",
    "owes"=> 60000,
    "debts"=> [
      {
        "amount"=> 30000,
        "date"=> "28-June-2020",
        "customer"=> "Eric"
      },
      {
        "amount"=> 20000,
        "date"=> "30-June-2020",
        "customer"=> "Eric"
      },
      {
        "amount"=> 10000,
        "date"=> "5-July-2021",
        "customer"=> "Eric"
      }
    ]
  },
  {
    "name"=> "John",
    "owes"=> 90000,
    "debts"=> [
      {
        "amount"=> 45000,
        "date"=> "28-June-2020",
        "customer"=> "John"
      },
      {
        "amount"=> 25000,
        "date"=> "30-June-2020",
        "customer"=> "John"
      },
      {
        "amount"=> 20000,
        "date"=> "5-July-2021",
        "customer"=> "John"
      }
    ]
  },
  {
    "name"=> "Juan",
    "owes"=> 95000,
    "debts"=> [
      {
        "amount"=> 35000,
        "date"=> "28-June-2020",
        "customer"=> "Juan"
      },
      {
        "amount"=> 45000,
        "date"=> "30-June-2020",
        "customer"=> "Juan"
      },
      {
        "amount"=> 15000,
        "date"=> "5-July-2021",
        "customer"=> "Juan"
      }
    ]
  }
]
amount = 35000
</i>
</testcase>
</testcases>
</Editor>