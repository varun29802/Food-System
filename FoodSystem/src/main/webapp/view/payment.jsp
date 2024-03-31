<!DOCTYPE html>
<%
    // Check if user is logged in
    jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
    if (userSession == null || userSession.getAttribute("useremail") == null) {
        // User is not logged in, display a message using JavaScript
%>
<html lang="en">
<head>
<script>
    window.onload = function() {
        alert("You need to log in first to access this page.");
        window.location.href = "/";
    };
  </script>
  
  <%
    } else {
        // User is logged in, serve the page content
%>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Form</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body bgcolor="#FFFFFF">
  <div class="container" >
    <div class="wrapper">
      <form action="#" class="payment-method">
        <ul class="list-reset payment-method__list">
          <li class="payment-method__item">
            <div class="payment-method__col">
              <label class="custom-radio">
                <input type="radio" class="input-reset custom-radio__input" name="payment-method">
                <span class="custom-radio__text">Credit card</span>
              </label>
              <div class="payment-method__icons">           
                <img src="https://img.icons8.com/color/48/000000/visa.png" alt="Visa Icon">
                <img src="https://img.icons8.com/color/48/000000/mastercard.png" alt="Mastercard Icon">
              </div>
            </div>
            <label class="form-field">
              <span class="form-field__caption">Card number</span>
              <input type="text" class="input-reset form-field__input form-field__input--large" placeholder="0000 0000 0000 0000">
            </label>
            <div class="payment-method__col flex-sb">
              <label class="form-field">
                <span class="form-field__caption">Expiry date</span>
                <input type="text" class="input-reset form-field__input form-field__input--small" placeholder="mm/yy">
              </label>
              <label class="form-field">
                <span class="form-field__caption">CVC</span>
                <input type="text" class="input-reset form-field__input form-field__input--small" placeholder="000">
              </label>
            </div>
          </li>
          <li class="payment-method__item">
            <div class="payment-method__col">
              <label class="custom-radio">
                <input type="radio" name="payment-method" class="input-reset custom-radio__input" data-image="paypal-image">
                <span class="custom-radio__text">PayPal</span>
              </label>
              <div class="payment-method__icons">           
                <img src="https://img.icons8.com/sf-regular-filled/48/000000/paypal.png" alt="PayPal Icon">
              </div>
            </div>
            <div class="payment-method__col">
              <label class="custom-radio">
                <input type="radio" class="input-reset custom-radio__input" name="payment-method" data-image="applepay-image">
                <span class="custom-radio__text">ApplePay</span>
              </label>
              <div class="payment-method__icons">           
                <img src="https://img.icons8.com/ios-filled/48/000000/apple-pay.png" alt="Apple Pay Icon">
              </div>
            </div>
            <div class="payment-method__col">
              <label class="custom-radio">
                <input type="radio" class="input-reset custom-radio__input" name="payment-method" data-image="googlepay-image">
                <span class="custom-radio__text">GooglePay</span>
              </label>
              <div class="payment-method__icons">           
                <img src="https://img.icons8.com/material/48/000000/google-pay.png" alt="Google Pay Icon">
              </div>
            </div>
          </li>
          <li class="payment-method__item">
            <label class="custom-radio">
              <input type="radio" class="input-reset custom-radio__input" name="payment-method">
              <span class="custom-radio__text">Cash on delivery</span>
            </label>
          </li>
          <li class="payment-method__item">
            <button class="btn-reset">Place Order</button>
          </li>
        </ul>
      </form>
    </div>
  </div>

  <!-- Hidden images for PayPal, ApplePay, and GooglePay -->
  <div class="drawer" id="drawer">
    <img src="images/Canadian-Dream-WhatsApp-group-3.jpg" alt="PayPal QR Code" class="hidden-image" id="paypal-image">
    <img src="images/Canadian-Dream-WhatsApp-group-3.jpg" alt="ApplePay QR Code" class="hidden-image" id="applepay-image">
    <img src="images/Canadian-Dream-WhatsApp-group-3.jpg" alt="GooglePay QR Code" class="hidden-image" id="googlepay-image">
  </div>

  <script>
    const radioInputs = document.querySelectorAll('.custom-radio__input');
    const drawer = document.getElementById('drawer');

    radioInputs.forEach(input => {
      input.addEventListener('change', function() {
        const targetImageId = this.dataset.image;
        const targetImage = document.getElementById(targetImageId);
        const hiddenImages = document.querySelectorAll('.hidden-image');

        // Hide all images
        hiddenImages.forEach(image => {
          image.style.display = 'none';
        });

        // Show the target image
        targetImage.style.display = 'block';

        // Show the drawer
        drawer.classList.add('open');
      });
    });
  </script>
  
<%
    }
%>
</body>
</html>

<style>
@import url("https://fonts.googleapis.com/css2?family=Lato:wght@400;700;900&display=swap");

html {
  box-sizing: border-box;
  height: 100%;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}

body {
  
  margin: 0;
  font-family: "Lato", sans-serif;
  font-size: 16px;
}

a {
  text-decoration: none;
  color: inherit;
}

p {
  margin: 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 0;
}

figure {
  margin: 0;
}

img {
  display: block;
  height: auto;
  max-width: 100%;
  object-fit: cover;
}

.container {
  margin: 0 auto;
  padding: 0 15px;
  max-width: 1260px;
  overflow: hidden;
}

.list-reset {
  list-style: none;
  margin: 0;
  padding: 0;
}

.btn-reset {
  border: none;
  padding: 18px;
  background: transparent;
  cursor: pointer;
  transition: background-color 0.3s ease; /* Add transition for smooth color change */
}

.btn-reset:hover {
  background-color: #4CAF50; /* Change the background color on hover */
}

.input-reset {
  -webkit-appearance: none;
  appearance: none;
  border: none;
  border-radius: 0;
  background-color: #fff;
  outline: none;
}

.flex-sb {
  justify-content: space-between;
}

.wrapper {
  padding: 50px; /* Reduced padding for better appearance */
  display: flex;
  align-items: center;
  justify-content: center;
}

.form-field {
  position: relative;
  display: flex;
  flex-direction: column;
}

.form-field__caption {
  margin-bottom: 8px;
  font-weight: 400;
  color: #424551;
}

.form-field__input {
  outline: none;
  background-color: #ffffff;
  border: 1px solid #d7dadd;
  border-radius: 4px;
  padding: 12px; /* Adjust padding to your preference */
  font-weight: 400;
  transition: border-color 0.3s ease-in-out;
}

.form-field__input::placeholder {
  color: #9a9ca5;
}

.form-field__input:focus {
  border: 1px solid rgba(23, 105, 106, 0.4);
  box-shadow: 0 80px 80px -20px rgba(23, 105, 106, 0.08),
    0 30px 24px -10px rgba(23, 105, 106, 0.05),
    0 12px 10px -6px rgba(23, 105, 106, 0.04),
    0 4px 4px -4px rgba(30, 33, 44, 0.03);
}

.custom-radio {
  display: inline-block;
}

.custom-radio__input {
  position: absolute;
  appearance: none;
}

.custom-radio__text {
  position: relative;
  display: inline-block;
  padding-left: 27px;
  font-weight: 700;
  font-size: 16px;
  line-height: 160%;
  color: #424551;
}

.custom-radio__text::before {
  content: "";
  position: absolute;
  left: -1px;
  top: 4px;
  display: inline-block;
  border: 1px solid #b3b7bc;
  border-radius: 100%;
  width: 16px;
  height: 16px;
  transition: border-color 0.3s ease-in-out;
}

.custom-radio__text::after {
  content: "";
  position: absolute;
  left: -1px;
  top: 4px;
  width: 16px;
  height: 16px;
  background-image: url("data:image/svg+xml,%3Csvg width='8' height='8' viewBox='0 0 8 8' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Ccircle cx='4' cy='4' r='4' fill='%2317696A'/%3E%3C/svg%3E");
  background-position: center;
  background-repeat: no-repeat;
  background-size: 8px 8px;
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
}

.custom-radio__input:checked + .custom-radio__text::before {
  border-color: #17696a;
}

.custom-radio__input:checked + .custom-radio__text::after {
  opacity: 1;
}
.payment-method__item {
  display: flex;
  flex-direction: column;
  padding: 24px;
  background-color: #ffffff;
  border-radius: 4px;
  border: 1px solid #e5e8ed;
  box-shadow: 0 80px 80px -20px rgba(154, 156, 165, 0.08),
    0 30px 24px -10px rgba(154, 156, 165, 0.05),
    0 12px 10px -6px rgba(154, 156, 165, 0.04),
    0 4px 4px -4px rgba(30, 33, 44, 0.03);
  margin-bottom: 16px; /* Added margin bottom */
}

.payment-method__col {
  display: flex;
  align-items: center;
  justify-content: space-between; /* Adjusted alignment */
  margin-bottom: 16px; /* Adjusted margin */
}

.payment-method__icons {
  display: flex;
}

.payment-method__icons img {
  margin-right: 8px; /* Added margin-right for spacing between icons */
}

.form-field {
  flex: 1; /* Added to make the form fields fill remaining space */
}

.form-field__input {
  flex: 1; /* Added to make the input fill remaining space */
}

.flex-sb {
  justify-content: space-between;
  width: 100%; /* Added width to ensure proper alignment */
}

.drawer {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: #ffffff;
  padding: 20px;
  box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;
  transform: translateY(100%);
}

.drawer.open {
  transform: translateY(0);
}

.drawer img {
  display: none;
}

.drawer img:first-child {
  display: block;
}
</style>
