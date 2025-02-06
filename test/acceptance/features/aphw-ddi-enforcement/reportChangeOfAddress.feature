Feature: Report change of address

    Scenario: Navigate to Enforcement Search page
        Given I open the url "/"
        When I click on the element "button=Accept analytics cookies"
        And I click on the element "button=Hide this message"
        And I click on the link "Start now"
        Then I expect that element "h1" contains the text "Search"

    Scenario: Search for the dog
        When I set "Bruno" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: Navigate to dog record page
        When I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"

    Scenario: Report change of address
        When I click on the link "Report something"
        And I select the radio option with the value "changed-address" from the radio group "reportType"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "20" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        Then I expect that element "h1" contains the text "Report received"

    Scenario: Check history
        When I click on the link containing "Dog record for dog"
        And I click on the link "Check and download history"
        Then I expect that element "tbody" contains the text "Police correspondence from defra.gov.uk received"