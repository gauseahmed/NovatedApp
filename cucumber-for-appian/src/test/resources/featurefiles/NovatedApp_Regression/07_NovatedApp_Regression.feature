@Regression
Feature: 07 NovatedApp Regression feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Fuel Card_Verify driver can view fuel card details and status
    Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC001" from "07_NovatedApp_Regression"
    Then I get first card values and store in excel "excel:Vehicle number" and "excel:Vehicle name"
    Then I get lease end date and store in excel "excel:Lease End Date"
    Then I click on element with text "Fuel Cards"
    Then I wait for "2" seconds
    Then I verify text "ORIX Motorpass" is present
#    Then I verify field "Fuel Card" contains excel "excel:Fuel Card Number"
    Then I verify field "Card Type" contains excel "excel:Card Type"
    Then I verify field "Expiration date" contains excel "excel:Expiration date"
    Then I verify field "Status" contains excel "excel:Status"
    Then I verify field "Transactions" contains excel "excel:Transactions"
    Then I verify text "Actions" is present
    Then I verify text "Replace Fuel Card" is present
    Then I verify text "Cancel Fuel Card" is present
    Then I verify text "Request Fuel Card Pin Reset" is present


  Scenario: TC002_Fuel Card_Verify driver can request fuel card PIN
    Given I setup environment and login with role "Driverjosh"
    Given I load test data for "TC002" from "07_NovatedApp_Regression"
    Then I get first card values and store in excel "excel:Vehicle number" and "excel:Vehicle name"
    Then I get field "EOL Date" value and store in excel "excel:Lease End Date"
    #Driver profile information
    Then I click on element with text "Profile"
    Then I get field "Salutation" value and store in excel "excel:Driver Salutation"
    Then I get field "Legal First Name" value and store in excel "excel:Driver First Name"
    Then I get field "Legal Last Name" value and store in excel "excel:Driver Last Name"
    Then I get field "Date of Birth" value and store in excel "excel:Driver Date of Birth"
    Then I get field "Mobile Phone" value and store in excel "excel:Driver Mobile Phone"
    Then I get field "Email" value and store in excel "excel:Driver Email"
    Then I get field "Your Residential Address" value and store in excel "excel:Driver Your Residential Address"
    Then I get field "Employer Name" value and store in excel "excel:Driver Employer Name"
    Then I click on element with text "Home"
    Then I wait for "1" seconds
    Then I click on element with text "Fuel Cards"
    Then I wait for "2" seconds
    Then I click on element with text "Request Fuel Card Pin Reset"
    Then I verify text "Reset PIN" is present
    Then I verify text "More Details" is present
    Then I verify field "Vehicle Rego" contains excel "excel:Vehicle number"
    Then I verify field "Fuel Card Number" contains excel "excel:Fuel Card Number"
    Then I verify field "Card Type" contains excel "excel:Card Type"
    Then I verify field "Description" contains excel "excel:Description"
    Then I verify field "Status" contains excel "excel:Status"
    Then I populate field "Desired PIN" with excel "excel:Desired PIN"
    Then I wait for "2" seconds
    Then I click on button "Submit"
    Then I verify text "Confirm PIN Reset" is present
    Then I verify text "Are you sure you want to send a PIN reset on this card?" is present
    Then I click on button "Yes"
    Then I verify text "Your request has been sent to the ORIX team." is present
    Then I verify text "You'll be notified once your request has been processed. Click here to view your request." is present
    Then I click on button "DONE"
    Then I wait for "3" seconds
    Then I click on element with text "My Requests"
    Then I clear record type user filter "Status"
    Then I populate record type user filter "Status" with "excel:Status"
    Then I populate record type user filter "Request Type" with "excel:Request Type"
    Then I sort grid "[1]" by column "Reference Number"
    Then I sort grid "[1]" by column "Reference Number"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I wait for "2" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    Then I get field "Vehicle" value and store in excel "excel:Vehicle"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I get field "Request Subtype" value and store in excel "excel:Request Subtype"
    Then I verify field "Fuel Card Provider" contains excel "excel:Fuel Provider"
    Then I get field "Fuel Card Number" value and store in excel "excel:Fuel Card Number"
    Then I get field "Request Submission Date" value and store in excel "excel:Request Submission Date"
    Then I get field "Last Update Date" value and store in excel "excel:Last Update Date"
    Then I wait for "2" seconds


  Scenario: TC003_Fuel Card_Verify Novated lease specialist can view and take decision on submitted fuel card PIN request
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC003" from "07_NovatedApp_Regression"
    Then I click on site page "Requests"
    Then I populate field "Search Requests" with excel "excel:Reference Number"
    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains excel "excel:Status"
    Then I verify field "End Of Lease Date" contains excel "excel:Lease End Date Updated"
    Then I verify field "Submitted By" contains excel "excel:Submitted By"
    Then I verify field "Submitted On" contains excel "excel:Request Submission Date"
    Then I verify field "Updated By" contains excel "excel:Updated By"
    Then I verify field "Updated On" contains excel "excel:Request Submission Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Assigned To" contains excel "excel:Assigned To"
    Then I verify field "Fuel Card Provider" contains excel "excel:Fuel Provider"
    Then I wait for "5" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Driver Salutation"
    Then I verify field "First Name" contains excel "excel:Driver First Name"
    Then I verify field "Last Name" contains excel "excel:Driver Last Name"
    Then I verify field "Primary Email" contains excel "excel:Driver Email"
    Then I verify field "Mobile" contains excel "excel:Driver Mobile Phone"
    Then I verify field "Employer" contains excel "excel:Driver Employer Name"
    Then I verify field "State" contains excel "excel:State"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle name"
    Then I verify field "Registration Number" contains excel "excel:Vehicle number"
    Then I verify field "Registration State" contains excel "excel:Registration State"
    Then I verify text "Files Uploaded" is present
    Then I verify text "Event History" is present
    Then I click on button "Take Ownership"
    Then I wait for "2" seconds
    Then I verify text "has been successfully assigned to you" is present
    Then I click on button "DONE"
    Then I wait for "5" seconds
    Then I verify field "Status" contains excel "excel:Status1"
    Then I verify field "Updated By" contains excel "excel:Updated By1"
    Then I verify field "Assigned To" contains excel "excel:Assigned To1"
    Then I verify text "Assigned Request" is present

