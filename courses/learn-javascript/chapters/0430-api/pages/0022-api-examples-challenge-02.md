We are developing a new tourism app that includes a feature allowing users to find the country associated with a specific currency code. Your task is to configure the CURRENCY_API_ENDPOINT variable in the code provided below to ensure this feature functions correctly.

For this, use the data from `https://restcountries.com/` and update the value of the CURRENCY_API_ENDPOINT variable to connect to the appropriate API endpoint for retrieving country information based on currency codes. 

**Only update the value assigned to the CURRENCY_API_ENDPOINT variable.**

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div id="country-info">
    <h2>Enter Currency Code:</h2>
    <form id="country-form">
      <input type="text" id="currency-code" placeholder="Enter currency code" required>
      <button id="country-form-button" type="submit">Check</button>
    </form>
    <span id="intro-text"></span>
    <span id="list-of-countries"></span>
  </div>
</div>
</panel>
<panel hidden="true" language="css">
.container {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

#country-info {
background-color: #fff;
border-radius: 8px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
padding: 20px;
text-align: center;
}

h2 {
margin-top: 0;
}

input[type="text"] {
padding: 10px;
border: 1px solid #ccc;
border-radius: 4px;
margin-right: 10px;
}

button[type="submit"] {
padding: 10px 20px;
background-color: #007bff;
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
background-color: #0056b3;
}

#intro-text {
display: block;
margin-top: 20px;
font-weight: bold;
}

#list-of-countries {
display: block;
margin-top: 10px;
font-size: 14px;
}
</panel>
<panel language="javascript">
const countryForm = document.getElementById('country-form');
const currencyCodeInput = document.getElementById('currency-code');
const introTextSpan = document.getElementById('intro-text');
const listOfCountriesSpan = document.getElementById('list-of-countries');

const fetchCountryInfo = (currencyCode) => {
  const CURRENCY_API_ENDPOINT = '';
  fetch(`${CURRENCY_API_ENDPOINT}/${currencyCode}`)
    .then(response => {
      if (!response.ok) {
        throw new Error('Failed to fetch country data');
      }
      return response.json();
    })
    .then(data => {
      const countryNames = data.map(country => country.name.common).join(', ');
      if (data.length > 1) {
        introTextSpan.textContent = "You could be in any of these countries:";
      } else {
        introTextSpan.textContent = "You are currently in ";
      }
      listOfCountriesSpan.textContent = countryNames;
    })
    .catch(error => {
      introTextSpan.textContent = `Error: ${error.message}`;
      listOfCountriesSpan.textContent = "";
    });
}

countryForm.addEventListener('submit', (event) => {
  event.preventDefault();
  const currencyCode = currencyCodeInput.value.trim();
  if (currencyCode) {
    introTextSpan.textContent = "Loading...";
    fetchCountryInfo(currencyCode);
  } else {
    introTextSpan.textContent = 'Please enter a currency code.';
    listOfCountriesSpan.textContent = "";
  }
});
</panel>

</code>

<solution>
const countryForm = document.getElementById('country-form');
const currencyCodeInput = document.getElementById('currency-code');
const introTextSpan = document.getElementById('intro-text');
const listOfCountriesSpan = document.getElementById('list-of-countries');

const fetchCountryInfo = (currencyCode) => {
  const CURRENCY_API_ENDPOINT = 'https://restcountries.com/v3.1/currency';
  fetch(`${CURRENCY_API_ENDPOINT}/${currencyCode}`)
    .then(response => {
      if (!response.ok) {
        throw new Error('Failed to fetch country data');
      }
      return response.json();
    })
    .then(data => {
      const countryNames = data.map(country => country.name.common).join(', ');
      if (data.length > 1) {
        introTextSpan.textContent = "You could be in any of these countries:";
      } else {
        introTextSpan.textContent = "You are currently in ";
      }
      listOfCountriesSpan.textContent = countryNames;
    })
    .catch(error => {
      introTextSpan.textContent = `Error: ${error.message}`;
      listOfCountriesSpan.textContent = "";
    });
}

countryForm.addEventListener('submit', (event) => {
  event.preventDefault();
  const currencyCode = currencyCodeInput.value.trim();
  if (currencyCode) {
    introTextSpan.textContent = "Loading...";
    fetchCountryInfo(currencyCode);
  } else {
    introTextSpan.textContent = 'Please enter a currency code.';
    listOfCountriesSpan.textContent = "";
  }
});
</solution>
</codeblock>
