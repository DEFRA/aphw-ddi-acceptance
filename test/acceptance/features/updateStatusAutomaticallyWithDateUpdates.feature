Feature: Update status manually

      Scenario: Add Removed from CDO process(update status from pre-exempt to failed) 
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Bob" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the element "(//a[contains(text(),'Edit details')])[2]"
        And I set "11" to the inputfield "#removedFromCdoProcess-day"
        And I set "03" to the inputfield "#removedFromCdoProcess-month"
        And I set "2024" to the inputfield "#removedFromCdoProcess-year"
        And I click on the element "button=Save details" 
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[8]" contains the text "Failed"

      Scenario: Add CDO issued, CDO expiry and court to dog in interim exempt status(update status from interim exempt to pre-exempt) 
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Maxie" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the element "(//a[contains(text(),'Edit details')])[2]"
        And I set "11" to the inputfield "#cdoIssued-day"
        And I set "03" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I set "11" to the inputfield "#cdoExpiry-day"
        And I set "05" to the inputfield "#cdoExpiry-month"
        And I set "2024" to the inputfield "#cdoExpiry-year"
        And I clear the inputfield "#court"
        And I set "Barnsley Law Courts" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Save details" 
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[9]" contains the text "Pre-exempt"

     Scenario: Add First certificate issued and Insurance renewal date to dog in pre-exempt status(update pre-exempt to Exempt) 
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Bruce" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the element "(//a[contains(text(),'Edit details')])[2]"
        And I set "15" to the inputfield "#certificateIssued-day"
        And I set "03" to the inputfield "#certificateIssued-month"
        And I set "2024" to the inputfield "#certificateIssued-year"
        And I set "11" to the inputfield "#insuranceRenewal-day"
        And I set "03" to the inputfield "#insuranceRenewal-month"
        And I set "2026" to the inputfield "#insuranceRenewal-year"
        And I select the option with the value "Dogs Trust" for element "#insuranceCompany"
        And I click on the element "button=Save details" 
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[12]" contains the text "Exempt"
