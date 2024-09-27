Feature: Create new CDO for Scotland address

    Scenario: Create new application for Scotland address
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Ellie" to the inputfield "#firstName"
        And I set "Finnley" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "PH1 1DH" to the inputfield "#postcode"
        And I set "2" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "345676689622111" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "Japanese Tosa" from the radio group "breed"
        And I set "Jockey" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "26" to the inputfield "#cdoIssued-day"
        And I set "09" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "High Wycombe Law Courts" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "(//dd)[1]" contains the text "Japanese Tosa"
        And I expect that element "(//dd)[2]" contains the text "Jockey"
        And I expect that element "(//dd)[3]" contains the text "345676689622111"
        And I expect that element "(//dd)[4]" contains the text "26 September 2024"
        And I expect that element "(//dd)[5]" contains the text "26 November 2024"
        And I expect that element "(//dd)[6]" contains the text "Ellie Finnley"
        And I expect that element "(//dd)[7]" contains the text "PH1 1DH"
        And I expect that element "(//dd)[8]" contains the text "Scotland"
        And I expect that element "(//dd)[9]" contains the text "Police Scotland" 
        And I expect that element "(//dd)[10]" contains the text "High Wycombe Law Courts"  