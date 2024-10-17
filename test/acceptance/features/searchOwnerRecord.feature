Feature: Perform a basic search

    Scenario: Owner Search(with no results)
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Jack" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "Your search for Jack did not match any records."

    Scenario: Search owner record with owner full name
        When I clear the inputfield "#searchTerms"
        And I set "John Smith" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "1 matching record"
        And I expect that element "(//ul)" contains the text "12 Ings Lane, Leeds, LS20 8DA"
        And I expect that element "(//td)[2]" contains the text "Fido"
        And I expect that element "(//td)[3]" contains the text "Applying for exemption"

    Scenario: Search owner record with owner first name
        When I clear the inputfield "#searchTerms"
        And I set "Mike" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "2 matching records"

    Scenario: Search owner record with owner last name
        When I clear the inputfield "#searchTerms"
        And I set "Clark" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "1 matching record"
        And I expect that element "(//ul)[1]" contains the text "94 Heol Llinos, Caerdydd, CF14 9JF"
        And I expect that element "(//td)[2]" contains the text "Bruno"
        And I expect that element "(//td)[3]" contains the text "Interim exempt"

    Scenario: Search owner record with owner first name + dog name
        When I clear the inputfield "#searchTerms"
        And I set "Mike Bravo" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "1 matching record"
        And I expect that element "(//ul)[1]" contains the text "6 HEATH MEAD, CARDIFF, CF14 3PJ"
        And I expect that element "(//td)[2]" contains the text "Bravo"
        And I expect that element "(//td)[3]" contains the text "Exempt"

    Scenario: Search owner record with dog name
        When I clear the inputfield "#searchTerms"
        And I set "Fido" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "1 matching record"
        And I expect that element "(//ul)[1]" contains the text "12 Ings Lane, Leeds, LS20 8DA"
        And I expect that element "(//td)[2]" contains the text "Fido"
        And I expect that element "(//td)[3]" contains the text "Applying for exemption"

    Scenario: Search owner record with town/city name
        When I clear the inputfield "#searchTerms"
        And I set "Northampton" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "2 matching records"
        And I expect that element "(//ul)[1]" contains the text "42 Scholars Court, Northampton, NN1 1ES"
        And I expect that element "(//td)[2]" contains the text "Bob"
        And I expect that element "(//td)[3]" contains the text "Applying for exemption"
        And I expect that element "(//ul)[2]" contains the text "60 Scholars Court, Northampton, NN1 1ES"
        And I expect that element "(//td)[5]" contains the text "Dino"
        And I expect that element "(//td)[6]" contains the text "Interim exempt"
        And I expect that element "(//td)[8]" contains the text "Maxie"
        And I expect that element "(//td)[9]" contains the text "Interim exempt"

    Scenario: Search owner record with postcode
        When I clear the inputfield "#searchTerms"
        And I set "NN1 1ES" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "2 matching records"
        And I expect that element "(//ul)[1]" contains the text "42 Scholars Court, Northampton, NN1 1ES"
        And I expect that element "(//td)[2]" contains the text "Bob"
        And I expect that element "(//td)[3]" contains the text "Applying for exemption"
        And I expect that element "(//ul)[2]" contains the text "60 Scholars Court, Northampton, NN1 1ES"
        And I expect that element "(//td)[5]" contains the text "Dino"
        And I expect that element "(//td)[6]" contains the text "Interim exempt"
        And I expect that element "(//td)[8]" contains the text "Maxie"
        And I expect that element "(//td)[9]" contains the text "Interim exempt"

    Scenario: Search owner record with email
        When I clear the inputfield "#searchTerms"
        And I set "mike1_turner1@outlook.com" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "1 matching record"
        And I expect that element "(//ul)[1]" contains the text "6 HEATH MEAD, CARDIFF, CF14 3PJ"
        And I expect that element "(//td)[2]" contains the text "Bruce"
        And I expect that element "(//td)[3]" contains the text "Applying for exemption"
        And I expect that element "(//td)[5]" contains the text "Bravo"
        And I expect that element "(//td)[6]" contains the text "Exempt"