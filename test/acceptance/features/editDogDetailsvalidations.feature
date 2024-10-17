Feature: Edit dog details

    Scenario: Search a dog
        Given I open the url "/"
        When I click on the link "Search dog index"
        And I set "Bravo" to the inputfield "#searchTerms"
        And I press "Enter"
        Then I expect that element "html" contains the text "1 matching record"

    Scenario: Select a dog
        When I click on the link containing "ED30"
        And I click on the link "Dog record"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "(//dd)[1]" contains the text "Bravo"

    Scenario: Click edit dog details
        When I click on the element "(//a[contains(text(),'Edit details')])[1]"
        Then I expect that element "h1" contains the text "Edit dog details"

    Scenario: Invalid microchip number
        When I set "852685231167889111" to the inputfield "#microchipNumber"
        And I set "8526ertf6322$22" to the inputfield "#microchipNumber2"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Microchip number must be 15 digits in length"
        Then I expect that element "form" contains the text "Microchip number must be digits only"

    Scenario: Enter microchip number1 already exists in the database for another dog
        When I set "345677654366666" to the inputfield "#microchipNumber"
        And I set "345677654358874" to the inputfield "#microchipNumber2"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Microchip number already exists"

    Scenario: Enter microchip number2 already exists in the database for another dog
        When I set "345677654368874" to the inputfield "#microchipNumber"
        And I set "345677654355555" to the inputfield "#microchipNumber2"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Microchip number already exists"    

    Scenario: Invalid date of birth(future date)
        When I set "12345689652364" to the inputfield "#microchipNumber"
        And I set "1258964785694" to the inputfield "#microchipNumber2"
        And I set "01" to the inputfield "#dateOfBirth-day"
        And I set "03" to the inputfield "#dateOfBirth-month"
        And I set "2026" to the inputfield "#dateOfBirth-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Date must be today or in the past"
        
    Scenario: Invalid date of death(not real date)
        When I set "01" to the inputfield "#dateOfBirth-day"
        And I set "03" to the inputfield "#dateOfBirth-month"
        And I set "2022" to the inputfield "#dateOfBirth-year"
        And I set "30" to the inputfield "#dateOfDeath-day"
        And I set "02" to the inputfield "#dateOfDeath-month"
        And I set "2024" to the inputfield "#dateOfDeath-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Date must be a real date"

    Scenario: Invalid date in Date exported(2 digit year)
        When I set "30" to the inputfield "#dateOfDeath-day"
        And I set "03" to the inputfield "#dateOfDeath-month"
        And I set "2024" to the inputfield "#dateOfDeath-year"
        And I set "30" to the inputfield "#dateExported-day"
        And I set "02" to the inputfield "#dateExported-month"
        And I set "24" to the inputfield "#dateExported-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Date must be a real date"
    
    Scenario: Invalid date in Date stolen(alphanumeric)
        When I set "30" to the inputfield "#dateExported-day"
        And I set "02" to the inputfield "#dateExported-month"
        And I set "2024" to the inputfield "#dateExported-year"
        And I set "03" to the inputfield "#dateStolen-day"
        And I set "gh" to the inputfield "#dateStolen-month"
        And I set "2024" to the inputfield "#dateStolen-year"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Date must be a real date"

    Scenario: Invalid date in Date untraceable(missing day and year)
        When I set "03" to the inputfield "#dateStolen-day"
        And I set "02" to the inputfield "#dateStolen-month"
        And I set "2024" to the inputfield "#dateStolen-year"
        And I set "13" to the inputfield "#dateUntraceable-month"
        And I click on the element "button=Save details"
        Then I expect that element "form" contains the text "Date must include a day and year"