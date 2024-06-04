Feature: Manage Dog Insurers List

    Scenario: Navigate to admin area
        Given I open the url "/"
        When I click on the link "Admin"
        Then I expect that element "h1" contains the text "Admin area"

    Scenario: Add a new dog insurer    
        When I click on the link "Dog insurers"
        And I click on the link "Add a dog insurer"
        And I set "AAA Insurance" to the inputfield "#name"
        And I click on the element "button=Add dog insurer"
        Then I expect that element "table" contains the text "AAA Insurance"

    Scenario: Add a new dog insurer with same which already exists(full match)   
        When I click on the link "Add a dog insurer"
        And I set "AAA Insurance" to the inputfield "#name"
        And I click on the element "button=Add dog insurer"
        Then I expect that element "main" contains the text "This dog insurer name is already in the Index"

    Scenario: Add a new dog insurer with same which already exists(partial match)   
        When I click on the link "Add a dog insurer"
        And I set "AAA" to the inputfield "#name"
        And I click on the element "button=Add dog insurer"
        Then I expect that element "main" contains the text "This dog insurer name is already in the Index"

    Scenario: Remove dog insurer  
        When I click on the element "button=Remove"
        Then I expect that element "table" not contains the text "AAA Insurance"       