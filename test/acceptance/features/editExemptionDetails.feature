Feature: Edit exemption details

    Scenario: Search a dog
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Bravo" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 record found"

    Scenario: Select a dog
        When I click on the link containing "ED30"
        And I click on the link "Dog record"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[1]" contains the text "Bravo"

    Scenario: Click edit exemption details
        When I click on the element "(//a[contains(text(),'Edit details')])[2]"
        Then I expect that element "h1" contains the text "Edit exemption details"

    Scenario: Exemption details updated successfully
        When I set "10" to the inputfield "#certificateIssued-day"
        And I set "02" to the inputfield "#certificateIssued-month"
        And I set "2024" to the inputfield "#certificateIssued-year"
        And I select the option with the value "Warwickshire Police" for element "#policeForce"
        And I set "Declan" to the inputfield "#legislationOfficer"
        And I set "10" to the inputfield "#applicationFeePaid-day"
        And I set "03" to the inputfield "#applicationFeePaid-month"
        And I set "2024" to the inputfield "#applicationFeePaid-year"
        And I select the option with the value "Dogs Trust" for element "#insuranceCompany"
        And I set "10" to the inputfield "#insuranceRenewal-day"
        And I set "03" to the inputfield "#insuranceRenewal-month"
        And I set "2026" to the inputfield "#insuranceRenewal-year"
        And I set "10" to the inputfield "#neuteringConfirmation-day"
        And I set "03" to the inputfield "#neuteringConfirmation-month"
        And I set "2023" to the inputfield "#neuteringConfirmation-year"
        And I set "11" to the inputfield "#microchipVerification-day"
        And I set "03" to the inputfield "#microchipVerification-month"
        And I set "2023" to the inputfield "#microchipVerification-year"
        And I set "11" to the inputfield "#joinedExemptionScheme-day"
        And I set "03" to the inputfield "#joinedExemptionScheme-month"
        And I set "2023" to the inputfield "#joinedExemptionScheme-year"
        And I click on the element "button=Save details" 
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[16]" contains the text "Exempt"
        And I expect that element "(//dd)[18]" contains the text "10 February 2024"
        And I expect that element "(//dd)[20]" contains the text "2015"
        And I expect that element "(//dd)[21]" contains the text "01 February 2024"
        And I expect that element "(//dd)[22]" contains the text "01 April 2024"
        And I expect that element "(//dd)[23]" contains the text "Northampton (Northampton Crown Court)"
        And I expect that element "(//dd)[24]" contains the text "Warwickshire Police"
        And I expect that element "(//dd)[25]" contains the text "Declan"
        And I expect that element "(//dd)[26]" contains the text "10 March 2024"
        And I expect that element "(//dd)[27]" contains the text "Dogs Trust"
        And I expect that element "(//dd)[28]" contains the text "10 March 2026"
        And I expect that element "(//dd)[29]" contains the text "10 March 2023"
        And I expect that element "(//dd)[30]" contains the text "11 March 2023"
        And I expect that element "(//dd)[31]" contains the text "11 March 2023"

    Scenario: Check the activity for the dog
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Bravo" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the link "Check activity"
        Then I expect that element "tbody" contains the text "First certificate date updated"
        And I expect that element "tbody" contains the text "Police force updated"
        And I expect that element "tbody" contains the text "Dog legislation officer updated"
        And I expect that element "tbody" contains the text "Application fee paid date updated"
        And I expect that element "tbody" contains the text "Insurance company updated"
        And I expect that element "tbody" contains the text "Last known insurance renewal date updated"
        And I expect that element "tbody" contains the text "Neutering confirmed updated"
        And I expect that element "tbody" contains the text "Microchip number verified updated"
        And I expect that element "tbody" contains the text "Joined interim exemption scheme updated"
        And I expect that element "tbody" contains the text "Dog status set to Exempt"