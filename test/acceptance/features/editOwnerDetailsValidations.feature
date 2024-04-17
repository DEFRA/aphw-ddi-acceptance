Feature: Edit owner details

    Scenario: Search an owner
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "John Smith" to the inputfield "#searchTerms"
        And I select the radio option with the value "owner" from the radio group "searchType"
        And I click on the element "button=Search"
        Then I expect that element "html" contains the text "1 owner record"

    Scenario: Select an owner
        When I click on the link containing "John Smith"
        Then I expect that element "h1" contains the text "John Smith"
        And I expect that element "(//dd)[1]" contains the text "John Smith"

    Scenario: Missing mandatory fields
        When I click on the link containing "Edit details"
        When I clear the inputfield "#firstName"
        And I clear the inputfield "#lastName"
        And I clear the inputfield "#addressLine1"
        And I clear the inputfield "#addressLine2"
        And I clear the inputfield "#town"
        And I clear the inputfield "#postcode"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a first name" 
        And I expect that element "form" contains the text "Enter a last name"
        And I expect that element "form" contains the text "Enter the first line of the address"
        And I expect that element "form" contains the text "Enter the town or city"
        And I expect that element "form" contains the text "Enter a postcode"

    Scenario: Invalid owner date of Birth format(day missing)
        When I set "John" to the inputfield "#firstName"
        And I set "Smith" to the inputfield "#lastName"
        And I set "12 INGS LANE" to the inputfield "#addressLine1"
        And I set "GUISELEY" to the inputfield "#addressLine2"
        And I set "LEEDS" to the inputfield "#town"
        And I set "LS20 8DA" to the inputfield "#postcode"
        And I set "04" to the inputfield "#dateOfBirth-month"
        And I set "1995" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "An owner date of birth must include a day"

    Scenario: Invalid owner date of Birth
        When I set "10" to the inputfield "#dateOfBirth-day"
        And I set "13" to the inputfield "#dateOfBirth-month"
        And I set "1995" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real date"

    Scenario: Invalid owner date of Birth format(Alphabets)
        When I set "aa" to the inputfield "#dateOfBirth-day"
        And I set "bb" to the inputfield "#dateOfBirth-month"
        And I set "fgbv" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real date"

    Scenario: Dog Owner must be 16years old
        When I set "15" to the inputfield "#dateOfBirth-day"
        And I set "10" to the inputfield "#dateOfBirth-month"
        And I set "2010" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "The dog owner must be aged 16 or over"

    Scenario: Invalid postcode
        When I set "15" to the inputfield "#dateOfBirth-day"
        And I set "10" to the inputfield "#dateOfBirth-month"
        And I set "2006" to the inputfield "#dateOfBirth-year"
        And I set "RTGVDFH" to the inputfield "#postcode"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real postcode"

     Scenario: Invalid postcode(Enter partial postcode)
        When I set "NN5" to the inputfield "#postcode"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real postcode"


    Scenario: Invalid email address format(no domain)
        When I set "NN5 4GT" to the inputfield "#postcode"
        And I set "Johnsmith2006" to the inputfield "#email"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Enter a real email address"

    Scenario: Invalid email address format 
       When I set "Johnsmith2006@gmail" to the inputfield "#email"
       And I click on the element "button=Save details"
       Then I expect that element "form" contains the text "Enter a real email address"

    Scenario: Invalid Telephone number
       When I set "Johnsmith2006@gmail.com" to the inputfield "#email"
       And I set "01604 78856" to the inputfield "#primaryTelephone"
       And I set "075668746" to the inputfield "#secondaryTelephone"
       And I click on the element "button=Save details"
       Then I expect that element "form" contains the text "Enter a real telephone number"

    Scenario: Alphabets in the Telephone number 
       When I set "01604 bhg856" to the inputfield "#primaryTelephone"
       And I set "075668hju746" to the inputfield "#secondaryTelephone"
       And I click on the element "button=Save details"
       Then I expect that element "form" contains the text "Enter a real telephone number"

    Scenario: Special characters in the Telephone number
       When I set "01604+456856" to the inputfield "#primaryTelephone"
       And I set "075668£$%746" to the inputfield "#secondaryTelephone"
       And I click on the element "button=Save details"
       Then I expect that element "form" contains the text "Enter a real telephone number"        