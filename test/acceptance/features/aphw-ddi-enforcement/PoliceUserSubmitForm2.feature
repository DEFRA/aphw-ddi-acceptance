Feature: Police user submit Form 2

    Scenario: Navigate to start now page
        Given I open the url "/"
        When I click on the element "button=Accept analytics cookies"
        And I click on the element "button=Hide this message"
        And I click on the link "Start now"
        Then I expect that element "h1" contains the text "Search"