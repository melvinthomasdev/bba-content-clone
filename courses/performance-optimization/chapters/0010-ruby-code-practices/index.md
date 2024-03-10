## Use push operator over overload operator

Refrain use of overload addition (+=) ruby operator. Instead, replace it with the push (<<) operator for strings and arrays.

<image>overload-vs-push-benchmark.png</image>

```ruby
# Do's
key = "activity.ticket.tags."
key << "update" if tags_to_add.present? && tags_to_remove.present?

# Don't
key = "activity.ticket.tags."
key += "update" if tags_to_add.present? && tags_to_remove.present?
```

```ruby
# Do's
message = "Assigned to"
message << "agent #{user.name}" if user

# Don't
message = "Assigned to"
message += "agent #{user.name}" if user
```

## Correct use of bang methods

Use In-Place updates(destructive operations) selectively to save copying overhead.

Unlike the Rails bang methods, the ruby bang methods perform an action and change the object, returning the modified object as a result i.e. object mutation, so they are often termed as mutator/dangerous methods.

Usage condition - If the original object is not required multiple times in codebase then ruby destructive methods can be used, instead of their simple copying counterparts.

| Class              | Copying            | Destructive        |
|--------------------| :----------------: | :----------------: |
| String             | #+                 | #<<                |
| String             | #sub               | #sub!              |
| String             | #gsub              | #gsub!             |
| Hash               | #merge             | #merge!            |
| Array              | #+                 | #concat            |
| Array              | #map               | #map!              |
| Array              | #compact           | #compact!          |
| Array              | #uniq              | #uniq!             |
| Array              | #flatten           | #flatten!          |

Use Case:

1. Where altering original variable content does not affect the logic

    ```ruby
    # Do's
    message = "Assigned to me"
    message.gsub!('to', 'by').gsub!('me', 'him')
    # message contains "Assigned by him"

    # Don't
    message = "Assigned to me"
    message = message.gsub('to', 'by')
    message = message.gsub('me', 'him')
    ```

2. Refrain usage where altering original variable content affects the logic

    ```ruby
    # Do's
    message = "Assigned to me"
    updated_message = message.gsub('me', 'him')

    # Here message value contains "Assigned to me"
    if message == "Assigned to me"

    # Don't
    message = "Assigned to me"
    message.gsub!('me', 'him')
    # message contains "Assigned by him"

    # Here message value no more contains "Assigned to me" instead has
    # "Assigned to him"
    if message == "Assigned to me"
    ```

## Avoid comparison of BigDecimal with integer or string

```ruby
# Do's
if BigDecimal("3.12456") <=> BigDecimal("5.12456")

# Don't
if BigDecimal("3.12456") <=> 5.12456
```

## Use String Interpolation instead of + operator

```ruby
# Do's
response_token = "sha256=#{Base64.encode64(hash).strip!}"

# Don't
response_token = "sha256=" + Base64.encode64(hash).strip!
```

## Correct use of reader and accessors

Apply reader and accessors correctly, based on usage within or outside the class.

Use case 1 -
Redundant use of attr_accessors although setters are not used within/outside class

```ruby
# Do's
# Use case when method(getter) is accessed outside the class
class Tickets::MergeService
  attr_reader :response

#...
  def secondary_tickets
    # using instance variable for organization and options
    @_secondary_tickets ||= @organization.tickets
      .includes(:organization, requester: :role, latest_comment: { ticket: [:response_time, :email_configuration] })
      .where(id: @options[:secondary_ticket_ids])
  end
end

class Api::V1::Desk::MergeTicketsController < Api::V1::BaseController
  #...

  def create
    service = Tickets::MergeService.new(@ticket, current_user, merge_params)
    service.process

    render service.response
  end

  #...
end


# Don't
# Here no setters are required outside the class, and just getter for response is required
class Tickets::MergeService
  attr_accessor :primary_ticket, :organization, :user, :options, :errors, :response

  #...
  def secondary_tickets
    # getters only used for organization and options
    @_secondary_tickets ||= organization.tickets
        .includes(:organization, requester: :role, latest_comment: { ticket: [:response_time, :email_configuration] })
        .where(id: options[:secondary_ticket_ids])
  end
end

class Api::V1::Desk::MergeTicketsController < Api::V1::BaseController
  #...

  def create
    service = Tickets::MergeService.new(@ticket, current_user, merge_params)
    service.process

    # getter used for response
    render service.response
  end

  #...
end
```

Use case 2 -
Use of Instance variable instead of accessors, when public method access is not required

```ruby
# Do's
# Use case when method(getter) is accessed outside the class
class Tickets::MergeService
  attr_reader :response

  #...
  def secondary_tickets
    # using instance variable for organization and options
    @_secondary_tickets ||= @organization.tickets
        .includes(:organization, requester: :role, latest_comment: { ticket: [:response_time, :email_configuration] })
        .where(id: @options[:secondary_ticket_ids])
  end
end

class Api::V1::Desk::MergeTicketsController < Api::V1::BaseController
  #...

  def create
    service = Tickets::MergeService.new(@ticket, current_user, merge_params)
    service.process

    # getter used for response
    render service.response
  end

  #...
end


# Don't
# Here no setters or getters are required within/outside the class
class Tickets::MergeService
  attr_accessor :primary_ticket, :organization, :user, :options, :errors, :response

#...
  def secondary_tickets
    @_secondary_tickets ||= @organization.tickets
        .includes(:organization, requester: :role, latest_comment: { ticket: [:response_time, :email_configuration] })
        .where(id: @options[:secondary_ticket_ids])
  end
end

class Api::V1::Desk::MergeTicketsController < Api::V1::BaseController
  #...

  def create
    service = Tickets::MergeService.new(@ticket, current_user, merge_params)

    # outside the class no getter/setter is consumed
    service.process

    render json: { notice: "Tickets merged successfully" }, status: :ok
  end

  #...
end
```

## Optimize use of constants

Optimize access to Global constants through use of namespace operator `::` in front of constant.

```ruby
# Do's
def get_placeholders_carrier(object)
  ::Placeholders::VariablesCarrier.new(object)
end

# Don't
def get_placeholders_carrier(object)
  Placeholders::VariablesCarrier.new(object)
end
```

## Use constant declaration for temporary data structures

Using constant declaration for temporary data structures like Array, which are not going to be changed overtime.

```ruby
# Do's
VIEW_TICKET_PERMISSIONS = [
  "desk.manage_own_tickets",
  "desk.view_tickets",
  "desk.reply_add_note_to_tickets",
  "desk.manage_tickets"
]

def can_view_tickets?
  has_permission?(VIEW_TICKET_PERMISSIONS)
end

# Don't
def can_view_tickets?
  has_permission?(
    [
        "desk.manage_own_tickets",
        "desk.view_tickets",
        "desk.reply_add_note_to_tickets",
        "desk.manage_tickets"
    ]
  )
end
```
## Use blocks instead of Symbol.to_proc

<image>SymbolProc-vs-blocks.png</image>

## Order under different cases

1. Most frequent case shall be added first
2. If all cases are equally frequent, prefer sorting in increasing order of computation

```ruby
# Do's
# Here if status > priority > email_configuration_id is the order of frequently occurring condition.field # then ordering the case as follows
case condition.field
when "status"
  find_status
when "priority"
  find_priority
when "email_configuration_id"
  find_email_configuration&.forward_to_email
else
  condition.value
end

# Don't
case condition.field
when "email_configuration_id"
  find_email_configuration&.forward_to_email
when "priority"
  find_priority
when "status"
  find_status
else
  condition.value
end
```
## Avoid operations which clear Ruby's method cache
Dynamic language implementations use 'inline method caching', which avoid expensive method lookups frequently. But some the below given methods invalidates the method caching, so avoiding them at runtime is critical to writing fast Ruby code.

    - Aliasing or removing methods (Module#alias_method and Module#remove_method): Aliasing and removing methods invalidates the method caches
    - Setting and removing constants (#const_set and #remove_const)
    - Changing constant visibility (Module#private_constant and Module#public_constant)
    - Module including, prepending and extending and Object#extend
      Prefer #include over #extend for better performance
    - Marshal loading an extended object (Marshal.load)
    - Garbage collecting a class or module (GS.start)

Use case:

Redundant `define_method` usage when they are non-runtime dependent method definitions and can be declared before-hand.

```ruby
# Do's
def users
  Arel::Table.new(:users)
end

def organizations
  Arel::Table.new(:organizations)
end

# Don't
[:users, :organizations].each do |method|
  define_method(method) do
    Arel::Table.new(method)
  end
end
```

## Cache data in variables

1. Cache Data in Instance Variables

<image>caching-data-instance-vars.png</image>

<image>general-caching-practice-example.png</image>

2. Cache Data in Class Variables for large persisting data

<image>caching-data-class-vars.png</image>

3. Use constants to store database results to avoid hitting db frequently

<image>constants-for-db-data.png</image>

## Use ActiveSupport::Memoizable for memoization of expensive operations

<image>active-support-memoizable.png</image>

## Initialize variable with nil

Instance variables already default to nil.

```ruby
# Do's
@status = "available" if @organization.request_in_business_hours?

# Don't
@status = nil
@status = "available" if @organization.request_in_business_hours?
```

## Use conditionals directly in place of .nil?

Avoiding method overhead call by directly using `if user` instead of `if user.nil?`

```ruby
# Do's
condition.value ? OrganizationRole.find(condition.value).name : "Customer"

# Don't
condition.value.nil? ? "Customer" : OrganizationRole.find(condition.value).name
```

Based on user-to-user preference over unless vs if readability following changes can be done

```ruby
# Performs better than additional if .nil? usage
unless @ticket

# Minor performance drawback but better readability
if @ticket.nil?
```

## Use blank? in place of empty? or nil?

Since blank? checks for both case of value to be nil or empty, it's better to use blank? in such cases.

```ruby
# Do's
return true if sort_by_column.blank?

# Don't
return true if sort_by_column.nil? || sort_by_column.empty?
```

## Set over Array

Preference of Set over Array for search(include?) and cluster operations(uniq, |, &)

```ruby
# Do's
SUPPORTED_VERB_CONDITIONS = Set[
    "is", "is_not", "contains", "does_not_contain", "starts_with",
    "ends_with", "contains_any_of", "contains_all_of", "contains_none_of",
    "less_than", "greater_than", "during", "not_during", "any_time",
    "is_before", "is_after"
].freeze

# Performing search or cluster operation
SUPPORTED_VERB_CONDITIONS.include? verb

# Don't
SUPPORTED_VERB_CONDITIONS = [
    "is", "is_not", "contains", "does_not_contain", "starts_with",
    "ends_with", "contains_any_of", "contains_all_of", "contains_none_of",
    "less_than", "greater_than", "during", "not_during", "any_time",
    "is_before", "is_after"
]

# Performing search or cluster operation
SUPPORTED_VERB_CONDITIONS.include? verb
```

## Avoid repeated Hash access

```ruby
# Not preferred
options[:group] ||= {}
options[:group][:id] = user.group&.id
options[:group][:name] = "random"
options[:group][:description] = "Lorem Ipsum"

# Preferred
group = (options[:group] ||= {})
group[:id] = user.group&.id
group[:name] = "random"
group[:description] = "Lorem Ipsum"
```

## Extend classes vs reopen classes vs mixin usage

Extending a class is slower compared to opening the class or using mix-in.

```ruby
# Do's
class SlackIntegration
    def slack_disconnect
        puts 'Slack disconnected successfully!'
    end
end

#Reopening
class SlackIntegration
    def slack_connected
        puts 'Slack connected successfully!'
    end
end

# Results of Opening a class and including are comparable in benchmarks for recent ruby versions

module SlackIntegrable
    def slack_connected
        puts 'Slack connected successfully!'
    end
end

class SlackIntegration
    include SlackIntegrable

    def slack_disconnect
        puts 'Slack disconnected successfully!'
    end
end

# Don't
class SlackIntegration
    extend SlackIntegrable
end
```

## Freeze constant data

Constant data including arrays and hashes, should be freezed if they are just accessed and not mutated in codebase.

All string will already be freezed by rubocop, so freezing them is not required.

```ruby
# Do's
MANAGE_TICKET_PERMISSIONS = [
    "desk.manage_own_tickets",
    "desk.reply_add_note_to_tickets",
    "desk.manage_tickets"
].freeze

ALLOWED_POINT_SCALE_CHOICE_SLUG = {
    "Great" => "happy",
    "Okay" => "neutral",
    "Not Good" => "unhappy"
}.freeze

# Don't
MANAGE_TICKET_PERMISSIONS = [
    "desk.manage_own_tickets",
    "desk.reply_add_note_to_tickets",
    "desk.manage_tickets"
]

ALLOWED_POINT_SCALE_CHOICE_SLUG = {
    "Great" => "happy",
    "Okay" => "neutral",
    "Not Good" => "unhappy"
}

```
