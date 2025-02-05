Feature: View owner details and check history

        Scenario: Navigate to Enforcement Search page
                Given I open the url "/"
                When I click on the element "button=Accept analytics cookies"
                And I click on the element "button=Hide this message"
                And I click on the link "Start now"
                Then I expect that element "h1" contains the text "Search"

        Scenario: Search Scenario: Check the history for the dog in national records
                When I select the radio option with the value "true" from the radio group "national"
                And I set "mike turner bravo" to the inputfield "#searchTerms"
                And I press "Enter"
                Then I expect that element "html" contains the text "1 record found."
        
        Scenario: View owner record
                When I click on the link containing "Mike Turner"
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
                And I expect that element "(//dd)[9]" contains the text "Exempt"
                And I expect that element "(//dd)[10]" contains the text "Bravo"
                And I expect that element "(//dd)[11]" contains the text "Pit Bull Terrier" 
                And I expect that element "(//dd)[12]" contains the text "852638526311111" 
                And I expect that element "(//dd)[12]" contains the text "852638526322222"
                And I expect that element "(//dd)[13]" contains the text "Dog dead"
                And I expect that element "(//dd)[14]" contains the text "Bruce"
                And I expect that element "(//dd)[15]" contains the text "Japanese Tosa" 
                And I expect that element "(//dd)[16]" contains the text "345677654333334"

        Scenario: Check the history for the owner
                When I click on the link "Check owner history"
                Then I expect that element "tbody" contains the text "Owner date of birth updated"
                And I expect that element "tbody" contains the text "Address line 1 updated from 50 Scholars Court"
                And I expect that element "tbody" contains the text "Address line 2 updated from null"
                And I expect that element "tbody" contains the text "Town or city updated from Northampton"
                And I expect that element "tbody" contains the text "Postcode updated from NN1 1ES"
                And I expect that element "tbody" contains the text "Country updated"
                And I expect that element "tbody" contains the text "Email address updated"
                And I expect that element "tbody" contains the text "Telephone 1 updated"
                And I expect that element "tbody" contains the text "Telephone 2 updated"