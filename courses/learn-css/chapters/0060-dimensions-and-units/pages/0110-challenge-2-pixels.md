Add the following widths to the respective selectors:

1. Set a width of `270px` for `.contact-card-primary`.
2. Set a width of `250px` to `.contact-card-secondary`.
3. Set a width of `200px` for `.contact-card-custom`.
4. Set a width of `150px` to `.contact-card-small`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="contact-container">
  <div class="contact-card contact-card-primary">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Eve Smith</p>
    <p>Email: evesmith@example.com</p>
    <p>Phone: +1 (123) 456-7890</p>
  </div>
  </div>

  <div class="contact-card contact-card-secondary">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Eve Smith</p>
    <p>Email: evesmith@example.com</p>
    <p>Phone: +1 (123) 456-7890</p>
  </div>
  </div>
  <div class="contact-card contact-card-custom">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Eve Smith</p>
    <p>Email: evesmith@example.com</p>
    <p>Phone: +1 (123) 456-7890</p>
  </div>
  </div>
  <div class="contact-card contact-card-small">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Eve Smith</p>
    <p>Email: evesmith@example.com</p>
    <p>Phone: +1 (123) 456-7890</p>
  </div>
  </div>
</div>
</panel>
<panel language="css">
.contact-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.contact-card {
  padding: 20px;
  background-color: #f0f0f0;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin: 10px;
}
h2 {
  font-size: 24px;
}
.info {
  font-size: 16px;
}
.contact-card-primary {
  background-color: #f0f0f0;
}
.contact-card-secondary {
  background-color: paleturquoise;
}
.contact-card-small {
  background-color: lightgoldenrodyellow;
}
.contact-card-custom {
  background-color: lavender;
}
</panel>
</code>

<solution>
.contact-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.contact-card {
  padding: 20px;
  background-color: #f0f0f0;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin: 10px;
}
h2 {
  font-size: 24px;
}
.info {
  font-size: 16px;
}
.contact-card-primary {
  width: 270px;
  background-color: #f0f0f0;
}
.contact-card-secondary {
  width: 250px;
  background-color: paleturquoise;
}
.contact-card-custom {
  width: 200px;
  background-color: lavender;
}
.contact-card-small {
  width: 150px;
  background-color: lightgoldenrodyellow;
}

</solution>
</codeblock>
