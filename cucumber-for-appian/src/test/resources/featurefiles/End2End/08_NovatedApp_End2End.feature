@End2End
Feature: 08 NovatedApp End2End feature

  Background: Setup background and environment
    Given I setup browser
    Then I setup appian URL to "appian.active.url"
    And I setup appian version
    And I setup appian locale
    And I set screenshot path to "screenshot.path"
    And I set take error screenshots to "screenshot.boolean"
    And I set stop on error to "screenshot.stop.on.error"

  Scenario: TC001_Collecting Driver details to validate in future task
    Given I setup environment and login with role "Driverstephen"
    Given I load test data for "TC001" from "08_NovatedApp_End2End"
    Then I get first card values and store in excel "excel:Vehicle number" and "excel:Vehicle name"
    #Then I get lease end date and store in excel "excel:Lease End Date"
    Then I get field "EOL Date" value and store in excel "excel:EOL Date"
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

  Scenario: TC002_Validate that a Driver can submit an End of Lease decision to Terminate Lease and choose to Payout Residual Value
    Given I setup environment and login with role "Driverstephen"
    Given I load test data for "TC001" from "08_NovatedApp_End2End"
    Then I wait for "1" seconds
    Then I click on button "End of Lease Decision"
    Then I verify text "End of Lease Details" is present
    Then I wait for "2" seconds
    Then I verify field "Last Odometer Reading" contains excel "excel:EOL Last Odometer Reading"
    Then I get field "Last Odometer Read Date" value and store in excel "excel:Last Reading Date"
    Then I get field "Days Remaining until EOL" value and store in excel "excel:Days Remaining until EOL"
    Then I click on button "Next"
    Then I verify text "EOL Choices" is present
    Then I click on element with text "Finalise your lease with ORIX by choosing from one of our termination options."
    Then I click on button "Next"
    Then I verify text "Review" is present
    Then I verify field "End of Lease Choice" contains "Terminate Lease"
    Then I verify field "EOL Date" contains excel "excel:EOL Date"
    Then I verify field "Days Remaining until EOL" contains excel "excel:Days Remaining until EOL"
    Then I verify field "Last Odometer Read Date" contains excel "excel:Last Reading Date"
    Then I verify field "Last Odometer Reading" contains excel "excel:EOL Last Odometer Reading"
    Then I click on button "Proceed"
    Then I click on element with text "Payout Residual Value"
    Then I click on button "Next"
    Then I click on element with text "Cash"
    Then I click on button "Next"
    Then I verify text "Payout by Cash" is present
    Then I verify text "ORIX Bank Details" is present
    Then I verify text "Westpac Banking Corporation" is present
    Then I verify text "Payment Due Date" is present
    Then I click on button "Next"
    Then I verify field "Terminating Lease Method chosen" contains "Payout Residual Value"
    Then I verify field "Payout Method chosen" contains "Cash"
    Then I click on button "Confirm Termination"
    Then I wait for "2" seconds

  Scenario: TC003_Verify Novated Lease  Specialist is able to complete end-of-lease termination tasks and manage wash-up activities
    Given I setup environment and login with role "AutoLease"
    Given I load test data for "TC002" from "08_NovatedApp_End2End"
    Then I click on site page "Requests"
    Then I wait for "3" seconds
    Then I click on grid "[1]" column "[1]" row "[1]"
    Then I wait for "2" seconds
    #Need to verify req no in real time
    Then I verify text "Request Details" is present
    Then I verify field "Status" contains "New"
    Then I verify field "End Of Lease Date" contains excel "excel:EOL Date"
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
    #Then I verify field "Registration State" contains "VIC"
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
    Then I click on checkbox option "Post Washup Document"
    Then I click on checkbox option "Finalise Reimbursements  "
    Then I click on checkbox option "EV Declaration"
    Then I click on checkbox option "Process Outstanding Service Invoices"
    Then I click on button "Submit"

  Scenario: TC004_Validate that a Driver can submit an End of Lease decision to Terminate Lease and choose to Payout Residual Value
    Given I setup environment and login with role "Driverstephen"
    Given I load test data for "TC001" from "08_NovatedApp_End2End"
    Then I verify text "Intend to Terminate on" is present
    #Then I verify field "End of Lease Decisions" contains excel "excel:Last Reading Date"
    