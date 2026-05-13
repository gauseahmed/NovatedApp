@End2End
Feature: 07 NovatedApp End2End feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Verify driver can request payout
    Given I setup environment and login with role "Drivervisionpro"
    Given I load test data for "TC001" from "07_NovatedApp_End2End"
#    Then I get first card values and store in excel "excel:Vehicle number" and "excel:Vehicle name"
#    Then I get lease end date and store in excel "excel:Lease End Date"
#    #Storing Driver profile information as first step to validate in future tasks
#    Then I click on element with text "Profile"
#    Then I get field "Salutation" value and store in excel "excel:Driver Salutation"
#    Then I get field "Legal First Name" value and store in excel "excel:Driver First Name"
#    Then I get field "Legal Last Name" value and store in excel "excel:Driver Last Name"
#    Then I get field "Date of Birth" value and store in excel "excel:Driver Date of Birth"
#    Then I get field "Mobile Phone" value and store in excel "excel:Driver Mobile Phone"
#    Then I get field "Email" value and store in excel "excel:Driver Email"
#    Then I get field "Your Residential Address" value and store in excel "excel:Driver Your Residential Address"
#    Then I get field "Employer Name" value and store in excel "excel:Driver Employer Name"
#    Then I click on element with text "Home"
    Then I wait for "1" seconds
    Then I click on element with text "Request Payout"
    Then I wait for "2" seconds
    Then I verify text "ORIX can provide an indicative payout amount based on today’s date. This payout is informational only and does not obligate you to proceed. You will be able to review the estimate and decide whether you wish to continue, and early termination will only begin if you explicitly choose to proceed and accept the payout." is present
    Then I verify button "Continue" is enabled
    Then I verify button "Cancel" is enabled
    Then I click on button "Continue"
    Then I verify text "Your payout request was successful." is present
    Then I click on button "DONE"
    Then I wait for "1" seconds
    Then I click on element with text "View Payout"
    Then I wait for "1" seconds
    Then I verify field "Payout Amount" contains "$64,369.93"
    Then I verify field "Payout Valid-to Date:" contains "25 May 2026"
    Then I verify text "If you wish to proceed with terminating your lease, you will need to complete the next steps. This includes providing a remittance advice for payment and completing the required termination form. These items are required before your termination can be finalised. You will have the ability to withdraw the request up until the point of providing ORIX with your remittance advice." is present
    Then I verify button "PROCEED" is enabled
    Then I verify button "Cancel" is enabled
    Then I click on button "PROCEED"
    Then I click on button "UPLOAD PAYOUT DOCUMENTS"
    Then I wait for "1" seconds
    Then I populate field "File Upload[20]" with excel "excel:Remittance Advice"
    Then I populate field "Notes" with "Uploaded documents Successfully"
    Then I click on button "UPLOAD"
    Then I click on button "Complete Form: Motor Vehicle Declaration Form"
    Then I verify button "Save Draft" is enabled
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle name"
    Then I verify field "Registration Number" contains excel "excel:Vehicle number"
    Then I verify field "Driver" contains excel "excel:Driver Name"
    Then I verify field "Effective Date" contains excel "excel:Lease End Date"
    Then I verify field "Last Odometer Reading" contains excel "excel:Last Odometer Reading"
    Then I get field "Last Reading Date" value and store in excel "excel:Last Reading Date"
    Then I get field "Reading Date" value and store in excel "excel:Reading Date"
    Then I populate field "New Odometer" with excel "excel:New Odometer"
    Then I click on element with text "Add Declarations"
    Then I populate field "Date Surrendered" with excel "excel:Reading Date"
    Then I populate field "Date Collected" with excel "excel:Reading Date"
    Then I verify field "No. of FBT Days" contains "-1 day(s)"
    Then I populate field "Reason" with "declaration has been done"
    Then I verify button "Save" is enabled
    Then I verify button "Close" is enabled
    Then I click on button "Save"
    Then I click on icon link "square-o"
    Then I click on button "Submit"
    Then I verify text "Are you sure you want to submit this Motor Declarartion Entries" is present
    Then I click on button "Yes"
    Then I click on button "Submit"
    Then I wait for "1" seconds
    Then I verify text "Your payout request has been submitted. Our team is now processing your request and will be in touch if anything further is required." is present
    Then I click on button "CLOSE"
    Then I wait for "1" seconds
    Then I click on element with text "My Requests"
    Then I wait for "1" seconds
    Then I get grid "[1]" column "[1]" row "[1]" value and store in excel "excel:Reference Number"
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    Then I verify field "Vehicle" contains excel "excel:Vehicle"
    Then I verify button "Cancel Claim" is enabled
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Odometer Reading" contains excel "excel:Odometer"
    Then I verify field "Submitted By" contains excel "excel:Driver Name"
    Then I verify field "Request Submission Date" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Driver Name"
    Then I verify field "Last Update Date" contains excel "excel:Reading Date"


  Scenario: TC002_Verify Novated Lease  Specialist can view and action payout requests
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC002" from "07_NovatedApp_End2End"
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
    Then I verify grid "[1]" column "File Name" row "[1]" contains "RemittanceAdvice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Remittance Advice"
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
