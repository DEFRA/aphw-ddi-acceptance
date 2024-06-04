Feature: Manage police forces List

    Scenario: Navigate to admin area
        Given I open the url "/"
        When I click on the link "Admin"
        Then I expect that element "h1" contains the text "Admin area"

    Scenario: Add a new police force    
        When I click on the link "Police forces"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Stony Stratford Police" to the inputfield "#police"
        And I click on the element "button=Add police force"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "Stony Stratford Police is available in the Index."

    Scenario: Add a new police force with the same name which already exists(full match) 
        When I click on the link "Add or remove a police force"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Stony Stratford Police" to the inputfield "#police"
        And I click on the element "button=Add police force"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "This police force is already in the Index"

    Scenario: Add a new police force with the same name which already exists(partial match)
        When I set "Stony" to the inputfield "#police"
        And I click on the element "button=Add police force"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "This police force is already in the Index"

    Scenario: Remove a police force
        When I click on the link "Admin"
        And I click on the link "Police forces"
        And I select the radio option with the value "remove" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Stony Stratford Police" to the inputfield "#pk"
        And I click on the element "button=Remove police force"
        And I click on the element "button=Remove police force"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "Stony Stratford Police is removed from the Index."