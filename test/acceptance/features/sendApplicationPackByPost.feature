Feature: Send application pack by post

Scenario:  Creating a new dog and owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Thomas" to the inputfield "#firstName"
        And I set "Wing" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8BG" to the inputfield "#postcode"
        And I set "99" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Avery" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "21" to the inputfield "#cdoIssued-day"
        And I set "01" to the inputfield "#cdoIssued-month"
        And I set "2025" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created" 

    Scenario: Search dog and navigate to manage cdo application
        When I click on the link "Home"
        And I click on the link "Search dog index"
        And I set "Avery" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Not yet started"

    Scenario: Navigate to send application pack task
        When I click on the link "Send application pack"
        Then I expect that element "h1" contains the text "How do you want to send the application pack?"
        And I expect that element "form" contains the text "Thomas Wing"
        And I expect that element "form" contains the text "99 Silverdale Avenue"
        And I expect that element "form" contains the text "Guiseley"
        And I expect that element "form" contains the text "Leeds"
        And I expect that element "form" contains the text "LS20 8BG"

    Scenario: Send application pack by post
        When I select the radio option with the value "post" from the radio group "contact"
        And I click on the element "button=Send application"
        Then I expect that element "h1" contains the text "Application posting scheduled"
        And I expect that element "body" contains the text "The application pack will be posted to"
        And I expect that element "body" contains the text "Thomas Wing"
        And I expect that element "body" contains the text "99 Silverdale Avenue"
        And I expect that element "body" contains the text "Leeds"
        And I expect that element "body" contains the text "LS20 8BG"

    Scenario: Verify Send application task is completed
        When I click on the link containing "Manage CDO application for Dog"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"

    Scenario: Verify history for dog
        When I click on the link containing "Dog record"
        And I click on the link "Check history"
        Then I expect that element "tbody" contains the text "Application pack sent to 99 Silverdale Avenue, Guiseley, Leeds, LS20 8BG"      