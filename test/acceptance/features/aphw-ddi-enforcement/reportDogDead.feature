Feature: Report dog dead

    Scenario: Navigate to Enforcement Search page
        Given I open the url "/"
        When I click on the element "button=Accept analytics cookies"
        And I click on the element "button=Hide this message"
        And I click on the link "Start now"
        Then I expect that element "h1" contains the text "Search"

    Scenario: Search for the dog
        When I set "Bravo" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: Navigate to dog record page
        When I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"

    Scenario: Report Dog dead
        When I click on the link "Report something"
        And I select the radio option with the value "dog-died" from the radio group "reportType"
        And I click on the element "button=Continue"
        And I set "05" to the inputfield "#dateOfDeath-day"
        And I set "02" to the inputfield "#dateOfDeath-month"
        And I set "2025" to the inputfield "#dateOfDeath-year"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Report received"

    Scenario: Check history
        When I click on the link containing "Dog record for dog"
        And I click on the link "Check and download history"
        Then I expect that element "tbody" contains the text "Police correspondence from defra.gov.uk received"