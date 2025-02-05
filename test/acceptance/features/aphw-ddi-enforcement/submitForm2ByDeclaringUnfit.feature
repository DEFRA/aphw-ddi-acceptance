Feature: Police user submit Form 2

    Scenario: Navigate to Enforcement Search page
        Given I open the url "/"
        When I click on the element "button=Accept analytics cookies"
        And I click on the element "button=Hide this message"
        And I click on the link "Start now"
        Then I expect that element "h1" contains the text "Search"

    Scenario: Search for the dog
        When I set "Fido" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: View CDO progress page
        When I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dt)[1]" contains the text "Dog name"
        And I expect that element "(//dd)[1]" contains the text "Fido"
        And I expect that element "(//dt)[2]" contains the text "Owner name"
        And I expect that element "(//dd)[2]" contains the text "John Smith"
        And I expect that element "(//dt)[3]" contains the text "Microchip number"
        And I expect that element "(//dd)[3]" contains the text "345677654312333"
        And I expect that element "(//dt)[4]" contains the text "CDO expiry"
        And I expect that element "(//dd)[4]" contains the text "01 April 2024"
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

    Scenario: Submit form2 by declaring unfit
        When I click on the link "Submit Form 2"
        And I click on the element "#dogNotFitForMicrochip"
        And I click on the element "#dogNotNeutered"
        And I click on the element "button=Save and continue"
        Then I expect that element "h1" contains the text "When will the dog be fit to be microchipped?"

    Scenario: Provide the microchip fit date
        When I set "11" to the inputfield "#microchipDeadline-day"
        And I set "06" to the inputfield "#microchipDeadline-month"
        And I set "2025" to the inputfield "#microchipDeadline-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dt)[9]" contains the text "Form 2 confirming dog microchipped and neutered"
        And I expect that element "(//dd)[9]" contains the text "Received"
        