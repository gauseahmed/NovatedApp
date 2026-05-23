@Regression
Feature: 04 NovatedApp Regression feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Detailing_Verify driver can submit and verify request of reimbursement claim
    Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC001" from "04_NovatedApp_Regression"
    Then I click on element with text "Submit Reimbursement"
    Then I get field "Last Odometer Reading" value and store in excel "excel:Last Odometer Reading"
    Then I get field "Last Reading Date" value and store in excel "excel:Last Reading Date"
    Then I get field "Reading Date" value and store in excel "excel:Reading Date"
    Then I verify field "New Odometer" is present
    Then I verify text "Claims" is present
    Then I verify text "No Claims Added" is present

    Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC001" from "04_NovatedApp_Regression"
    Then I click on element with text "Submit Reimbursement"
    #Need to add auto calculation
    Then I populate field "New Odometer" with excel "excel:New Odometer"
    Then I click on icon link "plus-circle"
    Then I populate field "Claim Type" with excel "excel:Claim Type"
    Then I wait for "1" seconds
    Then I populate field "Amount" with excel "excel:Amount ($)"
    Then I populate field "File Upload[20]" with excel "excel:Proof of Payment"
    Then I populate field "File Upload[22]" with excel "excel:Tax Invoice"
    Then I click on button "Save"
    Then I wait for "1" seconds
    Then I click on icon link "square-o"
    Then I click on button "Submit Claim"
    Then I verify text "Are you sure you want to submit this Reimbursement Claim" is present
    Then I click on button "Yes"
    Then I verify text "Your request has been sent to the ORIX team." is present
    Then I verify text "You'll be notified once your request has been processed. You can view your submitted request at any time via the 'My Requests' tab." is present
    Then I click on button "DONE"
    Then I wait for "5" seconds
    Then I click on element with text "My Requests"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I wait for "10" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    Then I verify text "MAZDA CX-5 - FTV21M" is present
    Then I verify button "Cancel Claim" is enabled
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Claim Amount" contains excel "excel:Amount ($)"
    Then I verify text "Submitted Documents" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
     ## Update - below Submitted By and Updated By based on logged in driver user
    Then I verify field "Submitted By" contains "Toshihiko Inafune"
    Then I verify field "Request Submission Date" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains "Toshihiko Inafune"
    Then I verify field "Last Update Date" contains excel "excel:Reading Date"
    Then I wait for "2" seconds

  Scenario: TC002_Detailing_Verify Novated lease specialist can view and take decision on submitted claim
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC002" from "04_NovatedApp_Regression"
    Then I click on site page "Requests"
    Then I populate field "Search Requests" with excel "excel:Reference Number"
    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains excel "excel:Status"
    Then I verify field "End Of Lease Date" contains excel "excel:End Of Lease Date"
    Then I verify field "Submitted By" contains excel "excel:Submitted By"
    Then I verify field "Submitted On" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Updated By"
    Then I verify field "Updated On" contains excel "excel:Reading Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Dollar Amount" contains excel "excel:Amount ($)"
    Then I verify field "Assigned To" contains excel "excel:Assigned To"
    Then I wait for "3" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Salutation"
    Then I verify field "First Name" contains excel "excel:First Name"
    Then I verify field "Last Name" contains excel "excel:Last Name"
    Then I verify field "Primary Email" contains excel "excel:Primary Email"
    Then I verify field "Mobile" contains excel "excel:Mobile"
    Then I verify field "Employer" contains excel "excel:Employer"
    Then I verify field "State" contains excel "excel:State"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle Description"
    Then I verify field "Registration Number" contains excel "excel:Registration Number"
    Then I verify field "Registration State" contains excel "excel:Registration State"
    Then I verify text "Files Uploaded" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
    Then I verify text "Event History" is present
    Then I click on button "Take Ownership"
    Then I wait for "1" seconds
    Then I verify text "has been successfully assigned to you" is present
    Then I wait for "2" seconds
    Then I click on button "DONE"
    Then I wait for "2" seconds
    Then I verify field "Status" contains excel "excel:Status1"
    Then I verify field "Updated By" contains excel "excel:Updated By1"
    Then I verify field "Assigned To" contains excel "excel:Assigned To1"
    Then I verify text "Assigned Request" is present

  Scenario: TC003_Car Wash_Verify driver can submit and verify request of reimbursement claim
    Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC003" from "04_NovatedApp_Regression"
    Then I click on element with text "Submit Reimbursement"
    Then I get field "Last Odometer Reading" value and store in excel "excel:Last Odometer Reading"
    Then I get field "Last Reading Date" value and store in excel "excel:Last Reading Date"
    Then I get field "Reading Date" value and store in excel "excel:Reading Date"
    Then I verify field "New Odometer" is present
    Then I verify text "Claims" is present
    Then I verify text "No Claims Added" is present

    Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC003" from "04_NovatedApp_Regression"
    Then I click on element with text "Submit Reimbursement"
    #Need to add auto calculation
    Then I populate field "New Odometer" with excel "excel:New Odometer"
    Then I click on icon link "plus-circle"
    Then I populate field "Claim Type" with excel "excel:Claim Type"
    Then I wait for "1" seconds
    Then I populate field "Amount" with excel "excel:Amount ($)"
    Then I populate field "File Upload[20]" with excel "excel:Proof of Payment"
    Then I populate field "File Upload[22]" with excel "excel:Tax Invoice"
    Then I click on button "Save"
    Then I wait for "1" seconds
    Then I click on icon link "square-o"
    Then I click on button "Submit Claim"
    Then I verify text "Are you sure you want to submit this Reimbursement Claim" is present
    Then I click on button "Yes"
    Then I verify text "Your request has been sent to the ORIX team." is present
    Then I verify text "You'll be notified once your request has been processed. You can view your submitted request at any time via the 'My Requests' tab." is present
    Then I click on button "DONE"
    Then I wait for "5" seconds
    Then I click on element with text "My Requests"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I wait for "10" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    Then I verify text "MAZDA CX-5 - FTV21M" is present
    Then I verify button "Cancel Claim" is enabled
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Claim Amount" contains excel "excel:Amount ($)"
    Then I verify text "Submitted Documents" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
     ## Update - below Submitted By and Updated By based on logged in driver user
    Then I verify field "Submitted By" contains "Toshihiko Inafune"
    Then I verify field "Request Submission Date" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains "Toshihiko Inafune"
    Then I verify field "Last Update Date" contains excel "excel:Reading Date"
    Then I wait for "2" seconds

  Scenario: TC004_Car Wash_Verify Novated lease specialist can view  canceled request
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC004" from "04_NovatedApp_Regression"
    Then I click on site page "Requests"
    Then I populate field "Search Requests" with excel "excel:Reference Number"
    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains excel "excel:Status"
    Then I verify field "End Of Lease Date" contains excel "excel:End Of Lease Date"
    Then I verify field "Submitted By" contains excel "excel:Submitted By"
    Then I verify field "Submitted On" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Updated By"
    Then I verify field "Updated On" contains excel "excel:Reading Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Dollar Amount" contains excel "excel:Amount ($)"
    Then I verify field "Assigned To" contains excel "excel:Assigned To"
    Then I wait for "3" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Salutation"
    Then I verify field "First Name" contains excel "excel:First Name"
    Then I verify field "Last Name" contains excel "excel:Last Name"
    Then I verify field "Primary Email" contains excel "excel:Primary Email"
    Then I verify field "Mobile" contains excel "excel:Mobile"
    Then I verify field "Employer" contains excel "excel:Employer"
    Then I verify field "State" contains excel "excel:State"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle Description"
    Then I verify field "Registration Number" contains excel "excel:Registration Number"
    Then I verify field "Registration State" contains excel "excel:Registration State"
    Then I verify text "Files Uploaded" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
    Then I verify text "Event History" is present
    Then I click on button "Take Ownership"
    Then I wait for "1" seconds
    Then I verify text "has been successfully assigned to you" is present
    Then I wait for "2" seconds
    Then I click on button "DONE"
    Then I wait for "2" seconds
    Then I verify field "Status" contains excel "excel:Status1"
    Then I verify field "Updated By" contains excel "excel:Updated By1"
    Then I verify field "Assigned To" contains excel "excel:Assigned To1"
    Then I verify text "Assigned Request" is present

  Scenario: TC005_Verify driver can submit and verify request of reimbursement claim with other (Claim type other has been raised due to some spare damage.)
   Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC005" from "04_NovatedApp_Regression"
    Then I click on element with text "Submit Reimbursement"
    Then I get field "Last Odometer Reading" value and store in excel "excel:Last Odometer Reading"
    Then I get field "Last Reading Date" value and store in excel "excel:Last Reading Date"
    Then I get field "Reading Date" value and store in excel "excel:Reading Date"
    Then I verify field "New Odometer" is present
    Then I verify text "Claims" is present
    Then I verify text "No Claims Added" is present

    Given I setup environment and login with role "DriverInafune"
    Given I load test data for "TC005" from "04_NovatedApp_Regression"
    Then I click on element with text "Submit Reimbursement"
    #Need to add auto calculation
    Then I populate field "New Odometer" with excel "excel:New Odometer"
    Then I click on icon link "plus-circle"
    Then I populate field "Claim Type" with excel "excel:Claim Type"
    Then I wait for "1" seconds
    Then I populate field "Amount" with excel "excel:Amount ($)"
    Then I populate field "Claim Description" with excel "excel:Claim Description"
    Then I populate field "File Upload[20]" with excel "excel:Proof of Payment"
    Then I populate field "File Upload[22]" with excel "excel:Tax Invoice"
    Then I click on button "Save"
    Then I wait for "1" seconds
    Then I click on icon link "square-o"
    Then I click on button "Submit Claim"
    Then I verify text "Are you sure you want to submit this Reimbursement Claim" is present
    Then I click on button "Yes"
    Then I verify text "Your request has been sent to the ORIX team." is present
    Then I verify text "You'll be notified once your request has been processed. You can view your submitted request at any time via the 'My Requests' tab." is present
    Then I click on button "DONE"
    Then I wait for "5" seconds
    Then I click on element with text "My Requests"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I wait for "10" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    Then I verify text "MAZDA CX-5 - FTV21M" is present
    Then I verify button "Cancel Claim" is enabled
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Claim Amount" contains excel "excel:Amount ($)"
    Then I verify text "Submitted Documents" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
     ## Update - below Submitted By and Updated By based on logged in driver user
    Then I verify field "Submitted By" contains "Toshihiko Inafune"
    Then I verify field "Request Submission Date" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains "Toshihiko Inafune"
    Then I verify field "Last Update Date" contains excel "excel:Reading Date"
    Then I wait for "2" seconds

  Scenario: TC006_Verify Novated lease specialist can view and take decision on submitted claim with other (Claim type other has been raised due to some spare damage.)
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC006" from "04_NovatedApp_Regression"
    Then I click on site page "Requests"
    Then I populate field "Search Requests" with excel "excel:Reference Number"
    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains excel "excel:Status"
    Then I verify field "End Of Lease Date" contains excel "excel:End Of Lease Date"
    Then I verify field "Submitted By" contains excel "excel:Submitted By"
    Then I verify field "Submitted On" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Updated By"
    Then I verify field "Updated On" contains excel "excel:Reading Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Dollar Amount" contains excel "excel:Amount ($)"
    Then I verify field "Assigned To" contains excel "excel:Assigned To"
    Then I wait for "3" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Salutation"
    Then I verify field "First Name" contains excel "excel:First Name"
    Then I verify field "Last Name" contains excel "excel:Last Name"
    Then I verify field "Primary Email" contains excel "excel:Primary Email"
    Then I verify field "Mobile" contains excel "excel:Mobile"
    Then I verify field "Employer" contains excel "excel:Employer"
    Then I verify field "State" contains excel "excel:State"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle Description"
    Then I verify field "Registration Number" contains excel "excel:Registration Number"
    Then I verify field "Registration State" contains excel "excel:Registration State"
    Then I verify text "Files Uploaded" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
    Then I verify text "Event History" is present
    Then I click on button "Take Ownership"
    Then I wait for "1" seconds
    Then I verify text "has been successfully assigned to you" is present
    Then I wait for "2" seconds
    Then I click on button "DONE"
    Then I wait for "2" seconds
    Then I verify field "Status" contains excel "excel:Status1"
    Then I verify field "Updated By" contains excel "excel:Updated By1"
    Then I verify field "Assigned To" contains excel "excel:Assigned To1"
    Then I verify text "Assigned Request" is present
