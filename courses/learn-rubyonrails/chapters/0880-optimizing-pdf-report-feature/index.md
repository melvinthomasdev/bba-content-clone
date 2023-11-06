We had discussed about the limitations of the PDF report generation feature in
the last chapter. In this chapter we will fix those limitations by making use of
the Active Storage module. More than that, in this chapter we will also figure
out a way to improve the UX pertaining to the report generation by utilizing
Action Cable module and showing a progress bar for the report generation process
in the UI.

## Features

Let's use Active Storage and Action Cable modules for generating the PDF report
with progress notifications and to store it in Google Cloud storage.

- We will add Active Storage so that we can store the PDF file on a dedicated
  file storage service like Google cloud storage. Using this approach we can
  make the PDF report feature work in the deployed Heroku app.

- We will add Action Cable so that we can send live notifications to the client
  and point out the progress of the PDF report generation process.

- We will add a progress bar in the UI to show the completion of the PDF report
  generation.

<image>download-report-card.png</image>

## Technical design

To implement this feature we need to introduce the following changes:

**On the backend**

- Setup Active Storage in the project and initialize Google Cloud storage
  service to upload the PDF report.

- Update the config and secrets file to add the cloud service with Active
  Storage.

- Attach the report to a `user` so that we can retrieve the reports associated
  with a user after generating it and uploading it to the cloud service.

- Add `Connection`, `Channel`, and `ReportDownloadChannel` classes to setup the
  Action Cable.

- Update the `reports_worker` to broadcast notification messages at different
  stages of PDF generation using Action Cable sockets.

**On the frontend**

- Add a `ProgressBar` component which will show the current progress of the PDF
  generation process.

- Add a `consumer` and a `reportDownloadChannel` to accept the notification
  messages sent by Action Cable from backend.

- Update the `DownloadReport` component to show the progress bar, notification
  messages, and download button.

## What is Active Storage?

Active Storage facilitates uploading files to cloud storage services like Google
cloud storage, Amazon S3, etc. Using Active Storage we can upload files and
attach them to Active Record objects.

Active Storage requires certain third-party tools for extended functionality.
Like `libvips` is required for image processing and analysis. `ffmpeg` software
is required by Active Storage for video previews. Similarly, if we need to
interact with Google Cloud storage, then we'd have to install the corresponding
API providing gem for the same.

Active Storage uses three tables that are `active_storage_blobs`,
`active_storage_variant_records`, and `active_storage_attachments`.

Run the following command to generate a migration that creates these tables:

```bash
bin/rails active_storage:install
```

If you are using UUIDs instead of integers as the primary key on your models,
then you will have to change the column type of
`active_storage_attachments.record_id` and `active_storage_variant_records.id`
in the generated migration accordingly. This can be skipped if you set
`Rails.application.config.generators { |g| g.orm :active_record, primary_key_type: :uuid }`
in a config file.

For instance, consider you are using UUIDs for your models and in the generated
migration file for Active Storage, the column type of `record_id` is `bigint` as
given below.

```rb
create_table "active_storage_attachments", force: :cascade do |t|
  # previous code if any
  t.bigint "record_id", null: false
  # previous code if any
end
```

In this case, you should change the type of `record_id` to `uuid` as follows:

```rb
create_table "active_storage_attachments", force: :cascade do |t|
  # previous code if any
  t.uuid "record_id", null: false
  # previous code if any
end
```

Similarly, you should also change the type of `id` field to `uuid` for the table
`active_storage_variant_records`.

Now run the migration to reflect the changes in database, like this:

```bash
bundle exec rails db:migrate
```

So we have successfully added Active Storage to our project. Let's integrate a
cloud service with Active Storage.

## Initialize Google Cloud bucket

For Google cloud storage, add the `google-cloud-storage` gem in `Gemfile`, like
so:

```rb
# Required by Active Storage to use the GCS
gem "google-cloud-storage"
```

Then install the newly added gem, like this:

```bash
bundle install
```

Setup the Google cloud storage bucket as follows:

- Go to https://cloud.google.com/storage

- Signup if you hadn't created an account before. Once you signup, login with
  your email, and enter the required details to setup the account.

- After signing with the account, go to the console and create a new project
  called `Granite`.

- Select the project and go to the `Buckets` option using the side menu, like
  this:

<image>gcs-bucket.png</image>

- Click on create button and add the bucket with `granite-report` as the name.
  Select the default options for rest of the steps.

We have initialized the Google cloud storage bucket. We also need a key file to
access the bucket storage from our local machine.

Generate the key file as follows:

- Go to the `IAM and admin > Service accounts` option using sidebar menu as
  shown below:

<image>gcs-service-account.png</image>

- Click on `Create service account` option at the top.

- Add the `name` as `granite-<your_name>` and click on `CREATE AND CONTINUE`
  option. Then select the `Owner` role under the `Basic` option as shown below.

<image>owner-service-account.png</image>

- Then click on `Continue`. We can skip the last option and click on `Done`.

- A new service account is created in the table. Now click on the actions button
  for the newly created account and select the `Manage key` option.

- Then click on `Add key > Create new key` option. Select the JSON option and
  click on `Create` button. Your service account key will be downloaded to say
  the "Downloads" folder.

## Handle env variables

We have initialized the Google cloud storage bucket and we also have the key
file. It's time to add this service to Active Storage.

Let's first handle the env variables.

It's a common standard across most projects to store the ENV variables in `.env`
files. In order to handle the `.env` files, we need to add a gem. Let's add the
`dotenv` gem, at the end of `Gemfile`, like this:

```rb
# To load the environment variables
gem "dotenv-rails"
```

Install the newly added gem, like this:

```bash
bundle install
```

Now add the following lines in `application.rb` to load the environment
variables from `dotenv` or more accurately the `.env` files:

```rb
# Load dotenv file
Dotenv::Railtie.load
```

Usually, in the production environment we set the ENV variables in Heroku
itself. Otherwise anyone with access to the repository, will be able to perform
drastic operations across the production env of multiple platforms, ranging from
GCS to Heroku. But given that `granite` is more or less a test application, and
for easiness sake, let's add the ENV variables for production locally.

Update the `.gitignore` file in the root directory to remove the `.env` file
from it so that the `.env` file can be uploaded to Github and Heroku can load
env variables using it.

Remove the below mentioned line from `.gitignore` file:

```rb
/.env
```

Once a change is made to `.gitignore` file we should immediately stage and
commit that change.

So let's stage and commit the `.gitignore` file, like this:

```bash
git add .gitignore
git commit -m "Removed env file from gitignore"
```

Now, create a `.env` file at the root of the project, like this:

```sh
touch .env
```

Add the following keys to the `.env` file. Provide each key with the
corresponding values mentioned in the key file that we had previously downloaded
from Google Cloud.

```sh
GCS_PROJECT=Granite
GCS_BUCKET=granite-report
GCS_PRIVATE_KEY=value from downloaded file
GCS_PROJECT_ID=value from downloaded file
GCS_PRIVATE_KEY_ID="value from downloaded file"
GCS_CLIENT_EMAIL=value from downloaded file
GCS_CLIENT_ID=value from downloaded file
GCS_CLIENT_URL=value from downloaded file
```

Please note that the value of `private_key` contains newline escape character
that is `\n` so we have to use the double quotes, like this:

```
GCS_PRIVATE_KEY="value from downloaded file"
```

We don't need to wrap any other ENV variables in double quotes, other than the
one mentioned above.

Now we have added the env variables, let's use these env variables in our
project.

Open the `secrets.yml` file and add the highlighted lines, like this:

```yml {4-13}
default: &default # rest of the values as it was
  gcs:
    project: <%= ENV['GCS_PROJECT'] %>
    bucket: <%= ENV['GCS_BUCKET'] %>
    credentials:
      private_key: <%= ENV['GCS_PRIVATE_KEY']&.dump %>
      project_id: <%= ENV['GCS_PROJECT_ID'] %>
      private_key_id: <%= ENV['GCS_PRIVATE_KEY_ID'] %>
      client_email: <%= ENV['GCS_CLIENT_EMAIL'] %>
      client_id: <%= ENV['GCS_CLIENT_ID'] %>
      client_url: <%= ENV['GCS_CLIENT_URL'] %>

development:
  <<: *default

test:
  <<: *default

staging:
  <<: *default

production:
  <<: *default
```

Update the `config/storage.yml` file like this:

```yml
test:
  service: Disk
  root: <%= Rails.root.join("tmp/storage") %>

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

google:
  service: GCS
  project: <%= Rails.application.secrets.gcs[:project] %>
  bucket: <%= Rails.application.secrets.gcs[:bucket] %>
  credentials:
    type: "service_account"
    project_id: <%= Rails.application.secrets.gcs[:credentials][:project_id] %>
    private_key_id: <%= Rails.application.secrets.gcs[:credentials][:private_key_id] %>
    private_key: <%= Rails.application.secrets.gcs[:credentials][:private_key]&.dump %>
    client_email: <%= Rails.application.secrets.gcs[:credentials][:client_email] %>
    client_id: <%= Rails.application.secrets.gcs[:credentials][:client_id] %>
    auth_uri: "https://accounts.google.com/o/oauth2/auth"
    token_uri: "https://oauth2.googleapis.com/token"
    auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs"
    client_x509_cert_url: <%= Rails.application.secrets.gcs[:credentials][:client_url] %>
```

In the above mentioned `storage.yml` file, we are specifying to use the disk
storage for local and test environment. And we have added the google service
with all the required configuration which will be used in the production
environment.

## The String dump method

In the above mentioned `storage.yml` file, we have used a method called `dump`
for the `private_key` key. The `dump` method is a `String` class method which
returns the string with all non-printing characters replaced by `\xHH` notation
and all special characters escaped. This method helps in parsing the private key
which contains escape characters.

## Always add env variables to secrets.yml

Phew! That's a lot of work to manage secrets but there are many advantages of
handling secrets using this approach. First of all, we are not exposing any of
our secrets to the outside world. We at BigBinary, use this `secrets.yml` to
load all the env variables. We don't use the env variables directly in the
application. We use env variables in the application through the `secrets.yml`
file. This makes the `secrets.yml` file the single source of truth for all the
env variables. If any key or env variable needs to be updated then we only have
to update it in the `secrets.yml` file only.

## Add Active Storage

Let's update the `user.rb` file to associate the user with the PDF report, like
so:

```rb {4}
class User < ApplicationRecord
  # rest of the code
  has_one :preference, dependent: :destroy, foreign_key: :user_id
  has_one_attached :report
end
```

The attached `report` is an Active Storage table.

Update the `reports_worker.rb` file, like this:

```rb {12-19}
class ReportsWorker
  include Sidekiq::Worker

  def perform(user_id)
    tasks = Task.accessible_to(user_id)
    html_report = ApplicationController.render(
      assigns: {
      template: "tasks/report/download",
      layout: "pdf"
    )
    pdf_report = WickedPdf.new.pdf_from_string html_report
    current_user = User.find(user_id)
    if current_user.report.attached?
      current_user.report.purge_later
    end
    current_user.report.attach(
      io: StringIO.new(pdf_report), filename: "report.pdf",
      content_type: "application/pdf")
    current_user.save
  end
end
```

After adding the `report` association in the `user.rb` file we can access the
report by using `user.report`. In the `reports_worker.rb` file after generating
the PDF report, we are first checking if we already have a report file attached
by using `current_user.report.attached?`, where
[`attached?`](https://api.rubyonrails.org/classes/ActiveStorage/Attached/One.html#method-i-attached-3F)
is a method added by Active Storage.

If we have an old report file then as per our current business logic, we need to
first delete that file from the server using the method `purge_later`. The
`purge_later` method deletes the file via Active Job module in an async manner.
Then using the `.attach()` method we upload the file to the provider and then it
also attaches the file's reference to the `current_user`'s object.

Update the `download` action in the `reports_controller.rb` file to send the
report's data and to also respond to cases where report file is not found, like
so:

```rb {2-6}
def download
  unless @current_user.report.attached?
    render_error(t("not_found", entity: "report"), :not_found) and return
  end

  send_data @current_user.report.download, filename: pdf_file_name, content_type: "application/pdf"
end
```

The `download` method from Active Storage, downloads the file associated with
the `report` blob. If no block is given, the entire file is read into memory and
returned. That'll use a lot of RAM for very large files. If a block is given,
then the download is streamed and yielded in chunks. Here since our report file
is very small, we can directly invoke `download` without passing a block to it.

Now we are all set to verify whether Active Storage is working as expected. Go
to https://localhost:3000/tasks/report to check whether the file is getting
downloaded. Note that, right now the generated file will be stored in your local
file system by default. Meaning Active Storage won't be uploading any files to
Google Cloud. We will see how to ensure uploading to Google Cloud, in the next
section.

## Updating environments to use 3rd party provider

To use the Google cloud service in the production environment, update the
`production.rb` file, like this:

```rb
Rails.application.configure do
  # rest of the code
  config.active_storage.service = :google
end
```

The next code block needn't be added in `granite`. To test the Google cloud
service in local environment we can update the `development.rb` file, like this:

```rb
Rails.application.configure do
  # rest of the code
  config.active_storage.service = :google
end
```

Before pushing the code to production, it's always a good idea to test the
provider by setting the above configuration in `development.rb`. But make sure
to revert that change once you test it. Otherwise we'd end up using the free
credits and storage from the provider, and thus going over limit.

## WebSockets vs Polling

Developers often stumble upon cases where real-time communication is required
between a client and server. This includes applications that require instant
updates, such as chat applications, real-time multiplayer games, and financial
trading platforms.

Polling and WebSockets are two different approaches commonly used to achieve
real-time communication between a client and a server.

Polling involves the client making repeated HTTP requests to the server at a
specified interval to check for updates. This approach can work for simple
applications, but it can be inefficient because it generates a lot of
unnecessary network traffic. This can lead to high latency and increased server
load, which can be problematic for more complex and demanding applications.

WebSockets, on the other hand, allow for a persistent, bi-directional connection
between a client and a server, enabling real-time communication without the need
for repeated requests. This approach is more efficient than polling because it
reduces network overhead and server load, resulting in lower latency and
improved performance. WebSockets also allow faster and more reliable data
transfer.

Let us explore the two approaches from the granite point of view. In our
application, the user submits a request for the PDF report, and the server
processes the PDF, which may take some time. If we employ the polling approach,
the user's browser would repeatedly send requests to the server at a specified
interval to check the progress of the PDF processing. This can lead to increased
network traffic and server load, and it may also cause the user to experience
delays and decreased performance.

In contrast, if WebSockets are used, the server can establish a persistent
connection with the user's browser and send progress notifications in real-time.
This allows the user to receive updates on the processing progress without the
need for repeated requests. The user can also receive notifications as soon as
they become available, resulting in a faster and more responsive user
experience.

Action Cable is a feature of the Ruby on Rails web framework that provides a way
to integrate WebSockets into Rails applications. We will learn more about Action
cables in the next section.

## What is Action Cable?

Action Cable seamlessly integrates
[WebSockets](https://en.wikipedia.org/wiki/WebSocket) and allows for real-time
features to be written in Ruby in the same style and form as the rest of our
Rails application, while still being performant and scalable. Using Action Cable
we can send the progress notifications to the user while processing the PDF.

Before moving forward let's first understand more about some basic terminologies
which we will be using throughout the chapter.

- Connections: It is the foundation of the client-server communication. A single
  Action Cable server can handle multiple connection instances and a single user
  can have multiple connections or Websocket instances.

- Consumer: The client of a WebSocket connection is called the consumer. In
  Action Cable, the consumer is created by the client-side JavaScript framework.

- Channel: Understand this by taking television channels as an example. Each
  user or consumer can watch one or multiple channels to which they've
  subscribed to.

- Pub/Sub: Pub/Sub or Publish-Subscribe refers to a message queue paradigm where
  senders of information (publishers), send data to an abstract class of
  recipients (subscribers). As in a television channel, we can identify the
  subscribed users using the connection number, Action Cable channel uses this
  Pub/Sub to identify specific users subscribed to the channel.

## Setup Action Cable to send live notifications

Create the `channels` and `application_cable` directories, like this:

```bash
mkdir app/channels
mkdir app/channels/application_cable
```

Create the `connection.rb` file, like this:

```bash
touch app/channels/application_cable/connection.rb
```

Add the following code in the `connection.rb` file we created in the last step:

```rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

      def find_verified_user
        verified_user = User.find_by(
          email: request.query_parameters[:email],
          authentication_token: request.query_parameters[:auth_token])
        if verified_user
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
```

We are verifying the user who is trying to make the connection using their
`email` and `auth_token`. If the user is not found then we will reject the
connection request using the `reject_unauthorized_connection`.

Create a `channel.rb` file, like this:

```bash
touch app/channels/application_cable/channel.rb
```

Add the following lines in the `channel.rb` file:

```rb
module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end
```

The `Channel` class is currently empty because there aren't any data or
configurations that all channels need to inherit. But this class is more or less
like our `application_controller.rb` class from which all other controllers
inherit.

Let's create a channel for sending report generations's notification that is
`report_download_channel.rb`, like this:

```bash
touch app/channels/report_download_channel.rb
```

Add the following code in the `report_download_channel.rb` file:

```rb
class ReportDownloadChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:pubsub_token] if params[:pubsub_token].present?
  end

  def unsubscribed
    stop_all_streams
  end
end
```

When the user subscribes to the `ReportDownloadChannel`, user will receive the
data that is streamed with the given `pubsub_token`. We will discuss more about
`pubsub_token` later in this chapter

## Move hardcoded messages to translations file

Now let's add some notification messages to the `en.yml` file, like this:

```yml
en:
  # rest of the translations
  report:
    render: "Rendering the report"
    generate: "Generating the PDF report"
    upload: "Uploading to server"
    attach: "Attaching the report to the user"
```

Update the `reports_worker.rb` file to send the live notifications about PDF
file generation, like this:

```rb {3,6,15,18,26}
class ReportsWorker
  include Sidekiq::Worker
  include ActionView::Helpers::TranslationHelper

  def perform(user_id)
    ActionCable.server.broadcast(user_id, { message: t("report.render"), progress: 25 })
    tasks = Task.accessible_to(user_id)
    html_report = ApplicationController.render(
      assigns: {
        tasks:
      },
      template: "tasks/report/download",
      layout: "pdf"
    )
    ActionCable.server.broadcast(user_id, { message: t("report.generate"), progress: 50 })
    pdf_report = WickedPdf.new.pdf_from_string html_report
    current_user = User.find(user_id)
    ActionCable.server.broadcast(user_id, { message: t("report.upload"), progress: 75 })
    if current_user.report.attached?
      current_user.report.purge_later
    end
    current_user.report.attach(
      io: StringIO.new(pdf_report), filename: "report.pdf",
      content_type: "application/pdf")
    current_user.save
    ActionCable.server.broadcast(user_id, { message: t("report.attach"), progress: 100 })
  end
end
```

We are broadcasting the messages by using the `user_id` as `pubsub_token`. If
the user uses the same `pubsub_token`, that is `user_id`, while connecting to
the channel, the broadcasted messages will be received by the user.

Update the `create` action from the `reports_controller.rb`, like this:

```rb {2}
def create
  ReportsWorker.perform_async(current_user.id)
end
```

As you can see in the above code block, we have removed the `render_notice`
method from the `create` action because we don't want the `Toastr` notifications
to show up in the frontend side. We will be showing the progress notification
using Action Cable. We could've neglected the Toastr and moved on. But we
decided to remove it. That's the right mindset we need to build. Like having a
Toastr along with a progress notification just bloats the UI and tarnishes the
UX. Too many notifications is not necessary. If the consumer is already made
aware of what's happening, then we don't need to add anything more on top of
that.

Also, remove the `report_path` method from the `reports_controller.rb` because
we have delegated the job of handling generated files to Active Storage.

Update the `config/cable.yml` file to make Action Cable work, like this:

```yml {2,3}
development:
  adapter: redis
  url: <%= Rails.application.secrets.redis_url %>
```

## Setting up Action Cable in the frontend side

So we are done with the backend part. Let's start making changes in the frontend
side.

If you have a `channels` folder inside the `app/javascript`, then move it to the
`app/javascript/src` directory.

```sh
mv app/javascript/channels app/javascript/src
```

If there is no such folder then let's create one using the following command,
like this:

```sh
mkdir app/javascript/src/channels
```

Create an `index.js` file if it doesn't already exist inside the
`app/javascript/src/channels` directory, like this:

```bash
touch app/javascript/src/channels/index.js
```

Update the `index.js` file we just created, like this:

```js
// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);
```

Now, let's create a `consumer.js` file inside the `channels` directory, like this:

```bash
touch app/javascript/src/channels/consumer.js
```

Update the `consumer.js` file, like this:

```js
// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.

import { createConsumer } from "@rails/actioncable";

import { getFromLocalStorage } from "utils/storage";

const buildWebsocketURL = () => {
  const authToken = getFromLocalStorage("authToken");
  const email = getFromLocalStorage("authEmail");

  return encodeURI(`/cable?auth_token=${authToken}&email=${email}`);
};

export default () => createConsumer(buildWebsocketURL());
```

In the above mentioned `consumer.js` file we have invoked a function from
`actioncable` called `createConsumer` which can create a consumer object through
which we can subscribe to different channels.

Now, let's add the channel in the frontend through which we can communicate with
the `ReportDownloadChannel` which we had built in the backend.

Create the `reportDownloadChannel.js` file, like this:

```bash
touch app/javascript/src/channels/reportDownloadChannel.js
```

Add the following code in the `reportDownloadChannel.js` file:

```js
import { getFromLocalStorage } from "utils/storage";

export const subscribeToReportDownloadChannel = ({
  consumer,
  setMessage,
  setProgress,
  generatePdf,
}) => {
  const userId = getFromLocalStorage("authUserId");
  const reportDownloadSubscription = consumer.subscriptions.create(
    {
      channel: "ReportDownloadChannel",
      pubsub_token: userId,
    },
    {
      connected() {
        setMessage("Connected the Cables...");
        generatePdf();
      },
      received(data) {
        const { message, progress } = data;
        setMessage(message);
        setProgress(progress);
      },
    }
  );

  return reportDownloadSubscription;
};
```

Let's try to understand the `subscribeToReportDownloadChannel` function. This
function first creates a subscription to the `ReportDownloadChannel` for the
`consumer` object we have passed as props. While creating the subscription, a
`pubsub_token` carrying the value of `userId` is used to uniquely identify each
subscription to `ReportDownloadChannel` and transmit the correct data.

In the second argument of `create` method, we have two methods called
`connected` and `received`. As the name suggests the `connected` method is
invoked when a successful connection is made to the channel and the `received`
method will be invoked when some data is received by the channel.

## Add alias for channels folder

Let's add the alias for the `channels` directory. Update the `resolve.js` file
like this:

```javascript{9}
// Rest of the code if any

module.exports = {
  alias: {
    apis: absolutePath("src/apis"),
    common: absolutePath("src/common"),
    components: absolutePath("src/components"),
    constants: absolutePath("src/constants"),
    utils: absolutePath("src/utils"),
    channels: absolutePath("src/channels"),
  },
  // Rest of the code if any
};
```

## Create progress animation using framer-motion library

Now we will be using two new packages that are `file-saver` to save the PDF file
and `framer-motion` to create the progress bar animation.

Install the `file-saver` and `framer-motion` like this:

```bash
yarn add file-saver
yarn add framer-motion@6.5.1
```

Please note that we are utilizing version `6.5.1` of `framer-motion`. This is because starting from version 7, `framer-motion` requires a minimum supported version of `react@18`, whereas we are currently using `react@17`.

Now let's work on the progress bar. Create a file called `ProgressBar.jsx` in
the `Common` directory, like this:

```bash
touch app/javascript/src/components/Common/ProgressBar.jsx
```

Add the code in the `ProgressBar.jsx`, like this:

```jsx
import React from "react";

import classNames from "classnames";
import { motion } from "framer-motion";

const ProgressBar = ({ progress }) => (
  <div className="relative h-5 w-full overflow-hidden rounded-full bg-gray-200">
    <motion.div
      animate={{ width: `${progress}%` }}
      className="text-2xs flex h-5 animate-pulse items-center justify-center rounded-full bg-indigo-300 font-medium leading-none"
      initial={{ width: 0 }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
    >
      <span
        className={classNames("flex items-center justify-center", {
          "absolute left-1": progress <= 8,
        })}
      >
        {progress}%
      </span>
    </motion.div>
  </div>
);

export default ProgressBar;
```

The `ProgressBar` component gets a prop called `progress` and according to the
value of `progress`, the width of a `div` increases and appears to us like a
progress bar.

Now let's move on to the `DownloadReport` component. Fully update the
`DownloadReport` component like this:

```jsx
import React, { useEffect, useState } from "react";

import FileSaver from "file-saver";

import tasksApi from "apis/tasks";
import createConsumer from "channels/consumer";
import { subscribeToReportDownloadChannel } from "channels/reportDownloadChannel";
import Button from "components/Button";
import ProgressBar from "components/Common/ProgressBar";
import Container from "components/Container";

const DownloadReport = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [progress, setProgress] = useState(0);
  const [message, setMessage] = useState("");

  const consumer = createConsumer();

  const generatePdf = async () => {
    try {
      await tasksApi.generatePdf();
    } catch (error) {
      logger.error(error);
    }
  };

  const downloadPdf = async () => {
    setIsLoading(true);
    try {
      const { data } = await tasksApi.download();
      FileSaver.saveAs(data, "granite_task_report.pdf");
    } catch (error) {
      logger.error(error);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    subscribeToReportDownloadChannel({
      consumer,
      setMessage,
      setProgress,
      generatePdf,
    });

    return () => {
      consumer.disconnect();
    };
  }, []);

  useEffect(() => {
    if (progress === 100) {
      setIsLoading(false);
      setMessage("Report is ready to be downloaded");
    }
  }, [progress]);

  return (
    <Container>
      <div className="mx-auto mt-48 w-3/6 space-y-6 rounded-md border-2 p-4 text-center">
        <h1>{message}</h1>
        <ProgressBar progress={progress} />
        <Button
          buttonText="Download"
          loading={isLoading}
          onClick={downloadPdf}
        />
      </div>
    </Container>
  );
};

export default DownloadReport;
```

That's a lot of changes. Let's summarize the working of the PDF report feature.

- Let's start with the `DownloadReport` component. It has a state called
  `isLoading` which is initially set to `true` and this disables the download
  button. This component also creates a consumer object by invoking the
  `createConsumer` function.

- As soon as the `DownloadReport` component mounts it invokes the
  `subscribeToReportDownloadChannel` function to make the consumer, that is the
  current user, subscribe to the `ReportDownloadChannel`.

- As soon as the connection with the `ReportDownloadChannel` is set up, the
  `generatePdf` function is invoked which makes a request to the backend to
  create the PDF report.

- This report creation request starts the `ReportsWorker` in the backend. Now,
  this `ReportsWorker` performs several operations like creation of the PDF
  report, uploading the report to some 3rd party storage service using Active
  Storage, and attaching the report to the user who requested the PDF report.

- While creating the report, `ReportsWorker` broadcasts different messages and
  progress notifications using Action Cable. These broadcasted messages are
  collected by the `received` method inside the
  `subscribeToReportDownloadChannel` method in the frontend side.

- The `received` method updates the broadcasted `message` and `progress` states
  in the `DownloadReport` component and the same is reflected in the UI.

- When the value of the `progress` state reaches 100 we enable the download
  button by updating the `isLoading` state to `false`.

- Now when the download button is clicked `download` action is invoked in the
  `ReportsController` and the report's blob data is sent to the client. Then the
  `FileSaver` library handles the report file's blob and downloads the blob as a
  PDF file.

## Testing Action Cable

Create a file called `connection_test.rb`, like this:

```bash
touch test/channels/application_cable/connection_test.rb
```

The test case names should be pretty self-explanatory of what we are testing
here.

Test the Action Cable functionalities with the current user by updating the code
in `connection_test.rb` file, like this:

```rb
require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  include FactoryBot::Syntax::Methods

  def setup
    @user = create(:user)
  end

  def test_connection_success_when_auth_token_and_email_is_set_correctly
    connect params: { auth_token: @user.authentication_token, email: @user.email }
    assert_equal connection.current_user, @user
  end

  def test_connection_fails_when_credentials_are_empty
    assert_reject_connection { connect }
  end

  def test_connection_fails_when_user_is_not_verified
    assert_reject_connection {
      connect params: {
        auth_token: @user.authentication_token, email: "test@example.com"
      }
    }
  end
end
```

Create a new file called `report_download_channel_test.rb` to test the
`ReportDownloadChannel`, like this:

```bash
touch test/channels/report_download_channel_test.rb
```

Update the code in `report_download_channel_test.rb` file, like this:

```rb
require "test_helper"

class ReportDownloadChannelTest < ActionCable::Channel::TestCase
  def setup
    @user = create(:user)
    @pubsub_token = @user.id
  end

  def test_subscribed
    subscribe pubsub_token: @pubsub_token
    assert subscription.confirmed?
    assert_has_stream @pubsub_token
    unsubscribe
  end

  def test_does_not_subscribe_without_pubsub_token
    subscribe pubsub_token: nil
    assert_no_streams
  end
end
```

Go to the http://localhost:3000/tasks/report and checkout the new PDF report
feature.

Let's commit the changes

```bash
git add -A
git commit -m "Added Action Cable and Active Storage to generate PDF report"
```

## References

For more details, please refer:

- https://edgeguides.rubyonrails.org/active_storage_overview.html

- https://guides.rubyonrails.org/action_cable_overview.html

- https://www.framer.com/docs/

- https://cloud.google.com/storage/docs/creating-buckets

- [When to use Sockets over REST?](https://stackoverflow.com/a/45464306)
