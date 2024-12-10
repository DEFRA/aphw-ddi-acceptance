Feature: Add/Remove InBreach Reasons

    Scenario: Create a dog record and click Change status
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Mark" to the inputfield "#firstName"
        And I set "Kane" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LE1 1ST" to the inputfield "#postcode"
        And I set "204" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "556321589630001" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "Fila Brasileiro" from the radio group "breed"
        And I set "Stella" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "08" to the inputfield "#cdoIssued-day"
        And I set "08" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        And I click on the link containing "ED30"
        And I click on the link containing "Dog record"
        And I click on the link containing "Change status"
        Then I expect that element "h1" contains the text "Change the status for Dog ED30"

    Scenario: Change status to Inbreach
        When I select the radio option with the value "In breach" from the radio group "newStatus"
        And I click on the element "button=Change status"
        Then I expect that element "h1" contains the text "What is the reason for the breach"

    Scenario: Add Inbreach Reasons
        When I click on the element "#dogBreaches-2"
        And I click on the element "#dogBreaches-6"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "In breach"

    Scenario: Check status is updated successfully to Inbreach with reasons
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Stella" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[14]" contains the text "In breach"
        And I expect that element "(//dd)[14]" contains the text "dog not kept on lead or muzzled in public place" 
        And I expect that element "(//dd)[14]" contains the text "insurance evidence not provided to police within 5 days of request"
        
    Scenario: Check the history for dog
        When I click on the link "Check history"
        Then I expect that element "tbody" contains the text "Dog status set to In breach:"
        And I expect that element "tbody" contains the text "dog not kept on lead or muzzled in public place" 
        And I expect that element "tbody" contains the text "insurance evidence not provided to police within 5 days of request"

    Scenario: Change status to Pre-exempt
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Stella" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the link containing "Change status"
        And I select the radio option with the value "Pre-exempt" from the radio group "newStatus"
        And I click on the element "button=Change status"
        Then I expect that element "main" contains the text "Applying for exemption"

    Scenario: Check status is updated successfully to Pre-exempt
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Stella" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the link containing "Dog record"
        Then I expect that element "(//dd)[14]" contains the text "Applying for exemption"
        And I expect that element "(//dd)[14]" not contains the text "dog not kept on lead or muzzled in public place" 
        And I expect that element "(//dd)[14]" not contains the text "insurance evidence not provided to police within 5 days of request"

     Scenario: Check the history for dog
        When I click on the link "Check history"
        Then I expect that element "tbody" contains the text "Dog status set to Applying for exemption"