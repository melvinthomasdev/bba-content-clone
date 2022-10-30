There are many different attributes that we can specify for HTML forms. The following are some of the important ones:

- The _action_ attribute in the form element tells us where to send the form data after the form is submitted.

<Editor lang="html">
<code>
<form action="/home">
</form>
</code>
</Editor>

In the above example, the submitted data will be sent to the URL `/home`.

- The _method_ attribute specifies how to submit the form data. We use the **GET** and **POST** methods to submit form data. The default method is **GET**.

<Editor lang="html">
<code>
<form action="/login" method="post">
</form>
</code>
</Editor>

In the above example, the method used to send the submitted data is `post`.
