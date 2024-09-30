Feature: Add an activity for owner

    Scenario: Create new  application for 2 dogs
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Steve" to the inputfield "#firstName"
        And I set "Richards" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "PH1 3DT" to the inputfield "#postcode"
        And I set "202" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I set "345677689611111" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "Japanese Tosa" from the radio group "breed"
        And I set "Eva" to the inputfield "#name"
        And I select the radio option with the value "interim-exemption" from the radio group "applicationType"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Add another dog for this owner"
        And I set "345645654322222" to the inputfield "#microchipNumber"
        And I click on the element "button=Continue"
        And I select the radio option with the value "Pit Bull Terrier" from the radio group "breed"
        And I set "Bunty" to the inputfield "#name"
        And I select the radio option with the value "interim-exemption" from the radio group "applicationType"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created"

    Scenario: Search the dog and check activity
        When I click on the link "Home"
        And I click on the link "Search dog index"
        And I set "Eva" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        And I click on the link "Check activity"
        Then I expect that element "tbody" contains the text "Dog record created (Interim exempt)"

    Scenario: Add an activity to the owner
        When I open the url "/"
        And I click on the link "Search dog index"
        And I set "Steve Richards" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I press "Enter"
        And I click on the link containing "Steve Richards"
        And I click on the link "Add an activity"
        And I select the radio option with the value "7" from the radio group "activity"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "Change of address form sent"
        And I click on the link "Go to the owner record for Steve Richards"
        
    Scenario: Check the activity to the owner
        When I open the url "/"
        And I click on the link "Search dog index"
        And I set "Steve Richards" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I press "Enter"
        And I click on the link containing "Steve Richards"
        And I click on the link "Check owner activity"
        Then I expect that element "tbody" contains the text "Change of address form sent" 