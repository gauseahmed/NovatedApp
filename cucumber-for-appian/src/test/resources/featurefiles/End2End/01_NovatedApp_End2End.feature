@End2End
Feature: 01 NovatedApp End2End feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Collecting Driver details to validate in future task
    Given I setup environment and login with role "Driver_191799"
    Given I load test data for "TC001" from "01_NovatedApp_End2End"
    Then I wait for "2" seconds
    Then I get field "Latest Reading (kms)" value and store in excel "excel:Last Odometer Reading"
    Then I click on element with text "Profile[2]"
    Then I wait for "2" seconds
#    Then I verify text "Please ensure your details are accurate." is present
    Then I get field "Salutation" value and store in excel "excel:Driver Salutation"
    Then I get field "First Name" value and store in excel "excel:Legal First Name"
    Then I get field "Middle Name" value and store in excel "excel:Legal Middle Name"
    Then I get field "Last Name" value and store in excel "excel:Legal Last Name"
#    Then I get field "Date of Birth" value and store in excel "excel:Driver Date of Birth"
    Then I get field "Mobile Number" value and store in excel "excel:Driver Mobile Phone"
    Then I get field "Email" value and store in excel "excel:Driver Email"
#    Then I get field "Work Email" value and store in excel "excel:Driver Work Email"
    Then I get field "Employer Name" value and store in excel "excel:Driver Employer Name"
    Then I get field "Employer ABN" value and store in excel "excel:Employer ABN"
    Then I get field "Residential Address" value and store in excel "excel:Driver Residential Address"
    Then I verify text "Edit Profile" is present
#    Then I get field "Your Postal Address[2]" value and store in excel "excel:Driver Postal Address"
#    Then I get field "Account Name" value and store in excel "excel:Account Name"
#    Then I get field "Account Holder" value and store in excel "excel:Account Holder"
#    Then I get field "Your Postal Address" value and store in excel "excel:Driver Postal Address"
#    Then I verify text "Automotive Specification Data Powered by JATO Dynamics Limited." is present
#    Then I verify text "© JATO Dynamics Limited 1990 – 2024. All rights reserved. JATO uses all reasonable endeavours to provide accurate and complete information however, JATO does not warrant accuracy or completeness of the data provided. User assumes sole responsibility for results obtained from the use of the data." is present


  Scenario: TC002_Verify driver can submit and verify request of reimbursement claim with correct information per claim type. Claim Type - Fuel
    Given I setup environment and login with role "Driver_191799"
    Given I load test data for "TC002" from "01_NovatedApp_End2End"
    Then I verify text "Have a reimbursement to make?" is present
    Then I click on element with text "Claim Reimbursement[2]"
    Then I wait for "2" seconds
    Then I verify text "Claim Reimbursement" is present
    Then I populate field "Current Odometer Reading*" with excel "excel:New Odometer"
    Then I click on button "Next"
    Then I verify text "Select Claim Type" is present
    Then I verify text "You can select up to " is present
    Then I verify text "Not sure if the expense is claimable?" is present
    Then I verify text "View FAQs." is present
    Then I click on element with text "Fuel"
    Then I click on button "Next"
    #Claim Details
    Then I verify text "Claim Details" is present
    Then I verify text "Fuel" is present
    Then I wait for "1" seconds
    Then I populate field "Amount (inc. GST)" with excel "excel:Amount"
    Then I populate field "Date of Purchase" with "TODAY"
    Then I populate field "Proof of Payment" with excel "excel:Proof of Payment"
    Then I wait for "3" seconds
    Then I verify text "This should be evidence of payment made for the service." is present
    Then I click on button "Next"

    Then I verify text "Fuel" is present
    Then I verify text " Claim Details Complete" is present
    Then I verify text "Would you like to add another claim type?" is present
    Then I verify text "You can submit upto" is present
    Then I verify text "more claims" is present
    Then I verify text "Add Another Claim" is present
    Then I click on button "Next"

    Then I verify text "Confirm Bank Details" is present
    Then I verify field "Bank Name" contains excel "excel:Bank Name"
    Then I verify field "Account Name" contains excel "excel:Account Name"
#    Then I populate field "BSB" with excel "excel:BSB"
#    Then I populate field "Account Number" with excel "excel:Account Number"
    Then I click on button "Next"

  #Review
    Then I verify text "Review" is present
    Then I verify text "Odometer Reading" is present
    Then I verify field "Current Reading (kms)" contains excel "excel:New Odometer"
    Then I click on button "Submit"

   Then I verify text "Submit Claim" is present
   Then I verify text "Are you sure you want to submit this claim? You won't be able to make changes once it has been submitted." is present
   Then I click on button "Submit Claim"
   Then I wait for "2" seconds

   Then I verify text "Claim Submitted" is present
   Then I verify text "Your reimbursement claim has been submitted successfully." is present
   Then I verify text "You can track its progress in the Requests tab." is present
   Then I verify text "We will respond to your request within 5 business days." is present
   Then I verify text "Go To Requests" is present
   Then I wait for "3" seconds

    #Validate Request details
    Given I click on element with text "Messages[2]"
    Given I click on element with text "FAQs[2]"
    Given I click on element with text "Profile[2]"
    Given I click on element with text "Requests[2]"
    And I wait for "3" seconds
    When I populate record type user filter "Request Type" with "Reimbursement Claim"
    And I sort record grid by column "Submitted On"
    And I sort record grid by column "Submitted On"
#    Then I get grid "[1]" column "Reference Number" row "[1]" value and store in excel "excel:Request Ref Number"

    Then I click on grid "[1]" column "Reference Number" row "[1]"
    Then I wait for "2" seconds
#    Then I verify field "Vehicle" contains excel "excel:Vehicle 1"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
#    Then I verify field "Claim Amount" contains excel "excel:Amount ($)"
    Then I verify grid "Submitted Documents" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "Submitted Documents" column "Type" row "[1]" contains "Proof of Payment"

  
  Scenario: TC003_Verify Novated lease specialist can view and take decision on submitted claim
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC003" from "01_NovatedApp_End2End"
    Then I click on site page "Requests"
#    Then I populate field "Search Requests" with excel "excel:Reference Number"
#    Then I click on button "Search"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains "New"
    Then I verify field "End Of Lease Date" contains excel "excel:Lease End Date"
    Then I verify field "Submitted By" contains excel "excel:Driver Name"
#    Then I verify field "Submitted On" contains excel "excel:Reading Date"
    Then I verify field "Updated By" contains excel "excel:Driver Name"
#    Then I verify field "Updated On" contains excel "excel:Reading Date"
    Then I verify field "Request Type" contains excel "excel:Request Type"
    Then I verify field "Claim Type" contains excel "excel:Claim Type"
#    Then I verify field "Odometer Reading" contains excel "excel:Last Odometer Reading with km"
    Then I verify field "Dollar Amount" contains excel "excel:Amount ($)"
    Then I verify field "Assigned To" contains "Unassigned"
    Then I wait for "5" seconds
    Then I verify text "Driver Details" is present
    Then I verify field "Salutation" contains excel "excel:Driver Salutation"
    Then I verify field "First Name" contains excel "excel:Legal First Name"
    Then I verify field "Last Name" contains excel "excel:Legal Last Name"
    Then I verify field "Primary Email" contains excel "excel:Driver Email"
    Then I verify field "Mobile" contains excel "excel:Driver Mobile Phone"
    Then I verify field "Employer" contains "Aurecon Australasia Pty Ltd"
    Then I verify field "State" contains "NSW"
    Then I verify text "Vehicle Details" is present
    Then I verify field "Vehicle Description" contains excel "excel:Vehicle name"
    Then I verify field "Registration Number" contains excel "excel:Vehicle number"
    Then I verify field "Registration State" contains "QLD"
    Then I verify text "Files Uploaded" is present
    Then I verify grid "[1]" column "File Name" row "[1]" contains "Invoice.pdf"
    Then I verify grid "[1]" column "Type" row "[1]" contains "Proof of Payment"
    Then I verify text "Event History" is present
    Then I click on button "Take Ownership"
    Then I wait for "1" seconds
    Then I verify text "has been successfully assigned to you" is present
    Then I click on button "DONE"
    Then I wait for "2" seconds
    Then I verify field "Status" contains "In Progress"
    Then I verify field "Assigned To" contains "SUEJP UMBYBQDY"
    Then I verify text "Assigned Request" is present
    Then I verify field "Submitted By" contains excel "excel:Submitted By"
    Then I verify field "Updated By" contains excel "excel:Updated By"

    Then I verify text "Request Event History" is present
    Then I verify text "SUEJP UMBYBQDY" is present
    Then I verify text "Created Request" is present
