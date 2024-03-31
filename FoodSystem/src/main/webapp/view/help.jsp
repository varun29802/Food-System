<!DOCTYPE html>
<%
    // Check if user is logged in
    jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
    if (userSession == null || userSession.getAttribute("useremail") == null) {
        // User is not logged in, display a message using JavaScript
%>
<html>
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
    <title>Help&Support</title>
    <style>
        /* Common styles for both .vertical-div and .header */
        .shared-style {
            background-color: #0a74a8; /* Background color */
            padding: 10px; /* Add some padding */
        }

        /* Style for the container div */
        .container {
    overflow: auto; /* Hide both horizontal and vertical overflow */
    display: flex;
    justify-content: flex-start; /* Align items to the start of the container (left side) */
    height: 60vh; /* Make the container take up the full height of the viewport */
    padding-left: 21px; /* Add some padding to the left side */
}
        /* Style for the vertical div */
        .vertical-div {
            width: 200px; /* Set width as needed */
            margin-right: 10px; /* Add some space between the div and the rest of the content */
            height: 100%; /* Make the vertical div fill the entire height of its container */
        }

        /* Style for the header */
        .header {
            background-color: #296985; /* Change background color of header */
            padding: 16px; /* Add padding to the header */
        }

        /* Applying shared styles to both .vertical-div and .header */
        .vertical-div, .row-item {
            /* Include styles from .shared-style */
            background-color: #f0f2fc; /* Background color */
            padding: 10px; /* Add some padding */
        }

        /* Style for the rows */
        .row {
            /* Removed to eliminate default spacing between rows */
        }

        /* Set background color of body to match header */
        body {
            overflow: hidden;
            background-color: #296985; /* Change background color of body to match header */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        /* Container for all content except header */
        .main-content {
           
            padding: 49px;
            background-color: white; /* Change background color of main content */
            margin-left: 20px;
        }

        /* Style for small divs inside vertical-div */
        .small-div {
            background-color: #ccc; /* Background color of small div */
            padding: 15px; /* Add some padding */
            margin-bottom: 30px; /* Add some space between small divs */
            cursor: pointer; /* Change cursor to pointer to indicate clickable element */
        }

        /* Hover effect for small divs */
        .small-div:hover {
            background-color: #ddd; /* Change background color on hover */
        }

        /* Styles specific to Small Div 1 */
        .small-div-1 {
            background-color: white; /* Change background color */
        }

        /* Styles specific to Small Div 2 */
        .small-div-2 {
            background-color: white; /* Change background color */
        }

        /* Styles specific to Small Div 3 */
        .small-div-3 {
            background-color: white; /* Change background color */
        }

        /* Style for the row content */
        .row-content {
            background-color: inherit; /* Inherit the background color from the parent row */
            padding: 20px; /* Add padding */
        }

        /* Style for the horizontal line */
        .horizontal-line {
            border-bottom: 1px solid #ccc; /* Add horizontal line */
            margin-bottom: 10px; /* Add spacing between rows */
        }

        /* Style for the email input */
        .email-input {
            margin-top: 10px; /* Add some space between row content and email input */
        }

        /* Style for the submit button */
        .submit-button {
            padding: 10px 20px; /* Add padding */
            background-color: #4CAF50; /* Green background color */
            color: white; /* White text color */
            border: none; /* Remove border */
            border-radius: 5px; /* Add border radius */
            cursor: pointer; /* Add cursor pointer */
            margin-top: 10px; /* Add margin at the top */
        }

        /* Style for the button hover effect */
        .submit-button:hover {
            background-color: #45a049; /* Darker green */
        }

        .row-content:hover {
            font-size: 1.1em;
        color: rgb(235, 117, 6); /* Change text color to orange on hover */
    }
    .inerC {
        font-size: 0.9em;
        color: #030537;
    }



    .horizontal-line {
    border-bottom: 1px solid #ccc; /* Add horizontal line */
    margin: 20px 0; /* Add margin above and below the horizontal line */
}

/* Style for the cancel order form container */
#cancelOrderForm {
    display: none; /* Initially hide the form */
    margin-top: 20px; /* Add some space above the form */
}

/* Style for the form inputs */
#cancelOrderForm input[type="text"],
#cancelOrderForm input[type="email"],
#cancelOrderForm input[type="submit"] {
    width: 100%; /* Make inputs take up full width */
    margin-bottom: 10px; /* Add space between inputs */
    padding: 10px; /* Add padding to inputs */
    border: 1px solid #ccc; /* Add border to inputs */
    border-radius: 5px; /* Add border radius to inputs */
}

/* Style for the error message */
#errorMessage {
    color: red; /* Set text color to red */
    display: none; /* Initially hide the error message */
}
    .inputL{
        width: 100%; /* Make the input element take up full width */
    padding: 10px; /* Add padding */
    border: 1px solid #ccc; /* Add border */
    border-radius: 5px; /* Add border radius */
    box-sizing: border-box; /
    }


    </style>
</head>
<body>
    <div class="header">
        <h1 style="color: white;">Help & Support</h1> <!-- Decrease margin bottom -->
        <h2 style="color: white;">Let's take a step ahead and help you better.</h2>
    </div>
    <div class="main-content">
        <div class="container">
            <div class="vertical-div">
                <!-- Content of the vertical div -->
                
                <div class="small-div small-div-1" onclick="changeRowsContent(1)">Partner Onboarding</div>
                <div class="small-div small-div-2" onclick="changeRowsContent(2)">Legel</div>
                <div class="small-div small-div-3" onclick="changeRowsContent(3)">FAQs</div>
            </div>
            <div id="rowsContainer">
                <!-- Your other content -->
                <div class="horizontal-line"></div>
                <!-- Placeholder for additional content -->
            </div>
             <!-- Removed the .row container -->
        </div>
        
    </div>
 
  
   
        <script>
            // Load default content on page load
            window.onload = function() {
                changeRowsContent(1);
            };
        
            // Variable to store the reference of the email button
            var emailButton = null;
        
            // Variables to store whether additional content is already created
            var additionalContentCreated1 = false;
            var additionalContentCreated2 = false;
            var additionalContentCreated3 = false;
            var additionalContentCreated4 = false; // Terms of Use
            var additionalContentCreated5 = false; // Privacy Policy
            var additionalContentCreated6 = false; // Cancellations & Refunds
            var additionalContentCreated7 = false;//what is food system
            var additionalContentCreated9 = false;//is their
            
        
            function changeRowsContent(buttonNumber) {
                var rowsContainer = document.getElementById('rowsContainer');
        
                // Clear existing content
                rowsContainer.innerHTML = '';
        
                // Add new content based on button clicked
                switch(buttonNumber) {
                    case 1:
                        // Add default content for case 1
                        rowsContainer.innerHTML += `
                            <div class="row-content" onclick="addEmailInput(this)">I want to give Feedback food system</div>
                            <div class="horizontal-line"></div>
                            <div class="row-content" onclick="toggleAdditionalContent1(this)">What are the mandatory documents needed to list my food system</div>
                            <div class="horizontal-line"></div>
                            <div class="row-content" onclick="toggleAdditionalContent2(this)">After I submit all documents, how long will it take for my food system to go live? </div>
                            <div class="horizontal-line"></div>
                            <div class="row-content" onclick="toggleAdditionalContent3(this)">Who should I contact if I need help & support?</div>
                        `;
                        break;
                    case 2:
                        // Add content for case 2 (Terms of Use)
                        // Reuse functions for additional content toggling
                        rowsContainer.innerHTML += `
                            <div class="row-content" onclick="toggleAdditionalContent4(this)">Terms of Use</div>
                            <div class="horizontal-line"></div>
                            <div class="row-content" onclick="toggleAdditionalContent5(this)">Privacy Policy</div>
                            <div class="horizontal-line"></div>
                            <div class="row-content" onclick="toggleAdditionalContent6(this)">Cancellations & Refunds</div>
                        `;
                        break;
                    case 3:
                        // Add content for case 3
                        rowsContainer.innerHTML += `
                            <div class="row-content" onclick="toggleAdditionalContent7(this)">What is food System customer cares number?</div>
                            <div class="horizontal-line"></div>
                            <div class="row-content" onclick="showCancelOrderForm()">I want to cancel my Order</div>
                            <div id="cancelOrderFormContainer" style="display: none;">
                                <form id="cancelForm" action="/cancel" method="post">
                                    <input class="inputL" type="text" id="enterId" name="productId" placeholder="Enter Product ID"><br>
                                    <input class="inputL" type="email" id="enterEmail" name="email" placeholder="Enter Email"><br>
                                    <input type="button" class="submit-button" value="Cancel Order" onclick="cancelOrder()">
                                </form>
                                <div id="errorMessage" style="color: red; display: none;"></div>
                            </div>

    <div class="horizontal-line"></div>
                             <div class="row-content" onclick="toggleAdditionalContent9(this)">Is their a minimum order value?</div>
                        `;
                        break;
                }
            }
        
            // Function to add email button below the clicked row content
            function addEmailInput(element) {
                // Toggle the visibility of the email button
                if (!emailButton) {
                    // Create button element
                    emailButton = document.createElement('button');
                    emailButton.textContent = 'Send Email';
                    emailButton.classList.add('submit-button'); // Add class for styling
                    emailButton.addEventListener('click', function() {
                        sendEmail(); // Call sendEmail function when button is clicked
                    });
        
                    // Insert button below the clicked row content
                    element.insertAdjacentElement('afterend', emailButton);
                } else {
                    if (emailButton.style.display === 'none') {
                        emailButton.style.display = ''; // Show the button
                    } else {
                        emailButton.style.display = 'none'; // Hide the button
                    }
                }
            }
        
            // Function to send email
            function sendEmail() {
                // Open default email client
                window.open('mailto:recipient@example.com');
            }
        
            // Function to toggle additional content for the first row
            function toggleAdditionalContent1(element) {
                toggleAdditionalContent(element, additionalContentCreated1, 'additionalContentCreated1', `
                    <div class="inerC">
                        <p>Copies of the below documents are mandatory:</p>
                        <ul>
                            <li>FSSAI Licence OR FSSAI Acknowledgement</li>
                            <li>Pan Card</li>
                            <li>GSTIN Certificate</li>
                            <li>Cancelled Cheque OR bank Passbook</li>
                            <li>Menu</li>
                        </ul>
                    </div>
                `);
            }
        
            // Function to toggle additional content for the second row
            function toggleAdditionalContent2(element) {
                toggleAdditionalContent(element, additionalContentCreated2, 'additionalContentCreated2', `
                    <div class="inerC" >
                        <p>After all mandatory documents have been received and verified it takes upto 7-10 working days for the onboarding to be completed and make your restaurant live on the platform.</p>
                    </div>
                `);
            }
        
            // Function to toggle additional content for the third row
            function toggleAdditionalContent3(element) {
                toggleAdditionalContent(element, additionalContentCreated3, 'additionalContentCreated3', `
                    <div class="inerC">
                        <p>You can connect with Partner Support on 9876543210 or write to email to 'mailto:recipient@example.com'</p>
                    </div>
                `);
            }
        
            // Function to toggle additional content for Terms of Use
            function toggleAdditionalContent4(element) {
                toggleAdditionalContent(element, additionalContentCreated4, 'additionalContentCreated4', `
                    <div class="inerC">
                        <p>These terms of use (the "Terms of Use") govern your use of our website www.swiggy.in (the "Website") and our "Swiggy" application for mobile and handheld devices (the "App"). The Website and the App are jointly referred to as the "Services"). Please read these Terms of Use carefully before you download, install or use the Services. If you do not agree to these Terms of Use, you may not install, download or use the Services. By installing, downloading or using the Services, you signify your acceptance to the Terms of Use and Privacy Policy (being hereby incorporated by reference herein) which takes effect on the date on which you download, install or use the Services, and create a legally binding arrangement to abide by the same.</p>
                    </div>
                `);
            }
        
            // Function to toggle additional content for Privacy Policy
            function toggleAdditionalContent5(element) {
                toggleAdditionalContent(element, additionalContentCreated5, 'additionalContentCreated5', `
                    <div class="inerC">
                        <p>We ( Bundl Technologies Private Limited, alias "Swiggy" ) are fully committed to respecting your privacy and shall ensure that your personal information is safe with us. This privacy policy sets out the information practices of www.swiggy.com ("Website") including the type of information is collected, how the information is collected, how the information is used and with whom it is shared. Reference to "you" in this Privacy Policy refers to the users of this Website whether or not you access the services available on the Website or consummate a transaction on the Website.</p>
                    </div>
                `);
            }
        
            // Function to toggle additional content for Cancellations & Refunds
            function toggleAdditionalContent6(element) {
                toggleAdditionalContent(element, additionalContentCreated6, 'additionalContentCreated6', `
                    <div class="inerC">
                        <p>a) As a general rule you shall not be entitled to cancel your order once placed. You may choose to cancel your order only within one-minute of the order being placed by you. However, subject to your previous cancellation history, Swiggy reserves the right to deny any refund to you pursuant to a cancellation initiated by you even if the same is within one-minute.  b)If you cancel your order after one minute of placing it, Swiggy shall have a right to charge you 100% of the order amount as the cancellation fee , with a right to either not to refund the order value in case your order is prepaid or recover from your subsequent order in case your order is postpaid, to compensate our restaurant/merchants and delivery partners. c)Swiggy reserves the right to charge you cancellation fee for the orders constrained to be cancelled by Swiggy for reasons not attributable to Swiggy, including but not limited to: i)in the event if the address provided by you is either wrong or falls outside the delivery zone; ii) failure to contact you by phone or email at the time of delivering the order booking; iii) failure to deliver your order due to lack of information, direction or authorization from you at the time of delivery; or iv) unavailability of all the items ordered by you at the time of booking the order. However, in the unlikely event of an item on your order being unavailable, Swiggy will contact you on the phone number provided to us at the time of placing the order and inform you of such unavailability. In such an event you will be entitled to cancel the entire order and shall be entitled to a refund to an amount upto 100% of the order value. d)In case of cancellations for the reasons attributable to Swiggy or the restaurant partner or delivery partners, Swiggy shall not charge you any cancellation fee..</p>
                    </div>
                `);
            }
             // Function to toggle additional content for Cancellations & Refunds
             function toggleAdditionalContent7(element) {
                toggleAdditionalContent(element, additionalContentCreated6, 'additionalContentCreated6', `
                    <div class="inerC">
                        <p>We value our customer’s time and hence moved away from a single customer care number to a comprehensive chat-based support system for quick and easy resolution. You no longer have to go through the maze of an IVRS call support. Just search for your issue in the help section on this page and initiate a chat with us. A customer care executive will be assigned to you shortly. You can also email us your issue on support@swiggy.in</p>
                        </div>
                `);
            }
            
            function toggleAdditionalContent9(element) {
                toggleAdditionalContent(element, additionalContentCreated6, 'additionalContentCreated6', `
                    <div class="inerC">
                        <p>  We have no minimum order value and you can order for any amount.</p>
                           </div>
                `);
            }

            // Function to toggle additional content
            function toggleAdditionalContent(element, flag, flagName, content) {
                if (!flag) {
                    var additionalContent = document.createElement('div');
                    additionalContent.innerHTML = content;
        
                    // Insert additional content after the clicked row
                    element.insertAdjacentElement('afterend', additionalContent);
                    window[flagName] = true; // Set flag to indicate additional content creation
                } else {
                    // If additional content is already created, remove it
                    element.nextElementSibling.remove();
                    window[flagName] = false; // Reset the flag
                }
            }

            function showCancelOrderForm() {
                var cancelFormContainer = document.getElementById('cancelOrderFormContainer');
                if (cancelFormContainer.style.display === 'block') {
                    // If form is already displayed, hide it
                    cancelFormContainer.style.display = 'none';
                } else {
                    // Otherwise, display the form
                    cancelFormContainer.style.display = 'block';
                }
            }

            function cancelOrder() {
                var enterId = document.getElementById('enterId').value;
                var enterEmail = document.getElementById('enterEmail').value;

                // Check if the fields are not empty
                if (enterId.trim() === '' || enterEmail.trim() === '') {
                    var errorMessage = document.getElementById('errorMessage');
                    errorMessage.textContent = "Both fields are required.";
                    errorMessage.style.display = 'block';
                    return; // Exit the function if fields are empty
                }

                // Display confirmation alert message
                var confirmation = confirm("Are you sure you want to cancel the order?");
                if (!confirmation) {
                    return; // Exit the function if user cancels the action
                }

                // Proceed with submitting the cancellation request asynchronously
                var formData = new FormData();
                formData.append('productId', enterId);
                formData.append('email', enterEmail);

                fetch('/cancel', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to cancel order');
                        
                    }
                    // Return the JSON response
                    return response.json();
                })
                .then(data => {
                    // Check if the response contains an error message
                    if (data.hasOwnProperty('errorMessage')) {
                        // Display the error message in an alert popup
                        alert(data.errorMessage);
                    } else {
                        // Display success message if available, otherwise display a generic message
                        alert(data.success || "Order cancellation request received");
                        window.location.reload();
                    }
                })
                .catch(error => {
                    // Handle error here
                    console.error(error);
                    alert("An error occurred while processing your request.");
                    window.location.reload();
                });
            }
     </script>
        <%
    }
%>
    </body>
    </html>

