## Usage of push operator over overload operator

Avoid the usage of overload addition (+=) ruby operator. Instead, replace it with the push operator (<<) for strings and arrays.

```ruby
test_string = "Lorem ipsum " * 1e6
test_array = [10] * 1e6

# Don't
test_string += "github"
test_array += [10]

# Do's
test_string << "github"
test_array << [10]

# Benchmarking results

Benchmark.realtime { test_string += "github" } # 0.018063999712467194
Benchmark.realtime { test_string << "github" } # 0.001041000708937645

Benchmark.realtime { test_array += [10] } # 0.02358900010585785
Benchmark.realtime { test_array << [10] } # 0.001017000526189804
```

```ruby
# Don't
key = "activity.ticket.tags."
key += "update" if tags_to_add.present? && tags_to_remove.present?

# Do's
key = "activity.ticket.tags."
key << "update" if tags_to_add.present? && tags_to_remove.present?
```

```ruby
# Don't
message = "Assigned to"
message += "agent #{user.name}" if user

# Do's
message = "Assigned to"
message << "agent #{user.name}" if user
```

## Correct usage of bang methods

Usage of In-Place updates (destructive operations) selectively to save copying overhead.

Unlike the Rails bang methods, the Ruby bang methods perform an action and change the object. They return the modified object as a result. This is object mutation, so they are often termed as mutator/dangerous methods.

Usage condition - If the original object is not required multiple times in the codebase, then Ruby destructive methods can be used, instead of their simple copying counterparts.

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

<br>

<h3>Here are the use cases:</h3>

<h4> Where altering original variable content does not affect the logic </h4>

  ```ruby
    # Don't
    message = "Assigned to me"
    message = message.gsub('to', 'by')
    message = message.gsub('me', 'him')

    # Do's
    message = "Assigned to me"
    message.gsub!('to', 'by').gsub!('me', 'him')
    # message contains "Assigned by him"
  ```

<h4> Refrain usage where altering original variable content affects the logic </h4>

  ```ruby
    # Don't
    message = "Assigned to me"
    message.gsub!('me', 'him')
    # message contains "Assigned by him"

    # Here message value no more contains "Assigned to me" instead has
    # "Assigned to him"
    if message == "Assigned to me"

    # Do's
    message = "Assigned to me"
    updated_message = message.gsub('me', 'him')

    # Here message value contains "Assigned to me"
    if message == "Assigned to me"
  ```

## Avoid comparison of BigDecimal with integer or string

```ruby
# Don't
if BigDecimal("3.12456") <=> 5.12456

# Do's
if BigDecimal("3.12456") <=> BigDecimal("5.12456")
```

## Usage of String Interpolation instead of + operator

```ruby
# Don't
response_token = "sha256=" + Base64.encode64(hash).strip!

# Do's
response_token = "sha256=#{Base64.encode64(hash).strip!}"
```

## Correct usage of reader and accessors

Apply reader and accessors correctly, based on usage within or outside the class.

<h3>Here are the use cases:</h3>

<h4>Redundant usage of attr_accessors although setters are not used within/outside class.</h4>

```ruby
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

# Do's
# Use case when method (getter) is accessed outside the class
class Tickets::MergeService
  attr_reader :response

#...
  def secondary_tickets
    # use instance variable for organization and options
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

# Do's
# Use case when method (getter) is accessed outside the class
class Tickets::MergeService
  attr_reader :response

#...
  def secondary_tickets
    # use instance variable for organization and options
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
```

<h4>Usage of Instance variable instead of accessors, when public method access is not required</h4>

```ruby
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

# Do's
# Use case when method (getter) is accessed outside the class
class Tickets::MergeService
  attr_reader :response

  #...
  def secondary_tickets
    # use instance variable for organization and options
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
```

## Optimize usage of constants

Optimize access to Global constants through usage of namespace operator `::` in front of constant.

```ruby
# Don't
def get_placeholders_carrier(object)
  Placeholders::VariablesCarrier.new(object)
end

# Do's
def get_placeholders_carrier(object)
  ::Placeholders::VariablesCarrier.new(object)
end
```

## Usage of constant declaration for temporary data structures

Use constant declaration for temporary data structures like Array, which are not going to be changed overtime.

```ruby
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
```
## Usage of blocks instead of Symbol.to_proc

```ruby
  @widget_ids = @widgets.map(&:id) # Symbol.to_proc method, order of magniture slower...
  @widget_ids = @widgets.inject([]) { |w, a| w.push(a.id)} # same effect, not as pretty, but much faster
  @widget_ids = @widgets.collect { |w| w.id } # faster, and simpler than inject
  @widget_ids = @widgets.map { |w| w.id } # yet another (faster) way to tackle the problem
```

## Order under different cases

1. Most frequent case should be added first
2. If all cases are equally frequent, prefer sorting in the increasing order of computation

```ruby
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
```
## Avoid operations which clear Ruby's method cache
Dynamic language implementations use 'inline method caching', which avoid expensive method lookups frequently. But some of the below given methods invalidate the method caching. Avoiding them at runtime is critical to writing fast Ruby code.

    - Aliasing or removing methods (Module#alias_method and Module#remove_method): Aliasing and removing methods invalidates the method caches
    - Setting and removing constants (#const_set and #remove_const)
    - Changing constant visibility (Module#private_constant and Module#public_constant)
    - Module including, prepending and extending and Object#extend
      Prefer #include over #extend for better performance
    - Marshal loading an extended object (Marshal.load)
    - Garbage collecting a class or module (GS.start)

<h3>Here is a use case:</h3>

Redundant `define_method` usage when they are non-runtime dependent method definitions and can be declared before-hand.

```ruby
# Don't
[:users, :organizations].each do |method|
  define_method(method) do
    Arel::Table.new(method)
  end
end

# Do's
def users
  Arel::Table.new(:users)
end

def organizations
  Arel::Table.new(:organizations)
end
```

## Cache data in variables

<h4>Cache Data in Instance Variables</h4>

```ruby
# Don't
def value_names
  ["first_response_time", "resolution_time", "assigned", "resolved"]
end

# Do's
# Better - Caching data in instance variable
def value_names
  @value_names ||= ["first_response_time", "resolution_time", "assigned", "resolved"]
end
```

```ruby
# Don't
@value_names = begin
  # some expensive operation
end unless @value_names

# Do's
@value_names ||= begin
  # some expensive operation
end
```

<h4>Cache Data in Class Variables for large persisting data</h4>

```ruby
def value_names
  @value_names ||= ["first_response_time", "resolution_time", "assigned", "resolved"]
end

# Better - Caching large persisting data in class variables
@@value_names ||= ["first_response_time", "resolution_time", "assigned", "resolved"]

def value_names
  @@value_names
end
```

<h4>Usage of constants to store database results to avoid hitting db frequently</h4>

```ruby
class State < ActiveRecord:: Base
  NAMES_ABBR = self.find(:all).map do { |s| [ s.name,s.abbr] }
end
```

## Usage of ActiveSupport::Memoizable for memoization of expensive operations

```ruby
def total_inventory
  # expensive computations
end

include ActiveSupport::Memoizable

memoize :total_inventory  
```

## Initialize variable with nil

Instance variables already default to nil.

```ruby
# Don't
@status = nil
@status = "available" if @organization.request_in_business_hours?

# Do's
@status = "available" if @organization.request_in_business_hours?
```

## Usage of conditionals directly in place of .nil?

Avoid method overhead call by directly using `if user` instead of `if user.nil?`

```ruby
# Don't
condition.value.nil? ? "Customer" : OrganizationRole.find(condition.value).name

# Do's
condition.value ? OrganizationRole.find(condition.value).name : "Customer"
```

Based on user-to-user preference over unless vs if readability following changes can be done

```ruby
# Performs better than additional if .nil? usage
unless @ticket

# Minor performance drawback but better readability
if @ticket.nil?
```

## Usage of blank? in place of empty? or nil?

Since blank? checks for both cases of value to be nil or empty, it's better to use blank? in such cases.

```ruby
# Don't
return true if sort_by_column.nil? || sort_by_column.empty?

# Do's
return true if sort_by_column.blank?
```

## Set over Array

Preference of Set over Array for search (include?) and cluster operations (uniq, |, &)

```ruby
# Don't
SUPPORTED_VERB_CONDITIONS = [
  "is", "is_not", "contains", "does_not_contain", "starts_with",
  "ends_with", "contains_any_of", "contains_all_of", "contains_none_of",
  "less_than", "greater_than", "during", "not_during", "any_time",
  "is_before", "is_after"
]

# Performing search or cluster operation
SUPPORTED_VERB_CONDITIONS.include? verb

# Do's
SUPPORTED_VERB_CONDITIONS = Set[
  "is", "is_not", "contains", "does_not_contain", "starts_with",
  "ends_with", "contains_any_of", "contains_all_of", "contains_none_of",
  "less_than", "greater_than", "during", "not_during", "any_time",
  "is_before", "is_after"
].freeze

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
# Don't
class SlackIntegration
  extend SlackIntegrable
end

# Do's
class SlackIntegration
  def slack_disconnect
    puts 'Slack disconnected successfully!'
  end
end

# Reopening
class SlackIntegration
  def slack_connected
    puts 'Slack connected successfully!'
  end
end

# Results of Opening a class and including are comparable in benchmarks for recent Ruby versions

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
```

## Freeze constant data

Constant data including arrays and hashes, should be frozen if they are accessed but not mutated in the codebase.

All strings will already be frozen by rubocop, so freezing them is not required.

```ruby
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
```
