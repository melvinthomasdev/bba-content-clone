Add the following widths to the respective selectors:

1. Set a width of `300px` for `.contact-card-primary`.
2. Set a width of `80mm` to `.contact-card-secondary`.
3. Set a width of `200pt` to `.contact-card-alt`.
4. Set a width of `18pc` for `.contact-card-custom`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="contact-container">
  <div class="contact-card contact-card-primary">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Steph Curry</p>
    <p>Email: stephcurry30@example.com</p>
    <p>Phone: +1 (123) 456-7890</p>
  </div>
  </div>

  <div class="contact-card contact-card-secondary">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Lebron James</p>
    <p>Email: lebronjames23@example.com</p>
    <p>Phone: +1 (456) 123-7890</p>
  </div>
  </div>
  <div class="contact-card contact-card-alt">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Klay Thompson</p>
    <p>Email: klaythompson11@example.com</p>
    <p>Phone: +1 (789) 456-1230</p>
  </div>
  </div>
  <div class="contact-card contact-card-custom">
  <h2>Contact Information</h2>
  <div class="info">
    <p>Name: Shaqeel O'neal</p>
    <p>Email: shaq27@example.com</p>
    <p>Phone: +1 (987) 456-1230</p>
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
.contact-card-alt {
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
  width: 300px;
  background-color: #f0f0f0;
}
.contact-card-secondary {
  width: 80mm;
  background-color: paleturquoise;
}
.contact-card-alt {
  width: 200pt;
  background-color: lightgoldenrodyellow;
}
.contact-card-custom {
  width: 18pc;
  background-color: lavender;
}
</solution>
</codeblock>
