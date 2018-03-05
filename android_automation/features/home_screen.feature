@home_screen
Feature: Tests for Home screen functionality

  Background:
    Given I land on home screen

  Scenario: Default values on Home screen is Foot and Centimeter
    Then Left Unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

   Scenario: Show all button should be enabled at launch
     Then Show All button should be disabled
     When I type "1" on application dashboard
     Then Show All button should be enabled

  Scenario Outline: Verify default conversion
    When I type "<target>" on application dashboard
    Then I should see result as "<result>"
  Examples:
    |target|result|
    |10    |304.8 |
    |1     |30.48 |
    |2     |60.96 |
    |3     |91.44 |
    |9     |274.32|

   Scenario: User able to add current Conversion to favorites list
     Then I press on Add favorite icon
     When I press on menu icon
     Then I press on Favorite conversions
     And I verify "Length" added to Favorite conversion List

   Scenario: User able to search by existing Conversion type
     Then I press on Search Icon
     When I type "Temperature" on search field
     And I press return button on soft keyboard
     Then I see "Temperature" as a current conversion
     Then Left Unit picker value should be "Celsius"
     And Right unit picker value should be "Fahrenheit"

  Scenario Outline: User able to search by existing Conversion type Multiple Values
    Then I press on Search Icon
    When I type "<type>" on search field
    And I press return button on soft keyboard
    Then I see "<type>" as a current conversion
    Then Left Unit picker value should be "<left>"
    And Right unit picker value should be "<right>"

  Examples:
  |type       |left   |right|
  |Temperature|Celsius|Fahrenheit|
  |Length     |Foot   |Centimeter|

  Scenario Outline: User able to select values from unit pickers
    Then I select "<unity_type>" from left unit picker
    When I type "<amount>" on application dashboard
    Then I should see result as "<result>"

    Examples:
      |unity_type|amount|result |
      |Inch2      |1     |2.54   |
      |Link      |1     |20.1168|

  Scenario: User able to convert values
    Then I press on menu icon
    Then I press on "Volume"
    Then I select "Cup" from right unit picker
    When I type "1" on application dashboard
    Then I should see result as "15.1416"

  Scenario: User able to switch values
    Then Left Unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"
    When I press switch units button
    Then Left Unit picker value should be "Centimeter"
    And Right unit picker value should be "Foot"

@wip
  Scenario: User able to clean-up conversions history
    When I press on menu icon
    Then I press on "History"
    Then I should see "No history right now"
    When I press on menu icon
    Then I press on "Length"
    Then I type "1" on application dashboard
    When I press on menu icon
    Then I press on "History"
    And  I verify that 1st result in history list is "Length"
    When I press delete from history at 1st row
    Then I should see text "No history right now"
