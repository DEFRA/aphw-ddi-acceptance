Feature: Fuzzy/Partial searching

    Scenario: Dog Search without including close matches(same sound)
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Smyth" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "Your search for Smyth did not match any records."
        And I expect that element "main" contains the text "include close matches in the search"
        And I expect that element "main" contains the text "ensure all words are spelled correctly"
        And I expect that element "main" contains the text "try different keywords to search"

    Scenario: Dog Search including close matches(same sound)
        When I click on the element "#fuzzy"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: Dog Search without including close matches(Nortampton - spelling mistake)
        When I clear the inputfield "#searchTerms"
        And I click on the element "#fuzzy"
        And I set "Nortampton" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "Your search for Nortampton did not match any records."

    Scenario: Dog Search including close matches(Nortampton - spelling mistake)
        When I click on the element "#fuzzy"
        And I press "Enter"
        Then I expect that element "html" contains the text "5 records found"

    Scenario: Search dog record with microchip number(last 2 digits swapped) without including close matches
        When I clear the inputfield "#searchTerms"
        And I click on the element "#fuzzy"
        And I set "345677654355541" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "Your search for 345677654355541 did not match any records."

    Scenario: Search dog record with microchip number(last 2 digits swapped) including close matches
        When I click on the element "#fuzzy"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: Search dog record with postcode(last 2 characters swapped) without including close matches
        When I clear the inputfield "#searchTerms"
        And I click on the element "#fuzzy"
        And I set "NN1 1SE" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "Your search for NN1 1SE did not match any records."

    Scenario: Search dog record with postcode(last 2 characters swapped) including close matches
        When I click on the element "#fuzzy"
        And I press "Enter"
        Then I expect that element "html" contains the text "5 records found"

    Scenario: Search dog record without including close matches
        When I clear the inputfield "#searchTerms"
        And I click on the element "#fuzzy"
        And I set "Tom" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "2 records found"

    Scenario: Search dog record including close matches
        When I click on the element "#fuzzy"
        And I press "Enter"
        Then I expect that element "html" contains the text "4 records found"