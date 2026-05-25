@End2End
Feature: 05 NovatedApp End2End feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Collecting Driver details to validate in future task
    Given I setup environment and login with role "Driverneil"
    Given I load test data for "TC001" from "05_NovatedApp_End2End"
    Then I get first card values and store in excel "excel:Vehicle number" and "excel:Vehicle name"
    #Then I get lease end date and store in excel "excel:Lease End Date"
    Then I click on element with text "Submit Reimbursement"
    Then I get field "Last Odometer Reading" value and store in excel "excel:Last Odometer Reading"
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

  Scenario: TC002_Verify driver can raise request to Replace Fuel Card with reason Lost
    Given I setup environment and login with role "Driverneil"
    Given I load test data for "TC001" from "05_NovatedApp_End2End"
    Then I wait for "1" seconds
    Then I click on element with text "Fuel Cards"
    Then I wait for "2" seconds
    Then I click on element with text "Replace[3]"
    Then I populate field "Reason for replacement" with excel "excel:Replace Fuel Card"
    Then I verify text "1 Shelley St, Sydney NSW 2000" is present
    Then I verify button "Submit Request" is enabled
    Then I verify button "Cancel" is enabled
    Then I click on button "Submit Request"
    Then I verify text "Are you sure you wish to replace the selected fuel card? This will cancel your current fuel card" is present
    Then I click on button "yes"
    Then I wait for "2" seconds
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
    #Then I verify field "Delivery Address" contains excel "excel:Driver Your Residential Address"
    #Then I verify field "Fuel Card Number" contains excel "excel:"
    Then I verify field "Provider" contains excel "excel:Fuel Provider"
    Then I verify field "Replacement Reasoning" contains excel "excel:Replace Fuel Card"
    Then I get field "Request Submission Date" value and store in excel "excel:Request Submission Date"
    Then I get field "Last Update Date" value and store in excel "excel:Last Update Date"
    Then I wait for "2" seconds

  Scenario: TC003_Verify Novated lease specialist can view and complete decision on submitted Replace Fuel Card Request
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC002" from "05_NovatedApp_End2End"
    Then I wait for "2" seconds
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
    Then I get field "Fuel Card Number" value and store in excel "excel:Fuel Card Number"
    Then I verify field "Assigned To" contains "Unassigned"
    Then I wait for "5" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Driver Salutation"
    Then I verify field "First Name" contains excel "excel:Driver First Name"
    Then I verify field "Last Name" contains excel "excel:Driver Last Name"
    Then I verify field "Primary Email" contains excel "excel:Driver Email"
    Then I verify field "Mobile" contains excel "excel:Driver Mobile Phone"
    Then I verify field "Employer" contains "Test Employer"
    Then I verify field "State" contains "NSW"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle name"
    Then I verify field "Registration Number" contains excel "excel:Vehicle number"
#    Then I verify field "Vehicle Description" contains "VOLVO C40"
#    Then I verify field "Registration Number" contains "CPK418"
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
#    Then I click on button "Action Checklist"
#    Then I click on button "Submit"
