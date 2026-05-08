@End2End
Feature: 06 NovatedApp End2End feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Verify driver can raise request to Add New Fuel Card
    Given I setup environment and login with role "Drivervisionpro"
    #Storing Driver profile information as first step to validate in future tasks
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
    Given I load test data for "TC001" from "06_NovatedApp_End2End"
    Then I click on element with text "Fuel Cards"
    Then I wait for "2" seconds
    Then I click on element with text "Add New Fuel Card"
    #Commented below as we have only 1 option which is already selected
    #Then I populate field "Fuel Provider" with excel "Fuel Provider"
    Then I verify text "8 Alfred St, Lilyfield NSW 2040" is present
    Then I get field "Delivery Address" value and store in excel "excel:Delivery Address"
    Then I verify button "Submit Request" is enabled
    Then I verify button "Cancel" is enabled
    Then I click on button "Submit Request"
    Then I verify text "Are you sure you wish to order the selected fuel card?" is present
    Then I click on button "yes"
    Then I verify text "Your request has been sent to the ORIX team." is present
    Then I click on button "DONE"
    Then I wait for "1" seconds
    Then I click on element with text "My Requests"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I wait for "2" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    Then I get field "Vehicle" value and store in excel "excel:Vehicle"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I get field "Request Subtype" value and store in excel "excel:Request Subtype"
    Then I verify field "Fuel Card Provider" contains excel "excel:Fuel Provider"
    Then I get field "Request Submission Date" value and store in excel "excel:Request Submission Date"
    Then I get field "Last Update Date" value and store in excel "excel:Last Update Date"
    Then I wait for "2" seconds

  Scenario: TC002_Verify Novated lease specialist can view and complete decision on submitted Add New Fuel Card
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC002" from "04_NovatedApp_End2End"
    Then I click on site page "Requests"
    Then I populate field "Search Requests" with excel "excel:Reference Number"
    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains "New"
    Then I verify field "End Of Lease Date" contains "25/09/2026"
    Then I verify field "Submitted By" contains excel "excel:Driver Name"
    #Then I verify field "Submitted On" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Driver Name"
    #Then I verify field "Updated On" contains excel "excel:Reading Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Request Subtype"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Dollar Amount" contains excel "excel:Amount ($)"
    Then I verify field "Assigned To" contains "Unassigned"
    Then I wait for "5" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Driver Salutation"
    Then I verify field "First Name" contains excel "excel:Driver First Name"
    Then I verify field "Last Name" contains excel "excel:Driver Last Name"
    Then I verify field "Primary Email" contains excel "excel:Driver Email"
    Then I verify field "Mobile" contains excel "excel:Driver Mobile Phone"
    Then I verify field "Employer" contains excel "excel:Driver Employer Name"
    Then I verify field "State" contains "NSW"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains "VOLVO C40"
    Then I verify field "Registration Number" contains "CPK418"
    Then I verify field "Registration State" contains "VIC"
    Then I verify text "Files Uploaded" is present
    Then I verify text "Event History" is present
    Then I click on button "Take Ownership"
    Then I wait for "1" seconds
    Then I verify text "has been successfully assigned to you" is present
    Then I click on button "DONE"
    Then I wait for "2" seconds
    Then I verify field "Status" contains "In Progress"
    Then I verify field "Updated By" contains "Auto Lease"
    Then I verify field "Assigned To" contains "Auto Lease"
    Then I verify text "Assigned Request" is present
    Then I click on button "Action Checklist"
    Then I click on button "Submit"
