Feature: Delete dog and owner

Scenario:  Creating a new dog and owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Oliver" to the inputfield "#firstName"
        And I set "Davis" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "B1 1DD" to the inputfield "#postcode"
        And I set "28" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "3456711221111" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Bunny" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "01" to the inputfield "#cdoIssued-day"
        And I set "05" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created" 
        
    Scenario: Search dog 
        When I click on the link "Dangerous Dogs Index home"
        And I click on the link "Search dog index"
        And I set "Bunny" to the inputfield "#searchTerms"
        And I press "Enter"
        And I expect that element "html" contains the text "1 dog record"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[1]" contains the text "Bunny"
        And I expect that element "(//dd)[2]" contains the text "XL Bully"

    Scenario: Delete dog
        When I click on the link containing "Delete dog record"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Dog record deleted"

    Scenario: Search deleted dog 
        When I click on the link "Search the Index"
        And I set "Bunny" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "No results found"    

    Scenario: Search owner with no dogs
        When I select the radio option with the value "owner" from the radio group "searchType"
        And I set "Oliver Davis" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 owner record"

    Scenario: Delete owner
        When I click on the link containing "Oliver Davis"
        And I expect that element "h1" contains the text "Oliver Davis"
        And I click on the link containing "Delete owner record"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Owner record deleted"

    Scenario: Search deleted owner 
        When I click on the link "Search the Index"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I set "Oliver Davis" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "No results found"






