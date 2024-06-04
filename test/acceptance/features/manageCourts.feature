Feature: Manage Courts List

    Scenario: Navigate to admin area
        Given I open the url "/"
        When I click on the link "Admin"
        Then I expect that element "h1" contains the text "Admin area"

    Scenario: Add a new court    
        When I click on the link "Courts"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Stony Stratford Magistrates' Court" to the inputfield "#court"
        And I click on the element "button=Add court"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "Stony Stratford Magistrates' Court is available in the Index."

    Scenario: Add a new court with the same name which already exists(full match) 
        When I click on the link "Add or remove a court"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Stony Stratford Magistrates' Court" to the inputfield "#court"
        And I click on the element "button=Add court"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "This court name is already in the Index"

    Scenario: Add a new court with the same name which already exists(partial match) 
        When I set "Stony" to the inputfield "#court"
        And I click on the element "button=Add court"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "This court name is already in the Index"

    Scenario: Remove a court
        When I click on the link "Admin"
        And I click on the link "Courts"
        And I select the radio option with the value "remove" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Stony Stratford Magistrates' Court" to the inputfield "#pk"
        And I click on the element "button=Remove court"
        And I click on the element "button=Remove court"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "Stony Stratford Magistrates' Court is removed from the Index."                      