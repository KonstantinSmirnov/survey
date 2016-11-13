Feature: User can work with surveys
  In order to use surveys functionality
  User should work with surveys

  Scenario: User can create new survey
    Given a logged in user
    When user click link "Create new"
    And user fill in "survey_title" with "This is a survey title"
    And user fill in "survey_description" with "This is a survey description"
    And user press button "Submit"
    Then user will see text "New survey created"
    Then user will see text "This is a survey title"

  Scenario: User can not create new survey without title
    Given a logged in user
    When user click link "Create new"
    And user fill in "survey_title" with ""
    And user fill in "survey_description" with ""
    And user press button "Submit"
    Then user will see text "You entered incorrect data"

  Scenario: User can remove own survey
    Given a logged in user
    And a survey is created
    And user click link "Delete"
    Then user will see text "Deleted"

  Scenario: User can switch to surveys list view
    Given a logged in user
    And user click link "List view"
    Then user will see text "Surveys list view"

  Scenario: User can switch to surveys card view
    Given a logged in user
    And user click link "Card view"
    Then user will see text "Surveys card view"
