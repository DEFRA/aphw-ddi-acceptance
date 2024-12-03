Feature: Pre-Exempt dog navigations 

Scenario:  Creating a new dog and owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Charlie" to the inputfield "#firstName"
        And I set "Austin" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "BD11 1ND" to the inputfield "#postcode"
        And I set "14" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Milo" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "14" to the inputfield "#cdoIssued-day"
        And I set "07" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created" 

    Scenario: Navigate to manage cdo application from search 
        When I click on the link "Home"
        And I click on the link "Search dog index"
        And I set "Milo" to the inputfield "#searchTerms"
        And I press "Enter"
        And I expect that element "html" contains the text "1 record found"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"

    Scenario: Navigate to dog record from manage cdo application
        When I click on the link "Dog record"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "main" contains the text "Dog details"

    Scenario: Navigate to manage cdo application from dog record 
        When I click on the link "Manage CDO application"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"

    Scenario: Navigate to owner record from manage cdo application
        When I click on the link "Owner record"
        Then I expect that element "h1" contains the text "Charlie Austin"

    Scenario: Navigate to manage cdo application from owner record 
        When I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"

    Scenario: Navigate to manage cdo application from cdo tracker
        When I click on the link "Home"
        And I click on the link containing "Manage CDOs and interim"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"