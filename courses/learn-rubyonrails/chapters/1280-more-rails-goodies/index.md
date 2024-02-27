## The lib folder and its use cases

The only cases where we should use the lib folder are in these cases:

- Overriding 3rd party library specifics or modules.

- Overriding String class from Ruby.

- For keeping logic shared by controllers, models as well as say configs or even
  Rake tasks.

- The `lib` folder was used a lot in old Rails where all helpers were used to be
  written in this folder.

## ActionModel::Dirty

We already discussed about some of the dirty methods while we had added slug to
tasks. Documenting all of the dirty methods will be pretty much replicating the
whole Rails docs. Thus here are few of the useful dirty methods:

### saved_change_to_attribute

Returns the change to an attribute during the last save. If the attribute was
changed, the result will be an array containing the original value and the saved
value.

This method is useful in after callbacks, to see the change in an attribute
during the save that triggered the callbacks to run. It can be invoked as
`saved_change_to_name` instead of `saved_change_to_attribute("name")`.

Another real world example would be when we have to deactivate users from a team
if the team's subscription payment has failed. Let's say `payment_status` is an
ENUM field which stores the payment statuses. Thus we could add a concern like
so:

```rb
# frozen_string_literal: true

module AccountDeactivation
  extend ActiveSupport::Concern

  included do
    after_update do
      if payment_failed?
        deactivate_team_members!
      end
    end
  end

  private

    def payment_failed?
      self.saved_change_to_payment_status&.last == "failed"
    end

    def deactivate_team_members!
      self.subscribers.deactivate!
    end
end
```

We could include this concern in say our `Team` model and take care of the
deactivation with ease.

## ActionText

You can read more about ActionText from the
[official documentation](https://edgeguides.rubyonrails.org/action_text_overview.html).

## ActionCable

You can read more about ActionCable from the
[official documentation](https://guides.rubyonrails.org/action_cable_overview.html).

**There is nothing to commit in this chapter.**
