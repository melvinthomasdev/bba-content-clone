Now that we have covered unit testing and background jobs with Sidekiq, let's
add a new feature to send reminder emails to users with outstanding tasks.

In this chapter we will discuss concepts like idempotency, mail delivery
windows, setting user preferences, and more.

## Features

These are the basic requirements of the feature :

- Send reminder emails to users who have pending tasks.
- Users should have an option to enable/disable the email notifications.
- User can set preferred time to receive this pending tasks notification email.
- If a user has disabled the email notification then that user should not be
  able to set preferred time to receive email.

<image>handling-idempotency-when-sending-emails-using-sidekiq.png</image>

## Technical design

To implement this feature, we need to introduce the following changes:

**On the backend**

- For scheduling periodic Sidekiq jobs, we can use the
  [sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron) gem, which helps
  us to schedule the worker, which will be sending the mail.

- In the development environment, instead of sending an email to the user's
  email address, we can preview the email in our browser using the
  [letter_opener](https://github.com/ryanb/letter_opener) gem.

- By default, if the user has set a preferred time then the mail will be sent at
  that time else mail will be sent at 10 AM.

- We store this preferred time in a table called `preferences`. This
  `preferences` table consists of
  `notification_delivery_hour`,`should_receive_email`, and `user` columns.

- Create `user_notifications` table with `last_notification_sent_date` and
  `user` columns.

- In `UserNotification` model, add validations to ensure that the
  `last_notification_sent_date` attribute is present, has a valid date format,
  and the date is not in the past.

- We will be creating a default preference for the user whenever a new user is
  created.

- We will be saving the default preference value in a constant
  `DEFAULT_NOTIFICATION_DELIVERY_HOUR`, which will be loaded automatically from
  `config/initializers/constants.rb`, by Rails, after it loads the framework
  plus any gems and plugins in our application.

- Add `PreferencesController` which will add the ability for the user to update
  their preference for if and when to receive the email.

  Inside the `PreferencesController`, we will add a custom action called `mail`
  which will handle enabling and disabling the email notification.

- Mail sending can often fail due to network errors, among others. When that
  happens, Sidekiq will retry based on rules we set in the initializer.

**On the frontend**

- Define `preference` related axios connectors.

- We will add a `MyPreferences` component which will handle the preferences of
  the user.

- Delegate the job of taking in the preferred time for mail delivery to a `Form`
  component within the `MyPreferences` folder.

- Add a function `fetchPreferenceDetails` in the `MyPreferences` container
  component which will fetch preference details like
  `notification_delivery_hour` and `should_receive_email`.

- Add a function `updateEmailNotification` in the `MyPreferences` component
  which will handle enabling/disabling email notifications.

- Similarly, add a function `updatePreference` in the `MyPreferences` container
  component which will update `notification_delivery_hour`.

## Sidekiq worker

To send each batch of reminder emails, we will schedule a
`TodoNotificationsWorker` to run every hour and delegate the job of finding the
recipients to a `TodoNotificationsService`.

This service will ultimately invoke separate `UserNotificationWorker`'s for each
recipient it finds.

Let's say we use a single worker for sending all the emails. If this worker
fails in the middle of sending the emails the whole email delivery system will
be down. The rest of the users will not get any email. This is known as the
single point of failure. To avoid this single point of failure we are using
separate workers for each recipient. If a separate worker fails then it does not
affect the rest of the workers and they can continue sending emails. Thus we can
use separate workers and avoid a single point of failure and make our system
more reliable.

We will also create a scheduler file to store cron values that will help
schedule our `TodoNotificationsWorker` at the desired time interval for each
environment.

The parent Sidekiq worker will then invoke `TodoNotificationsService`, which
will find all the users with pending tasks but no entries in a new table called
`user_notifications`.

## What is idempotency?

We need our service to be idempotent, ie: duplicate mail shouldn't be sent every
time we retry.

Let's say our email delivery service started and successfully sends 200 emails.
But on the delivery of the 201st email, it failed. Now, if we retry sending the
failed emails, then it's possible that those 200 emails which were already
delivered, will be sent again to the recipient. This only occurs if our service
is not idempotent. We can say our service is idempotent only when no duplicate
emails are sent each and every time we retry/rerun the service.

To make our service idempotent we need to add a mechanism to keep track of who
has received the email and who has not. If we have this data, then we can figure
out to whom all we have already sent the emails successfully. This ensures that
even if the service fails in between and is restarted, no user should will get
the same email twice.

From a RESTful service standpoint, an operation or service call is idempotent
when clients can perform a duplicate request harmlessly. In other words, making
multiple identical requests has the same effect as making a single request.

Note that while idempotent operations produce the same result on the server, the
response itself may not be the same; e.g. a resource's state may change between
requests.

To keep track of sent emails we will use the `user_notifications` table from
earlier to associate each user with a `last_notification_sent_date`.

If a user has an entry for today in `user_notifications`, it means there's no
need to try again.

## Action Mailer

Action Mailer allows you to send emails from your application using mailer
classes and views. They inherit from `ActionMailer::Base` and live in
`app/mailers`.

To make sure that the email has truly been sent to the user, we will make use of
`Action Mailer`'s `after_action` callback to safely set the
`last_notification_sent_date` value only after the mail has been sent
successfully.

Mailers have methods called "actions" and they use views to structure their
content.

A controller generates content like say HTML, which will be sent back to the
client, whereas a Mailer creates a message to be delivered via email.

We will be creating the `TaskMailer` mailer and `task_mailer` view.

We are now ready to start coding. Let us dive in.

## Setting up base

Open the `Gemfile.rb` and add the following lines:

```ruby
# For periodic sidekiq jobs
gem "sidekiq-cron"

# For opening mails in development env
gem "letter_opener", :group => :development
```

Install the gems:

```bash
bundle install
```

For the `letter_opener` gem to open the mails automatically in our browser, we
need to set the following in `config/environments/development.rb`:

```ruby
config.action_mailer.delivery_method = :letter_opener
config.action_mailer.perform_deliveries = true
```

Now any email delivery will pop up in our browser instead of being sent via the
internet. The messages will be stored in `./tmp/letter_opener`.

## Creating models

```bash
bundle exec rails g model user_notification
bundle exec rails g model preference
```

Go to `db/migrate` folder and paste the following lines of code for the
`CreateUserNotifications` migration:

```ruby
class CreateUserNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_notifications do |t|
      t.date :last_notification_sent_date, null: false
      t.references :user, foreign_key: true
      t.index [:user_id, :last_notification_sent_date],
        name: :index_user_preferences_on_user_id_and_notification_sent_date,
        unique: true
      t.timestamps
    end
  end
end
```

Also, paste the following lines of code for the `CreatePreferences` migration:

```ruby
class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.integer :notification_delivery_hour
      t.boolean :should_receive_email, default: true, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
```

Run the migrations:

```bash
bundle exec rails db:migrate
```

## Adding validations

Now let's setup `UserNotification` model and add validations for
`last_notification_sent_date`.

Open `app/models/user_notification.rb` and add the following lines to it:

```ruby
class UserNotification < ApplicationRecord
  belongs_to :user

  validates :last_notification_sent_date, presence: true
  validate :last_notification_sent_date_is_valid_date
  validate :last_notification_sent_date_cannot_be_in_the_past

  private

  def last_notification_sent_date_is_valid_date
    if last_notification_sent_date.present?
      Date.parse(last_notification_sent_date.to_s)
    end
  rescue ArgumentError
    errors.add(:last_notification_sent_date, "must be a valid date")
  end

  def last_notification_sent_date_cannot_be_in_the_past
    if last_notification_sent_date.present? &&
        last_notification_sent_date < Time.zone.today
      errors.add(:last_notification_sent_date, "can't be in the past")
    end
  end
end
```

Now let's setup our `Preference` model along with validations in
`app/models/preference.rb`:

```ruby
class Preference < ApplicationRecord
  belongs_to :user

  validates :notification_delivery_hour, presence: true,
    numericality: { only_integer: true },
    inclusion: {
      in: 0..23,
      message: "value should be between 0 and 23"
    }
end
```

Currently, we are only providing the ability to set the preference for when to
receive an email notification.

Thus in the above code, we have added the validations for the
`notification_delivery_hour` attribute which makes sure that it's present, and
it only accepts integers ranging from `0-23`.

Add the following line in `config/initializers/constants.rb` file::

```ruby {8}
module Constants
  is_sqlite_db = ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] == "sqlite3"
  DB_REGEX_OPERATOR = is_sqlite_db ? "REGEXP" : "~*"
  DEFAULT_NOTIFICATION_DELIVERY_HOUR = 10
end
```

We are setting the `DEFAULT_NOTIFICATION_DELIVERY_HOUR` in our `constants.rb`
file instead of a specific model. This is because the constant is not limited to
a specific context and will be used across different files. Thus it makes sense
to add it to a global `Constants` context instead.

Now let's set the associations correctly in our `User` model too:

```ruby {3-4, 8, 16-18}
class User < ApplicationRecord
  # previous code if any
  has_many :user_notifications, dependent: :destroy, foreign_key: :user_id
  has_one  :preference, dependent: :destroy, foreign_key: :user_id

  # previous code if any
  before_save :to_lowercase
  before_create :build_default_preference

  private

    # previous code if any

    def to_lowercase
      email.downcase!
    end

    def build_default_preference
      self.build_preference(notification_delivery_hour: Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR)
    end
end
```

The private method, `build_default_preference`, will create a default preference
for the user whenever a new user is created.

Inside the `build_default_preference` method we have used the `build_preference`
method. Let's take a look at where it came from.

When we declare a `belongs_to` or `has_one` association, the declaring class
automatically will have access to a `build_association` method related to the
association. In this case, because of the `has_one :preference` association in
`User` model, Rails adds the `build_preference` method to the User class.

In case of `has_many` or `has_and_belongs_to_many` associations, we should use
the `association.build` method instead of the `build_association` method. For
example, if we were to declare a `has_many :preferences` association in the User
model, we would have to use the `preferences.build` method given that Rails
won't add the `build_preferences` method for an association that is not
`has_one`.

Now that we have established the associations in the `User` model, let's enhance
its readability. The below lines illustrate the associations defined in our
model:

```rb
# previous code if any
has_many :created_tasks, foreign_key: :task_owner_id, class_name: "Task"
has_many :assigned_tasks, foreign_key: :assigned_user_id, class_name: "Task"
has_many :comments, dependent: :destroy
has_many :user_notifications, dependent: :destroy, foreign_key: :user_id
has_one :preference, dependent: :destroy, foreign_key: :user_id
# previous code if any
```

Upon reviewing this code snippet, we can observe that the first two associations
share a common option of `class_name: "Task"`. Furthermore, the remaining
associations include the option `dependent: :destroy`. Therefore, it would be
beneficial if we group the associations by their shared options. This is where
the `with_options` method can aid us. Let's replace the aforementioned
associations with the code below:

```rb
# previous code if any
with_options class_name: "Task" do |user|
  user.has_many :created_tasks, foreign_key: :task_owner_id
  user.has_many :assigned_tasks, foreign_key: :assigned_user_id
end
with_options dependent: :destroy do |user|
  user.has_many :comments
  user.has_many :user_notifications, foreign_key: :user_id
  user.has_one :preference, foreign_key: :user_id
end
# previous code if any
```

The `with_option` method provides an elegant way of factoring out duplication
from options passed to a series of method calls. Each method called in the
block, with the block variable as the receiver, will have its options merged
with the default options hash provided. You can learn more about this method in
the [official docs](https://apidock.com/rails/Object/with_options).

## Adding preferences for existing users

The `build_preference` method we had added in the previous section will only add
a default preference for new users. The preference for all existing users will
remain `nil`. There are two ways by which we can fix this issue:

1. Deleting all users from the console and creating new users. Newly added users
   will have a default preference but we shouldn't take this approach because:

   - It's considered a bad practice.

   - Once the application is deployed, we shouldn't delete users from console in
     production environment.

2. A better way to do this would be to add a migration which will add default
   preference for all existing users where preference is `nil`.

If you recall, we have done something similar in the
[Adding slug to task chapter](/learn-rubyonrails/adding-slug-to-task#adding-a-null-constraint-for-slug)
where we had used a migration to add slugs to existing task records.

Before moving on towards adding a migration to fix the issue, you should attempt
to do this by yourself. If you need help you can refer to the
[Adding slug to task chapter](/learn-rubyonrails/adding-slug-to-task#adding-a-null-constraint-for-slug).

Now, let's us add a migration to fix this issue. Run the following command to
generate a migration:

```bash
bundle exec rails g migration AddDefaultPreferenceToExistingUsers
```

The above command with generate a migration file. Inside the migration file add
the following lines of code:

```ruby
class AddDefaultPreferenceToExistingUsers < ActiveRecord::Migration[7.0]
 def up
    users_with_nil_preference = User.where.missing(:preference)
    users_with_nil_preference.each do |user|
      user.send(:build_default_preference)
      user.save!
    end
  end

  def down
    User.find_each do |user|
      user.preference.delete
    end
  end
end
```

We have used the `missing` method which performs a left outer join operation on
parent and child tables then uses a where clause to identify the missing
relations. In this case we are querying all user records which have a missing
preference relation and then adding a default preference for all those user
records.

You can read more about the `missing` method from
[official documentation](https://edgeapi.rubyonrails.org/classes/ActiveRecord/QueryMethods/WhereChain.html#method-i-missing).

Run the following command to execute the migration:

```bash
bundle exec rails db:migrate
```

## Creating the controller

Create a new controller for the `preference` model by running the following
command:

```bash
bundle exec rails generate controller Preferences
```

Open `app/controllers/preferences_controller.rb` and add the following lines to
it:

```ruby
class PreferencesController < ApplicationController
  before_action :load_preference

  def show
    render_json({ preference: @preference })
  end

  def update
    @preference.update!(preference_params)
    render_notice(t("successfully_updated", entity: "Preference"))
  end

  def mail
    @preference.update!(should_receive_email: preference_params[:should_receive_email])
    render_notice(
      t(
        "preference.mail.notification_status",
        status: @preference.should_receive_email ? "enabled" : "disabled"
      )
    )
  end

  private

    def preference_params
      params.require(:preference).permit(:notification_delivery_hour, :should_receive_email)
    end

    def load_preference
      @preference = current_user.preference
      unless @preference
        render_error("Preference not found", :not_found)
      end
    end
end
```

We have added a `mail` action in the `PreferencesController` which will handle
the logic to enable and disable the email notifications. Now, the question
arises that why we need another action when updating a record should be handled
by the `update` action. We want to do so because the `mail` action is only
concerned with updating the `should_receive_email` attribute of a preference
record and the response for that will also be different from the `update`
action. Therefore, it is better to add a custom action.

We have created a `load_preference` method to load the preference before the
`show`, `update` and `mail` actions are called. Since each user has one
associated `preference` record we can query it using `current_user.preference`
inside the `load_preference` method. Hence appending the preference id to the
preference routes or sending it as a request param while making a request is not
required in this case.

Now, let's create the route for the preference. We should declare `preference`
as a singular resource because we do not need a resource identifier in the
routes. Open the `routes.rb` and append the following line:

```ruby {4}
Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    # ---Previous Routes---
    resource :preference, only: %i[show update] do
      patch :mail, on: :collection
    end
  end

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

We have added a collection route called `mail` for the `preference` resource.
Any patch request on `preference/mail` will invoke the `mail` action inside the
`PreferencesController`.

Note that we have used a `patch` verb for the `mail` route over the `put` verb.
This is so because a `put` verb is used when the entire entity needs to be
updated whereas a `patch` request is used when the entity needs to be updated
partially. In our case, we are only updating the `should_receive_email`
attribute of a preference record thus the use of `patch` verb.

## Why we do not need a preference policy?

Policies prevent any unauthorized access of database records. In case of
preferences, a user should not be able to access the preferences of another
user. We do not need a policy to ensure this because we are using the
`preferences` association of the `User` model to load the preference inside the
`PreferencesController`.

Doing so will only load the preference of the `current_user` thus eliminating
the need for authorization using a policy.

## Building the UI for user preference

Since we have already added APIs for handling user preference, let's now build
the views for it.

Let's create a new file to define all the `preference` related APIs:

```bash
touch app/javascript/src/apis/preferences.js
```

Open the `apis/preferences.js` and paste the following lines:

```javascript
import axios from "axios";

const show = () => axios.get("/preference");

const mail = ({ payload }) => axios.patch(`/preference//mail`, payload);

const update = ({ payload }) => axios.put("/preference", payload);

const preferencesApi = {
  show,
  update,
  mail,
};

export default preferencesApi;
```

Now, let's create the preference component:

```bash
mkdir -p app/javascript/src/components/MyPreferences
touch app/javascript/src/components/MyPreferences/index.jsx
```

Paste the following lines into `index.jsx`:

```javascript
import React, { useState, useEffect } from "react";

import preferencesApi from "apis/preferences";
import Container from "components/Container";
import PageLoader from "components/PageLoader";
import { getFromLocalStorage } from "utils/storage";

import Form from "./Form";

const MyPreferences = () => {
  const [notificationDeliveryHour, setNotificationDeliveryHour] = useState("");
  const [shouldReceiveEmail, setShouldReceiveEmail] = useState(true);
  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);
  const [preferenceId, setPreferenceId] = useState("");
  const userId = getFromLocalStorage("authUserId");

  const updatePreference = async () => {
    setLoading(true);
    try {
      await preferencesApi.update({
        payload: {
          notification_delivery_hour: notificationDeliveryHour,
          should_receive_email: shouldReceiveEmail,
        },
      });
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  const updateEmailNotification = async emailNotificationStatus => {
    setLoading(true);
    try {
      await preferencesApi.mail({
        id: preferenceId,
        payload: {
          should_receive_email: emailNotificationStatus,
        },
      });
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  const fetchPreferenceDetails = async () => {
    try {
      const {
        data: {
          preference: { notification_delivery_hour, should_receive_email, id },
        },
      } = await preferencesApi.show();
      setNotificationDeliveryHour(notification_delivery_hour);
      setShouldReceiveEmail(should_receive_email);
      setPreferenceId(id);
    } catch (error) {
      logger.error(error);
    } finally {
      setPageLoading(false);
    }
  };

  useEffect(() => {
    fetchPreferenceDetails();
  }, []);

  if (pageLoading || !userId || !preferenceId) {
    return (
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <Container>
      <Form
        notificationDeliveryHour={notificationDeliveryHour}
        setNotificationDeliveryHour={setNotificationDeliveryHour}
        shouldReceiveEmail={shouldReceiveEmail}
        setShouldReceiveEmail={setShouldReceiveEmail}
        loading={loading}
        updatePreference={updatePreference}
        updateEmailNotification={updateEmailNotification}
      />
    </Container>
  );
};

export default MyPreferences;
```

Here, `fetchPreferenceDetails` function uses the `show` axios API call from
`preference` related axios APIs. Similarly, the `updatePreference` function will
be using the `update` axios API.

As you can see we have used a `Form` component which is not yet created. Let's
create it:

```bash
mkdir -p app/javascript/src/components/MyPreferences/Form
touch app/javascript/src/components/MyPreferences/Form.jsx
```

Paste the following lines in the `MyPreferences/Form.jsx`:

```javascript
import React from "react";

import classnames from "classnames";
import Button from "components/Button";
import Input from "components/Input";
import Select from "react-select";

const defaultTimezone = "UTC";

const Form = ({
  notificationDeliveryHour,
  setNotificationDeliveryHour,
  shouldReceiveEmail,
  setShouldReceiveEmail,
  loading,
  updatePreference,
  updateEmailNotification,
}) => {
  const onHandleDeliveryHourChange = event => {
    const regex = /^[0-9\b]*$/;
    const deliveryHour = event.target.value;
    if (!regex.test(deliveryHour)) return null;

    return setNotificationDeliveryHour(deliveryHour);
  };

  const handleSubmit = event => {
    event.preventDefault();
    if (shouldReceiveEmail) {
      updatePreference();
    }
  };

  const handleEmailNotificationChange = e => {
    setShouldReceiveEmail(e.target.checked);
    return updateEmailNotification(e.target.checked);
  };

  return (
    <form className="max-w-lg mx-auto" onSubmit={handleSubmit}>
      <div className="flex justify-between text-bb-gray-600 mt-10 mb-2">
        <h1 className="pb-3 mt-5 text-2xl leading-5 font-bold">
          Pending Tasks in Email
        </h1>
      </div>

      <div
        className={classnames("flex  items-baseline space-x-1", {
          "text-bb-gray-700": shouldReceiveEmail,
          "text-bb-gray-600": !shouldReceiveEmail,
        })}
      >
        <input
          type="checkbox"
          checked={shouldReceiveEmail}
          id="shouldReceiveEmail"
          onChange={handleEmailNotificationChange}
        />
        <span>
          Send me a daily email of the pending tasks assigned to me.
          <br /> No email will be sent if there are no pending tasks.
        </span>
      </div>

      <div
        className={classnames("flex space-x-4 items-center", {
          "text-bb-gray-700": shouldReceiveEmail,
          "text-bb-gray-600": !shouldReceiveEmail,
        })}
      >
        <p className="text-sm font-medium mt-6 leading-5 ">
          Delivery Time (Hours)
        </p>
        <Input
          type="number"
          placeholder="Enter hour"
          disabled={!shouldReceiveEmail}
          min={0}
          max={23}
          value={notificationDeliveryHour}
          onChange={onHandleDeliveryHourChange}
        />
        <p className="mt-6 font-extrabold">(UTC)</p>
      </div>

      <div className="w-2/6">
        <Button
          type="submit"
          buttonText="Schedule Email"
          className={classnames({
            "cursor-not-allowed bg-opacity-60": !shouldReceiveEmail,
          })}
          loading={loading}
        />
      </div>
    </form>
  );
};

export default Form;
```

The `Form` component contains a checkbox for enabling and disabling the email
notifications. When the checkbox value changes, `updateEmailNotification`
function defined inside the `MyPreferences` component will be called and it will
in turn make an API for `mail` action in the `PreferencesController`.

There is a `updatePreference` function as well which will be called upon
submitting the form and it will make an API request to update the logged in
user's preference.

We need to provide an `Input` component from where the user can set their
preferred time for mail delivery.

We have to constraint the values that this component can accept, when it's
`type` is set to be `number`.

Thus let's update our reusable `Input` component to provide this functionality:

```javascript {12-13, 30-31, 49-50}
import React from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

const Input = ({
  type = "text",
  label,
  value,
  onChange,
  placeholder,
  min,
  max,
  required = true,
}) => {
  return (
    <div className="mt-6">
      {label && (
        <label className="block text-sm font-medium leading-5 text-bb-gray-700">
          {label}
        </label>
      )}
      <div className="mt-1 rounded-md shadow-sm">
        <input
          type={type}
          required={required}
          value={value}
          onChange={onChange}
          placeholder={placeholder}
          min={min}
          max={max}
          className={classnames(
            "block w-full px-3 py-2 placeholder-gray-400 transition duration-150 ease-in-out border border-gray-300 rounded-md appearance-none focus:outline-none focus:shadow-outline-blue focus:border-blue-300 sm:text-sm sm:leading-5",
            [className]
          )}
        />
      </div>
    </div>
  );
};

Input.propTypes = {
  type: PropTypes.string,
  label: PropTypes.string,
  value: PropTypes.node,
  placeholder: PropTypes.string,
  onChange: PropTypes.func,
  required: PropTypes.bool,
  min: PropTypes.number,
  max: PropTypes.number,
};

export default Input;
```

Finally, our `Preference` component is ready to use. Let's add a route for this
component in `App.jsx` and let's also create a link to it in our navbar:

```javascript {2, 12}
//  previous code if any
import MyPreferences from "components/MyPreferences";

const App = () => {
  //  previous code if any
  return (
    <Router>
      <ToastContainer />
      <Switch>
        {/* previous code if any */}
        <Route exact path="/login" component={Login} />
        <Route exact path="/my/preferences" component={MyPreferences} />
        {/* previous code if any */}
      </Switch>
    </Router>
  );
};

export default App;
```

Now open the Navbar component from `components/NavBar/index.jsx` and add the
following line to create a `Preferences` item in navbar:

```javascript {20-28}
// previous code if any
const NavBar = () => {
  // previous code if any
  return (
    <nav className="bg-white shadow">
      <div className="px-2 mx-auto max-w-7xl sm:px-4 lg:px-8">
        <div className="flex justify-between h-16">
          <div className="flex px-2 lg:px-0">
            <div className="hidden lg:flex">
              <NavItem name="Todos" path="/dashboard" />
              <NavItem
                name="Add"
                iconClass="ri-add-fill"
                path="/tasks/create"
              />
            </div>
          </div>
          <div className="flex items-center justify-end gap-x-4">
            <span
              className="inline-flex items-center px-2 pt-1 text-sm
              font-regular leading-5 text-bb-gray-600 text-opacity-50
              transition duration-150 ease-in-out border-b-2
              border-transparent focus:outline-none
              focus:text-bb-gray-700"
            >
              <Link to="/my/preferences">Preferences </Link>
            </span>
            <span
              className="inline-flex items-center px-2 pt-1 text-sm
              font-regular leading-5 text-bb-gray-600 text-opacity-50
              transition duration-150 ease-in-out border-b-2
              border-transparent focus:outline-none
              focus:text-bb-gray-700"
            >
              {userName}
            </span>
            <a
              onClick={handleLogout}
              className="inline-flex items-center px-1 pt-1 text-sm
              font-semibold leading-5 text-bb-gray-600 text-opacity-50
              transition duration-150 ease-in-out border-b-2
              border-transparent hover:text-bb-gray-600 focus:outline-none
              focus:text-bb-gray-700 cursor-pointer"
            >
              LogOut
            </a>
          </div>
        </div>
      </div>
    </nav>
  );
};
```

## Implementing task mailer

Let's create the task mailer by running the following Rails command:

```bash
bundle exec rails g mailer TaskMailer
```

Open the `application_mailer.rb` from `app/mailers/application_mailer.rb` and,
provide the default email from which the mail will be send:

```ruby
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@granite.com'
  layout 'mailer'
end
```

Mailers have methods called "actions" and they use views to structure their
content. A controller generates content like say HTML, which will be sent back
to the client, whereas a Mailer creates a message to be delivered via email.

Now, let's edit the `task_mailer.rb` which we have created.

Paste the following lines in `task_mailer.rb`:

```ruby
class TaskMailer < ApplicationMailer
  after_action :create_user_notification, if: -> { @receiver }

  def pending_tasks_email(receiver_id)
    @receiver = User.find_by(id: receiver_id)
    return unless @receiver

    @tasks = @receiver.assigned_tasks.pending
    mail(to: @receiver.email, subject: "Pending Tasks")
  end

  private

    def create_user_notification
      @receiver.user_notifications.create(last_notification_sent_date: Time.zone.today)
    end
end
```

As you can see in the above code we have used `after_action` which is an
`Action Mailer Callback`. Using an `after_action` callback enables you to
perform operations after successfully sending the mail.

Once we ensure that mail is successfully sent, we will create an entry in
`user_notifications` with today's date, for the current user.

Our `TaskMailer` is ready. Let's create a mailer view, which will contain the
content and styling of the email.

Open `app/views` and you should be able to see the `task_mailer` directory.
Let's create a `pending_tasks_email.html.erb` file into it:

```bash
touch app/views/task_mailer/pending_tasks_email.html.erb
```

Paste the following lines into it:

```html
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  </head>
  <body>
    <h1>Hi! <%= @receiver.name %></h1>
    <p>Here is a list of your pending tasks for today.<br /></p>
    <ul>
      <% @tasks.each do |task| %>
      <li><%= task.title %></li>
      <% end %>
    </ul>
  </body>
</html>
```

## Use case of secrets.yml file

Rails supports the `secrets.yml` file to store your application's secrets. It is
used to store secrets such as access keys for external APIs or our Redis URL
etc.

This will provide reusability and also will help provide us easier access.

Let's create this file:

```bash
touch config/secrets.yml
```

Open the file and paste the following lines:

```ruby
default: &default
  redis_url: <%= ENV['REDISTOGO_URL'] || ENV['REDIS_URL'] || 'redis://localhost:6379/1' %>
```

## Creating scheduled_jobs.yml

We will create a scheduler file containing the cron syntax for different
environments and workers.

Cron is a standard Unix utility that is used to schedule commands for automatic
execution at specific intervals.

Here we are using cron to send an email notification to the users every day at
the default time, i.e., at 10 AM or preferred time, if set by the user.

Let's create the scheduler file:

```bash
touch config/scheduled_jobs.yml
```

Open the file and paste the following lines into it:

```yaml
default: &default
  todo_notifications_worker:
    cron: "0 * * * *"
    class: "TodoNotificationsWorker"
    queue: "default"

development:
  todo_notifications_worker:
    cron: "* * * * *"
    class: "TodoNotificationsWorker"
    queue: "default"

test:
  <<: *default

staging:
  <<: *default

production:
  <<: *default
```

The `default` and `development` are two important keys in the YAML file. Each of
those keys invoke a worker.

In the above code, you can see that the cron value for `default` and
`development` are different. The reason is that in development we don't need to
wait. We need the cron to get triggered as soon as possible.

The cron value for `development` executes a cron job every minute, whereas for
`default` the same is executed every hour.

Here in our YAML file, the `default` key is the main key because its value will
be used in other environments like `test`, `staging`, and `production`.

We create an alias for the `default` key using an anchor marked with the
ampersand `&` and then reference that alias using the asterisk `*`. This is
purely a "YAML" way of inheriting existing keys.

## Adding logic to schedule cron jobs

We have already written down when and what needs to be enqueued, in our
`scheduled_jobs.yml` file.

Thus in the Sidekiq initializer, we have to add logic that will read the content
from our scheduler file and will enqueue based on the cron defined for the
specific environment.

Also, we have to update the `REDIS_URL` with the URL we have specified in our
secrets file.

Open `sidekiq.rb` from `config/initializers`.

Add the following lines to this file:

```ruby {1-19, 22}
# frozen_string_literal: true

if Rails.env.test? || Rails.env.heroku?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end

Sidekiq.configure_server do |config|
  config.redis = { url:  Rails.application.secrets.redis_url, size: 9 }
  unless Rails.env.test? || Rails.env.production?
    schedule_file = "config/scheduled_jobs.yml"

    if File.exists?(schedule_file)
      Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file)[Rails.env]
    end
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.secrets.redis_url, size: 1 }
end
```

We have currently not enabled mail sending in production environment.

If possible, we will be handling this case in the upcoming chapters.

## Adding TodoNotifications functionality

Let's create the `TodoNotifications` worker:

```bash
mkdir -p app/workers
touch app/workers/todo_notifications_worker.rb
```

The sole purpose of the `TodoNotificationsWorker` is process a
`TodoNotificationsService`, which will take care of other core functionalities.

Open `app/workers/todo_notifications_worker.rb` and paste the following:

```ruby
# frozen_string_literal: true

class TodoNotificationsWorker
  include Sidekiq::Worker

  def perform
    todo_notification_service = TodoNotificationService.new
    todo_notification_service.process
  end
end
```

Let's create our `TodoNotificationService` to handle the heavy work.

Rails do not provide any inbuilt generators to create services.

Currently, we can only manually create the service as well as its test file.

This service will take care of finding users with pending tasks, whose delivery
time falls with the current execution time range, and invoke workers which will
send the mail to each user.

Let's create the service:

```bash
mkdir -p app/services
touch app/services/todo_notification_service.rb
```

Open the `todo_notification_service.rb` file and paste the following:

```ruby
# frozen_string_literal: true

class TodoNotificationService
  attr_reader :users_to_notify

  def initialize
    @users_to_notify = get_users_to_notify
  end

  def process
    notify_users
  end

  private

    def get_users_to_notify
      users = get_users_with_pending_tasks
      users_with_pending_notifications(users)
    end

    def notify_users
      users_to_notify.each do |user|
        UserNotificationsWorker.perform_async(user.id)
      end
    end

    def get_users_with_pending_tasks
      User.includes(:assigned_tasks, :preference).where(
        tasks: { progress: 'pending' },
        preferences: {
          should_receive_email: true,
          notification_delivery_hour: hours_till_now
        }
      )
    end

    def users_with_pending_notifications(users)
      no_mail_sent = "user_notifications.last_notification_sent_date <>"
      first_time_mailing = "user_notifications.id is NULL"
      delivery_condition = "#{no_mail_sent} ? OR #{first_time_mailing}"

      users.left_outer_joins(:user_notifications)
        .where(delivery_condition, Time.zone.today).distinct
    end

    def hours_till_now
      current_hour = Time.now.utc.hour
      (0..current_hour)
    end
end
```

Let's discuss the `initialize` method before moving ahead. `initialize` method
in Ruby is basically a constructor which we use to initialize instance variables
during object creation. The `initialize` method gets invoked implicitly even if
no instance variables are initialized.

If there is an attribute which you need to access in multiple methods defined
inside the class then you should declare it as an instance variable and
initialize it in the `initialize` method. At BigBinary we use the
`attr_accessor` macro to access the instance methods inside the class.

Let's also create a separate worker, named `UserNotificationsWorker`.

As per our technical design, we need to ensure that mail delivery for one single
user, doesn't break the whole delivery system.

The first line of defense against this case, is to invoke a separate worker,
which is `UserNotificationsWorker`, for each of the user.

This way failure of one worker won't affect the other workers, given that
Sidekiq runs them in separate threads.

Let's create `UserNotificationsWorker`:

```bash
touch app/workers/user_notifications_worker.rb
```

Open `app/workers/user_notifications_worker.rb` and paste the following:

```ruby
class UserNotificationsWorker
  include Sidekiq::Worker

  def perform(user_id)
    TaskMailer.pending_tasks_email(user_id).deliver_later
  end
end
```

`deliver_later` enqueues the email to be delivered, into a queue called
`mailers`, through Active Job. Since we want Sidekiq to use the `mailers` queue
along with the default queue, let us set them in the Sidekiq configuration file
`sidekiq.yml` by replacing its contents with the following:

```yaml {7}
development:
  :concurrency: 1
production:
  :concurrency: 1
:queues:
  - default
  - mailers
```

Please note that in order for the `deliver_later` method to utilise `sidekiq`,
we also need to set `config.active_job.queue_adapter = :sidekiq` in
`config/application.rb`, as we had already done in the previous chapter.

Phew! That was a lot of content with loads of good stuff.

That completes our feature and mail delivery should be working in a development
environment.

We will be writing tests for the same, in the next chapter.

## Moving messages to i18n en.locales

Recall that we already have a `Task not found.` translation definition inside
`en.yml` file and it is very similar to `Preference not found.` which is one of
the error translation definitions we have to add.

Rather than having two similar translations for messages which look like
`record not found`, we can use the variable interpolation feature provided by
`i18n` to pass the name of the entity which is not found. This will prevent code
duplication.

Fully replace `en.yml` with the following lines of code:

```yaml
en:
  generic_error: "Something went wrong. Please try again later."
  authorization:
    denied: "Access denied. You are not authorized to perform this action."
  session:
    could_not_auth: "Could not authenticate with the provided credentials."
    incorrect_credentials: "Incorrect credentials, try again."
  successfully_created: "%{entity} was successfully created!"
  successfully_updated: "%{entity} was successfully updated!"
  successfully_deleted: "%{entity} was successfully deleted!"
  not_found: "Couldn't find %{entity}"
  task:
    slug:
      immutable: "is immutable!"
  preference:
    notification_delivery_hour:
      range: "value should be between 0 and 23"
    mail:
      notification_status: "Email notifications %{status}."
  date:
    invalid: "must be a valid date"
    cant_be_in_past: "can't be in the past"
```

Now, the `not_found` translation in `en.yml`, will expect a value to be passed
for the `entity` variable. So let's go through our JSON responses and pass that
variable with appropriate entity name, wherever we are using the `not_found`
translation key.

Update the following highlighted line in the `load_preference` method in
`PreferencesController`:

```ruby {4}
def load_preference
  @preference = current_user.preference
  unless @preference
    render_error(t("not_found", entity:"Preference"), :not_found)
  end
end
```

We have also used a `Task not found` translation inside
`test_not_found_error_rendered_for_invalid_task_slug` in `TasksControllerTest`
where we are testing if the correct error is being rendered for an invalid task
slug. Let's update the test case to use the updated `i18n` translation string.

```ruby
def test_not_found_error_rendered_for_invalid_task_slug
  invalid_slug = "invalid-slug"

  get task_path(invalid_slug), headers: @creator_headers
  assert_response :not_found
  response_json = response.parsed_body
  assert_equal t("not_found", entity: "Task"), response_json["error"]
end
```

Update the `test_shouldnt_create_comment_without_task` inside the
`CommentsControllerTest` like so:

```ruby
def test_shouldnt_create_comment_without_task
  post comments_path, params: { comment: { content: "This is a comment", task_id: "" } }, headers: @headers
  assert_response :not_found
  response_json = response.parsed_body
  assert_equal t("not_found", entity: "Task"), response_json["error"]
end
```

Update the `test_should_respond_with_not_found_error_if_user_is_not_present`
inside the `SessionsControllerTest` like so:

```ruby
def test_should_respond_with_not_found_error_if_user_is_not_present
  non_existent_email = "this_email_does_not_exist_in_db@example.email"
  post session_path, params: { login: { email: non_existent_email, password: "welcome" } }, as: :json
  assert_response :not_found
  response_json = response.parsed_body
  assert_equal t("not_found", entity: "User"), response_json["error"]
end
```

Update the `handle_api_exception` method inside the `ApplicationController` like
so:

```ruby {8}
def handle_api_exception(exception)
  case exception
  # rest of the exception cases

  when ActiveRecord::RecordNotFound
    render_error(t("not_found", entity: exception.model), :not_found)
end
```

Let's also add the error translations in `UserNotification` and `Preference`
models.

Update `UserNotification` model with the following lines of code:

```ruby {15,20}
class UserNotification < ApplicationRecord
  belongs_to :user

  validates :last_notification_sent_date, presence: true
  validate :last_notification_sent_date_is_valid_date
  validate :last_notification_sent_date_cannot_be_in_the_past

  private

    def last_notification_sent_date_is_valid_date
      if last_notification_sent_date.present?
        Date.parse(last_notification_sent_date.to_s)
      end
    rescue ArgumentError
      errors.add(:last_notification_sent_date, t("date.invalid"))
    end

    def last_notification_sent_date_cannot_be_in_the_past
      if last_notification_sent_date.present? && last_notification_sent_date < Time.zone.today
        errors.add(:last_notification_sent_date, t("date.cant_be_in_past"))
      end
    end
end
```

Update the following highlighted line in the `Preference` model:

```ruby {9}
class Preference < ApplicationRecord
  belongs_to :user

  validates :notification_delivery_hour,
    presence: true,
    numericality: { only_integer: true },
    inclusion: {
      in: 0..23,
      message: t("preference.notification_delivery_hour.range")
    }
end
```

## Testing PreferencesController

To test the `preferences` controller, we do not need to create a `preference`
factory since a preference association is created automatically for each user
when that new user is created.

Now, create a new file `test/controllers/preferences_controller_test.rb` and add
the following content:

```ruby
require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @preference = @user.preference
    @headers = headers(@user)
  end
end
```

Now, let us test if the correct preferences are rendered for a valid user.
Append the following test case to the `PreferencesControllerTest`:

```ruby
def test_show_preference_for_a_valid_user
  get preference_path, headers: @headers
  assert_response :ok
  assert_equal @preference.id, response.parsed_body["preference"]["id"]
end
```

We should also add a test case to check if correct response is being rendered if
the preference is not found. Add the following test case to the
`PreferencesControllerTest`:

```ruby
def test_not_found_error_rendered_if_preference_is_not_present
  @user.preference = nil
  get preference_path, headers: @headers
  assert_response :not_found
end
```

Let us test if the update action is working as intended. Add the following test
cases to the `PreferencesControllerTest`:

```ruby
def test_update_success
  preference_params = { preference: { should_receive_email: false } }

  put preference_path, params: preference_params, headers: @headers
  @preference.reload
  assert_response :ok
  refute @preference.should_receive_email
end

def test_update_failure_for_invalid_notification_delivery_hour
  preference_params = { preference: { notification_delivery_hour: 24 } }

  put preference_path, params: preference_params, headers: @headers
  assert_response :unprocessable_entity
  assert_equal "Notification delivery hour #{t("preference.notification_delivery_hour.range")}", response.parsed_body["error"]
end
```

Let us test the `mail` action. Add the following test case to the
`PreferencesControllerTest`:

```ruby
def test_update_success_mail
    preference_params = { preference: { should_receive_email: false } }

    patch mail_preference_path, params: preference_params, headers: @headers
    @preference.reload
    assert_response :ok
    refute @preference.should_receive_email
  end
```

Now you can try running all the `preference` test cases and they should be
passing:

```bash
bundle exec rails test -v test/controllers/preferences_controller_test.rb
```

Now let's commit these changes:

```bash
git add -A
git commit -m "Added ability to send email to each user with pending tasks"
```
