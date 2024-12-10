Feature: Manage CDO tasks Validations

Scenario:  Creating a new dog and owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Sarah" to the inputfield "#firstName"
        And I set "Baker" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "GU17 0HB " to the inputfield "#postcode"
        And I set "11" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "Pit Bull Terrier" from the radio group "breed"
        And I set "Cherry" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "15" to the inputfield "#cdoIssued-day"
        And I set "07" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created" 

    Scenario: Search dog and navigate to manage cdo application
        When I click on the link "Home"
        And I click on the link "Search dog index"
        And I set "Cherry" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Not yet started"
        And I expect that element "(//li)[4]" contains the text "Process application"
        And I expect that element "(//li)[4]" contains the text "Cannot start yet"
        And I expect that element "(//li)[5]" contains the text "Record insurance details"
        And I expect that element "(//li)[5]" contains the text "Cannot start yet"
        And I expect that element "(//li)[6]" contains the text "Record microchip number"
        And I expect that element "(//li)[6]" contains the text "Cannot start yet"
        And I expect that element "(//li)[7]" contains the text "Record application fee payment"
        And I expect that element "(//li)[7]" contains the text "Cannot start yet"
        And I expect that element "(//li)[8]" contains the text "Send Form 2"
        And I expect that element "(//li)[8]" contains the text "Cannot start yet"
        And I expect that element "(//li)[9]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[9]" contains the text "Cannot start yet"

    Scenario: Send application pack task validations
        When I click on the link "Send application pack"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Confirm you've sent the application pack"
    
    Scenario: Record insurance details task validations
        When I click on the element "#taskDone"
        And I click on the element "button=Save and continue"
        And I click on the link "Record insurance details"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Select an insurance company"
        And I expect that element "form" contains the text "Enter a renewal date"

     Scenario: Record insurance details task validations with past date
        When I select the option with the value "Dogs Trust" for element "#insuranceCompany" 
        And I set "12" to the inputfield "#insuranceRenewal-day"
        And I set "07" to the inputfield "#insuranceRenewal-month"
        And I set "2024" to the inputfield "#insuranceRenewal-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Date must be today or in the future"

    Scenario: Record microchip number task validations
        When I set "10" to the inputfield "#insuranceRenewal-day"
        And I set "04" to the inputfield "#insuranceRenewal-month"
        And I set "2026" to the inputfield "#insuranceRenewal-year"
        And I click on the element "button=Save and continue"
        And I click on the link "Record microchip number"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Enter a microchip number"

    Scenario: Enter duplicate microchip number
        When I set "123658965278569" to the inputfield "#microchipNumber"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Microchip number already exists"

    Scenario: Microchip number must be 15 numbers long
        When I set "12365878569" to the inputfield "#microchipNumber"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Microchip number must be 15 digits in length"

    Scenario: Invalid microchip number with alphabets
        When I set "123658mkjl78569" to the inputfield "#microchipNumber"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Microchip number must be digits only"

    Scenario: Record application fee payment task validations
        When I set "123658955278569" to the inputfield "#microchipNumber"
        And I click on the element "button=Save and continue"
        And I click on the link "Record application fee payment"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Enter an application fee payment date"

    Scenario: Record application fee payment task validations with future date
        When I set "10" to the inputfield "#applicationFeePaid-day"
        And I set "07" to the inputfield "#applicationFeePaid-month"
        And I set "2026" to the inputfield "#applicationFeePaid-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Date must be today or in the past"

    Scenario: Send Form 2 validations
        When I set "10" to the inputfield "#applicationFeePaid-day"
        And I set "07" to the inputfield "#applicationFeePaid-month"
        And I set "2024" to the inputfield "#applicationFeePaid-year"
        And I click on the element "button=Save and continue"
        And I click on the link "Send Form 2"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Confirm you've sent the Form 2"

    Scenario: Record the verification date for microchip and neutering validations
        When I click on the element "#taskDone"
        And I click on the element "button=Save and continue"
        And I click on the link "Record the verification date for microchip and neutering"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Enter the date the dog’s microchip number was verified"
        And I expect that element "form" contains the text "Enter the date the dog’s neutering was verified"

    Scenario: Record the verification date for microchip and neutering validations with invalid dates
        When I set "11" to the inputfield "#microchipVerification-day"
        And I set "07" to the inputfield "#microchipVerification-month"
        And I set "2026" to the inputfield "#microchipVerification-year"
        And I set "31" to the inputfield "#neuteringConfirmation-day"
        And I set "06" to the inputfield "#neuteringConfirmation-month"
        And I set "2024" to the inputfield "#neuteringConfirmation-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Date must be today or in the past"
        And I expect that element "form" contains the text "Date must be a real date"