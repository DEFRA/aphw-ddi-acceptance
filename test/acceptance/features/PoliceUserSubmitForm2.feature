Feature: Police user submit Form 2

    Scenario: Navigate to search page
        Given I open the enforcement site "/"
        When I click on the element "button=Accept analytics cookies"
        And I click on the link containing "Start now"
        Then I expect that element "main" contains the text "Search"
    