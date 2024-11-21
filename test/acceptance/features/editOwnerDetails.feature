Feature: Edit owner details

    Scenario: Search an owner
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Mike Turner" to the inputfield "#searchTerms"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "2 matching records"

    Scenario: Select an owner
        When I click on the link containing "Mike Turner"
        Then I expect that element "h1" contains the text "Mike Turner"
        And I expect that element "(//dd)[1]" contains the text "Mike Turner"

    Scenario: Update Owner details
        When I click on the link containing "Edit details"  
        And I set "03" to the inputfield "#dateOfBirth-day"
        And I set "03" to the inputfield "#dateOfBirth-month"
        And I set "1990" to the inputfield "#dateOfBirth-year"
        And I set "6 HEATH MEAD" to the inputfield "#addressLine1"
        And I set "CANTON" to the inputfield "#addressLine2"
        And I set "CARDIFF" to the inputfield "#town"
        And I set "CF14 3PJ" to the inputfield "#postcode"
        And I set "mike1_turner1@outlook.com" to the inputfield "#email"
        And I set "01604 785856" to the inputfield "#primaryTelephone"
        And I set "07566874546" to the inputfield "#secondaryTelephone"
        And I select the option with the value "Wales" for element "#country"
        And I click on the element "button=Save details"

    Scenario: Verify owner details updated successfully
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Mike Turner" to the inputfield "#searchTerms"
        And I click on the element "button=Search"
        And I click on the link containing "Mike Turner"
        Then I expect that element "h1" contains the text "Mike Turner"
        And I expect that element "(//dd)[1]" contains the text "Mike Turner"
        And I expect that element "(//dd)[2]" contains the text "03 March 1990"
        And I expect that element "(//dd)[3]" contains the text "6 HEATH MEAD"
        And I expect that element "(//dd)[3]" contains the text "CANTON"
        And I expect that element "(//dd)[3]" contains the text "CARDIFF" 
        And I expect that element "(//dd)[3]" contains the text "CF14 3PJ"
        And I expect that element "(//dd)[5]" contains the text "mike1_turner1@outlook.com"
        And I expect that element "(//dd)[6]" contains the text "01604 785856"   
        And I expect that element "(//dd)[7]" contains the text "07566874546" 
        And I expect that element "(//dd)[8]" contains the text "Wales"
       
    Scenario: Check the activity for the owner
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Mike Turner" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "Mike Turner"
        And I click on the link "Check owner activity"
        Then I expect that element "tbody" contains the text "Owner date of birth updated"
        And I expect that element "tbody" contains the text "Address line 1 updated from 50 Scholars Court"
        And I expect that element "tbody" contains the text "Address line 2 updated from null"
        And I expect that element "tbody" contains the text "Town or city updated from Northampton"
        And I expect that element "tbody" contains the text "Postcode updated from NN1 1ES"
        And I expect that element "tbody" contains the text "Country updated"
        And I expect that element "tbody" contains the text "Email address updated"
        And I expect that element "tbody" contains the text "Telephone 1 updated"
        And I expect that element "tbody" contains the text "Telephone 2 updated"