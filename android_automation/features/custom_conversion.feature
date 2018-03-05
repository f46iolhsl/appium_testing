@custom_conversions
Feature: User able to create and manage custom conversion

  Scenario: User able to create new conversion
    Given I land on home screen
    Then I press on menu icon
    Then I press on My conversions button
    Then I press on Create your first conversion button
    And I type "Power" as custom conversion name
    When I press on New unit button
    Then I type "Horse power" as unit name
    Then I type "Hp" as symbol
    Then I type "1" as value
    Then I press submit checkMark on Customer Conversions screen
    When I press on New unit button
    Then I type "Horse power" as unit name
    Then I type "Hp" as symbol
    Then I type "1" as value
    Then I press submit checkMark on Customer Conversions screen
    When I pree on ok conversion button
    Then I verify "Power" added to Custom conversion List
