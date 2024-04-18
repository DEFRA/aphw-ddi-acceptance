Feature: Edit exemption details

    Scenario: Search a dog
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Bravo" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 dog record"

    Scenario: Select a dog
        When I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[1]" contains the text "Bravo"

    Scenario: Click edit exemption details
        When I click on the element "(//a[contains(text(),'Edit details')])[2]"
        Then I expect that element "h1" contains the text "Edit exemption details"
        
    Scenario: Future date in first certificate issue date
        When I set "20" to the inputfield "#certificateIssued-day"
        And I set "04" to the inputfield "#certificateIssued-month"
        And I set "2026" to the inputfield "#certificateIssued-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a date that is today or in the past" 

    Scenario: Future date in CDO issue date
        When I set "10" to the inputfield "#certificateIssued-day"
        And I set "04" to the inputfield "#certificateIssued-month"
        And I set "2024" to the inputfield "#certificateIssued-year"
        And I set "22" to the inputfield "#cdoIssued-day"
        And I set "05" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I set "22" to the inputfield "#cdoExpiry-day"
        And I set "07" to the inputfield "#cdoExpiry-month"
        And I set "2024" to the inputfield "#cdoExpiry-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a date that is today or in the past" 

    Scenario: Future date in Application fee paid date
        When I set "12" to the inputfield "#cdoIssued-day"
        And I set "04" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I set "12" to the inputfield "#cdoExpiry-day"
        And I set "06" to the inputfield "#cdoExpiry-month"
        And I set "2024" to the inputfield "#cdoExpiry-year"
        And I set "20" to the inputfield "#applicationFeePaid-day"
        And I set "04" to the inputfield "#applicationFeePaid-month"
        And I set "2024" to the inputfield "#applicationFeePaid-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a date that is today or in the past"

    Scenario: Future date in neutering confirmed date
        When I set "20" to the inputfield "#applicationFeePaid-day"
        And I set "03" to the inputfield "#applicationFeePaid-month"
        And I set "2024" to the inputfield "#applicationFeePaid-year"
        And I set "20" to the inputfield "#neuteringConfirmation-day"
        And I set "05" to the inputfield "#neuteringConfirmation-month"
        And I set "2024" to the inputfield "#neuteringConfirmation-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a date that is today or in the past"

    Scenario: Invalid dates in Microchip number verified date
        When I set "20" to the inputfield "#neuteringConfirmation-day"
        And I set "03" to the inputfield "#neuteringConfirmation-month"
        And I set "2024" to the inputfield "#neuteringConfirmation-year"
        And I set "00" to the inputfield "#microchipVerification-day"
        And I set "03" to the inputfield "#microchipVerification-month"
        And I set "2024" to the inputfield "#microchipVerification-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real date"

    Scenario: Invalid dates in Joined interim exemption scheme
        When I set "09" to the inputfield "#microchipVerification-day"
        And I set "03" to the inputfield "#microchipVerification-month"
        And I set "2024" to the inputfield "#microchipVerification-year"
        And I set "09" to the inputfield "#joinedExemptionScheme-day"
        And I set "13" to the inputfield "#joinedExemptionScheme-month"
        And I set "2024" to the inputfield "#joinedExemptionScheme-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real date"

    Scenario: Invalid dates in Removed from CDO process
        When I set "09" to the inputfield "#joinedExemptionScheme-day"
        And I set "03" to the inputfield "#joinedExemptionScheme-month"
        And I set "2024" to the inputfield "#joinedExemptionScheme-year"
        And I set "09" to the inputfield "#removedFromCdoProcess-day"
        And I set "3" to the inputfield "#removedFromCdoProcess-month"
        And I set "24" to the inputfield "#removedFromCdoProcess-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a 4-digit year"

    Scenario: Missing month in Insurance renewal date
        When I select the option with the value "Dogs Trust" for element "#insuranceCompany"
        And I set "09" to the inputfield "#insuranceRenewal-day"
        And I clear the inputfield "#insuranceRenewal-month"
        And I set "2024" to the inputfield "#insuranceRenewal-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "A date must include a month"

    Scenario: Validations for mandatory fields for pre-exempt/exempt dog
        When I clear the inputfield "#court"
        And I select the 0th option for element "#policeForce"
        And I clear the inputfield "#cdoIssued-day"
        And I clear the inputfield "#cdoIssued-month"
        And I clear the inputfield "#cdoIssued-year"
        And I clear the inputfield "#cdoExpiry-day"
        And I clear the inputfield "#cdoExpiry-month"
        And I clear the inputfield "#cdoExpiry-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Select a police force" 
        And I expect that element "form" contains the text "Enter a CDO issued date" 
        And I expect that element "form" contains the text "Enter a CDO expiry date"
        And I expect that element "form" contains the text "Select a court"
   
    Scenario: Verify court and cdo dates not mandatory for interim-exempt dog
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Dino" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the element "(//a[contains(text(),'Edit details')])[2]"
        And I clear the inputfield "#court"
        And I select the 0th option for element "#policeForce"
        And I clear the inputfield "#cdoIssued-day"
        And I clear the inputfield "#cdoIssued-month"
        And I clear the inputfield "#cdoIssued-year"
        And I clear the inputfield "#cdoExpiry-day"
        And I clear the inputfield "#cdoExpiry-month"
        And I clear the inputfield "#cdoExpiry-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Select a police force" 
        And I expect that element "form" not contains the text "Enter a CDO issued date" 
        And I expect that element "form" not contains the text "Enter a CDO expiry date"
        And I expect that element "form" not contains the text "Select a court"

    Scenario: Validations for Insurance company
        When I set "09" to the inputfield "#insuranceRenewal-day"
        And I set "12" to the inputfield "#insuranceRenewal-month"
        And I set "2026" to the inputfield "#insuranceRenewal-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" not contains the text "Select an insurance company"         