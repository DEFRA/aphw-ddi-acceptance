Feature: Police user submit Form 2

    Scenario: Navigate to Enforcement Search page
        Given I open the url "/"
        When I click on the element "button=Accept analytics cookies"
        And I click on the element "button=Hide this message"
        And I click on the link "Start now"
        Then I expect that element "h1" contains the text "Search"

    Scenario: Search for the dog
        When I set "Maxie" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: View CDO progress page
        When I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dt)[1]" contains the text "Dog name"
        And I expect that element "(//dd)[1]" contains the text "Maxie"
        And I expect that element "(//dt)[2]" contains the text "Owner name"
        And I expect that element "(//dd)[2]" contains the text "James Gunn"
        And I expect that element "(//dt)[3]" contains the text "Microchip number"
        And I expect that element "(//dd)[3]" contains the text "345677654366666"
        And I expect that element "(//dt)[4]" contains the text "CDO expiry"
        And I expect that element "(//dd)[4]" contains the text "11 May 2024"
        And I expect that element "(//dt)[5]" contains the text "Application pack"
        And I expect that element "(//dd)[5]" contains the text "Not sent"
        And I expect that element "(//dt)[6]" contains the text "Evidence of insurance"
        And I expect that element "(//dd)[6]" contains the text "Not received"
        And I expect that element "(//dt)[7]" contains the text "Microchip number"
        And I expect that element "(//dd)[7]" contains the text "Received"
        And I expect that element "(//dt)[8]" contains the text "Application fee"
        And I expect that element "(//dd)[8]" contains the text "Not received"
        And I expect that element "(//dt)[9]" contains the text "Form 2 confirming dog microchipped and neutered"
        And I expect that element "(//dd)[9]" contains the text "Submit Form 2"
        And I expect that element "(//dt)[10]" contains the text "Certificate of exemption"
        And I expect that element "(//dd)[10]" contains the text "Not sent"

    Scenario: Submit form2 by providing Microchip verified and neutering verified
        When I click on the link "Submit Form 2"
        And I set "11" to the inputfield "#microchipVerification-day"
        And I set "07" to the inputfield "#microchipVerification-month"
        And I set "2024" to the inputfield "#microchipVerification-year"
        And I set "11" to the inputfield "#neuteringConfirmation-day"
        And I set "07" to the inputfield "#neuteringConfirmation-month"
        And I set "2024" to the inputfield "#neuteringConfirmation-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dt)[9]" contains the text "Form 2 confirming dog microchipped and neutered"
        And I expect that element "(//dd)[9]" contains the text "Received"
        