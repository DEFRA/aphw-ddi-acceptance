Feature: Create new record validations

    Scenario: Mandatory information missing on owner details
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Enter a first name"
        And I expect that element "form" contains the text "Enter a last name"

    Scenario: Owner DOB in future
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I set "01" to the inputfield "#dateOfBirth-day"
        And I set "02" to the inputfield "#dateOfBirth-month"
        And I set "2028" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Date of birth must be in the past"  

    Scenario: Owner is less than 16 years old
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I set "01" to the inputfield "#dateOfBirth-day"
        And I set "02" to the inputfield "#dateOfBirth-month"
        And I set "2023" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Owner must be 16 or over"

    Scenario: Mandatory information missing on postcode lookup
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Enter a postcode"                   

    Scenario: Mandatory information missing on manually enter address details
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I click on the link "Enter address manually"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Enter first line of address"
        And I expect that element "form" contains the text "Enter town or city"
        And I expect that element "form" contains the text "Enter a postcode"
        And I expect that element "form" contains the text "Select a country"

    Scenario: Mandatory information missing on What is the microchip number
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Enter a microchip number"

    Scenario: Mandatory information missing on add dog details
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I click on the element "button=Add dog details"
        Then I expect that element "form" contains the text "Select breed type"
        And I expect that element "form" contains the text "Select application type"

    Scenario: CDO Issue date validations
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Fido" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I click on the element "button=Add dog details"
        Then I expect that element "form" contains the text "Enter an issue date"

    Scenario: CDO Issue date in future
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Fido" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "01" to the inputfield "#cdoIssued-day"
        And I set "02" to the inputfield "#cdoIssued-month"
        And I set "2028" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        Then I expect that element "form" contains the text "Date must be today or in the past"

    Scenario: Invalid CDO Issue date
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Fido" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "31" to the inputfield "#cdoIssued-day"
        And I set "04" to the inputfield "#cdoIssued-month"
        And I set "2023" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        Then I expect that element "form" contains the text "Date must be a real date"     

    
    Scenario: Interim exemption scheme date in future
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Fido" to the inputfield "#name"
        And I select the radio option with the value "interim-exemption" from the radio group "applicationType"
        And I set "01" to the inputfield "#interimExemption-day"
        And I set "02" to the inputfield "#interimExemption-month"
        And I set "2028" to the inputfield "#interimExemption-year"
        And I click on the element "button=Add dog details"
        Then I expect that element "form" contains the text "Date must be today or in the past"

    Scenario: Invalid Interim exemption scheme date
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Fido" to the inputfield "#name"
        And I select the radio option with the value "interim-exemption" from the radio group "applicationType"
        And I set "31" to the inputfield "#interimExemption-day"
        And I set "04" to the inputfield "#interimExemption-month"
        And I set "2023" to the inputfield "#interimExemption-year"
        And I click on the element "button=Add dog details"
        Then I expect that element "form" contains the text "Date must be a real date"     

    Scenario: Mandatory microchip number
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "12" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Enter a microchip number"  

    Scenario: Invalid microchip number with spaces   
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "NN1 1ES" to the inputfield "#postcode"
        And I set "50" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "345677 543 1122" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Microchip number must be digits only" 

    Scenario: Invalid microchip number with alphabets and special characters
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "NN1 1ES" to the inputfield "#postcode"
        And I set "50" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "hgdtfrj&*()£$!£" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Microchip number must be digits only"

    Scenario: Invalid microchip number with more than 15 characters
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "NN1 1ES" to the inputfield "#postcode"
        And I set "50" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "1569874569325489" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Microchip number must be 15 digits in length"

    Scenario:  Reuse the same microchip number which already exists in the database
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Tom" to the inputfield "#firstName"
        And I set "Hogan" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "NN1 1ES" to the inputfield "#postcode"
        And I set "42" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "345671111111111" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Bob" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "01" to the inputfield "#cdoIssued-day"
        And I set "02" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        And I click on the link "Home"
        And I click on the link containing "Process new CDO or"
        And I set "Daniel" to the inputfield "#firstName"
        And I set "Hogan" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "NN1 1ES" to the inputfield "#postcode"
        And I set "53" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "345671111111111" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Microchip number 345671111111111 is in use on a current dog record with a different owner"

     Scenario:  Reuse the same microchip number which already exists for this owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Nate" to the inputfield "#firstName"
        And I set "Jones" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I select the radio option with the value "0" from the radio group "address"
        And I click on the element "button=Continue"
        And I select the radio option with the value "-1" from the radio group "dog"
        And I click on the element "button=Continue"
        And I set "345671185225813" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Dog already registered to this owner"    