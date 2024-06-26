Feature: Select no option to change owner

        Scenario:  Creating a new dog and owner
                Given I open the url "/"
                When I click on the link containing "Process new CDO or"
                And I set "Nate" to the inputfield "#firstName"
                And I set "Jones" to the inputfield "#lastName"
                And I set "01" to the inputfield "#dateOfBirth-day"
                And I set "12" to the inputfield "#dateOfBirth-month"
                And I set "1988" to the inputfield "#dateOfBirth-year"
                And I click on the element "button=Continue"
                And I set "PO13 8DW" to the inputfield "#postcode"
                And I set "13" to the inputfield "#houseNumber"
                And I click on the element "button=Continue"
                And I click on the element "button=Confirm address"
                And I set "345671185225813" to the inputfield "#microchipNumber"
                And I click on the element "button=Continue"
                And I select the radio option with the value "XL Bully" from the radio group "breed"
                And I set "Lucas" to the inputfield "#name"
                And I select the radio option with the value "cdo" from the radio group "applicationType"
                And I set "29" to the inputfield "#cdoIssued-day"
                And I set "05" to the inputfield "#cdoIssued-month"
                And I set "2024" to the inputfield "#cdoIssued-year"
                And I click on the element "button=Add dog details"
                And I click on the element "button=Confirm details"
                And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
                And I click on the element "#legislationOfficer"
                And I click on the element "button=Continue"
                And I click on the element "button=Confirm details"
                Then I expect that element "h1" contains the text "Record created"
        
        Scenario: Process cdo  for a dog
                Given I open the url "/"
                When I click on the link containing "Process new CDO or"
                And I set "Danny" to the inputfield "#firstName"
                And I set "Louis" to the inputfield "#lastName"
                And I set "01" to the inputfield "#dateOfBirth-day"
                And I set "12" to the inputfield "#dateOfBirth-month"
                And I set "1998" to the inputfield "#dateOfBirth-year"
                And I click on the element "button=Continue"
                And I set "BN23 5RP" to the inputfield "#postcode"
                And I set "34" to the inputfield "#houseNumber"
                And I click on the element "button=Continue"
                And I click on the element "button=Confirm address"
                And I set "345671185225813" to the inputfield "#microchipNumber"
                And I click on the element "button=Continue"
                Then I expect that element "h1" contains the text "Microchip number 345671185225813"
                And  I expect that element "form" contains the text "Do you want to make Danny Louis the dog owner"

        Scenario: Select no option for change owner
                When I select the radio option with the value "N" from the radio group "confirm"
                And I click on the element "button=Continue"
                Then I expect that element "h1" contains the text "You cannot proceed with this application"

        Scenario: Select change the microchip number link
                When I click on the link containing "Change the microchip number"
                And I expect that element "h1" contains the text "What is the microchip number?"               