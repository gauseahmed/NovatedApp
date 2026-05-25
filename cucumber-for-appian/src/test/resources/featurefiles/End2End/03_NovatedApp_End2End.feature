@End2End @Check
Feature: 03 NovatedApp End2End feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Collecting Driver details to validate in future task
    Given I setup environment and login with role "Drivervisionpro"
    Given I load test data for "TC001" from "03_NovatedApp_End2End"
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

  Scenario: TC002_Verify driver can submit and verify request of reimbursement claim with correct information per claim type. Claim Type - Maintenance
    Given I setup environment and login with role "Drivervisionpro"
    Given I load test data for "TC001" from "03_NovatedApp_End2End"
    Then I click on element with text "Submit Reimbursement"
    Then I verify field "Last Odometer Reading" contains excel "excel:Last Odometer Reading"
    Then I get field "Last Reading Date" value and store in excel "excel:Last Reading Date"
    Then I get field "Reading Date" value and store in excel "excel:Reading Date"
    Then I verify field "New Odometer" is present
    Then I verify text "Claims" is present
    #Need to add auto calculation
    Then I populate field "New Odometer" with excel "excel:New Odometer"
    Then I click on icon link "plus-circle"
    Then I populate field "Claim Type" with excel "excel:Claim Type"
    Then I wait for "1" seconds
    Then I populate field "Amount" with excel "excel:Amount ($)"
    Then I populate field "Maintenance Activity Completed" with excel "excel:Maintenance Activity Completed"
    Then I populate field "File Upload[20]" with excel "excel:Proof of Payment"
    Then I populate field "File Upload[22]" with excel "excel:Tax Invoice"
    Then I click on button "Save"
    Then I wait for "1" seconds
    Then I click on icon link "square-o"
    Then I click on button "Submit Claim"
    Then I click on button "Yes"
    Then I verify text "Your request has been sent to the ORIX team." is present
    Then I click on button "DONE"
    Then I wait for "5" seconds
    #Then I get field "Odometer" value and store in excel "excel:Odometer"
    #Then I verify field "Odometer" contains excel "excel:Odometer"
    Then I click on element with text "My Requests"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I wait for "10" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify field "Vehicle" contains excel "excel:Vehicle"
    Then I verify button "Cancel Claim" is enabled
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Claim Amount" contains excel "excel:Amount ($)"
    Then I verify text "Submitted Documents" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
    Then I verify grid "[1]" column "File Name" row "[2]" contains "TaxInvoice.pdf"
    Then I verify grid "[1]" column "Type" row "[2]" contains "Tax Invoice"
     ## Update - below Submitted By and Updated By based on logged in driver user
    Then I verify field "Submitted By" contains excel "excel:Driver Name"
    Then I verify field "Request Submission Date" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Driver Name"
    Then I verify field "Last Update Date" contains excel "excel:Reading Date"
    Then I wait for "2" seconds

  Scenario: TC003_Verify Novated lease specialist can view and take decision on submitted claim
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC002" from "03_NovatedApp_End2End"
    Then I click on site page "Requests"
    Then I populate field "Search Requests" with excel "excel:Reference Number"
    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains "New"
        #Then I verify field "End Of Lease Date" contains excel "excel:Lease End Date"  //due to date format issue
    Then I verify field "End Of Lease Date" contains "25/09/2026"
    Then I verify field "Submitted By" contains excel "excel:Driver Name"
    Then I verify field "Submitted On" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Driver Name"
    Then I verify field "Updated On" contains excel "excel:Reading Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
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
    Then I verify field "Employer" contains "Test Employer"
    Then I verify field "State" contains "NSW"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle name"
    Then I verify field "Registration Number" contains excel "excel:Vehicle number"
#    Then I verify field "Vehicle Description" contains "FORD RANGER"
#    Then I verify field "Registration Number" contains "EXB72A"
    Then I verify field "Registration State" contains "VIC"
    Then I verify text "Files Uploaded" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
    Then I verify grid "[1]" column "File Name" row "[2]" contains "TaxInvoice.pdf"
    Then I verify grid "[1]" column "Type" row "[2]" contains "Tax Invoice"
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
