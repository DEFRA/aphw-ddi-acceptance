Feature: Delete dog and owner together

Scenario:  Creating a new dog and owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "David" to the inputfield "#firstName"
        And I set "Murdoch" to the inputfield "#lastName"        
        And I click on the element "button=Continue"
        And I set "GU17 0HB" to the inputfield "#postcode"
        And I set "4" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "785369841256987" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Tommy" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "30" to the inputfield "#cdoIssued-day"
        And I set "05" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Add another dog for this owner"
        And I set "569874123658974" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "Dogo Argentino" from the radio group "breed"
        And I set "Cookie" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "25" to the inputfield "#cdoIssued-day"
        And I set "05" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Leicester (Leicester Law Courts)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created" 
        
    Scenario: Search dog 
        When I click on the link "Home"
        And I click on the link "Search dog index"
        And I set "Tommy" to the inputfield "#searchTerms"
        And I press "Enter"
        And I expect that element "html" contains the text "1 dog record"
        And I click on the link containing "ED30"
        And I click on the link "Dog record"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[1]" contains the text "Tommy"
        And I expect that element "(//dd)[2]" contains the text "XL Bully"

    Scenario: Delete dog(not the last dog of the owner) 
        When I click on the link containing "Delete dog record"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Dog record deleted"

    Scenario: Search deleted dog 
        When I click on the link "Search the Index"
        And I set "Tommy" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "No results found"     

    Scenario: Search dog 
        When I set "Cookie" to the inputfield "#searchTerms"
        And I press "Enter"
        And I expect that element "html" contains the text "1 dog record"
        And I click on the link containing "ED30"
        And I click on the link "Dog record"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[1]" contains the text "Cookie"
        And I expect that element "(//dd)[2]" contains the text "Dogo Argentino"

    Scenario: Delete dog and owner(Last dog of the owner)
        When I click on the link containing "Delete dog record"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        When I select the radio option with the value "Y" from the radio group "confirmOwner"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Records deleted"
  
    Scenario: Search deleted dog 
        When I click on the link "Search the Index"
        And I set "Cookie" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "No results found"

    Scenario: Search deleted owner 
        When I select the radio option with the value "owner" from the radio group "searchType"
        And I set "David Murdoch" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "No results found"






