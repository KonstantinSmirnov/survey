Feature: User registrations
  In order to use website functionality
  User should register

  Scenario: Can register with correct credentials
   When user visit "root page"
   And user fill in "user_email" with "test@test.com"
   And user fill in "user_password" with "123123"
   And user fill in "user_password_confirmation" with "123123"
   And user press button "Sign up"
   Then user will see text "A message with a confirmation link has been sent to your email address."

  Scenario: Can not register if email is of incorrect format
    When user visit "root page"
    And user fill in "user_email" with "test-test.com"
    And user fill in "user_password" with "123123"
    And user fill in "user_password_confirmation" with "123123"
    And user press button "Sign up"
    Then user will see text "Email is invalid"

  Scenario: Can not register if password is less than 6 symbols
    When user visit "root page"
    And user fill in "user_email" with "test@test.com"
    And user fill in "user_password" with "123"
    And user fill in "user_password_confirmation" with "123"
    And user press button "Sign up"
    Then user will see text "Password is too short (minimum is 6 characters)"

  Scenario: Can not register if password is not matching with password confirmation
    When user visit "root page"
    And user fill in "user_email" with "test@test.com"
    And user fill in "user_password" with "123123"
    And user fill in "user_password_confirmation" with "123456"
    And user press button "Sign up"
    Then user will see text "Password confirmation doesn't match Password"

  Scenario: Email with confirmation link sent to registared user

  Scenario: User can activate account with confirmation link

  Scenario: User can login with correct credentials
    Given the user "Konstantin" with password "123123"
    When user "Konstantin" signs in with password "123123"
    Then user will see text "Signed in successfully."

  Scenario: User can not sign in with incorrect credentials
    Given the user "Konstantin" with password "123123"
    When user "Konstantin" signs in with password "123456"
    Then user will see text "Invalid Email or password."

  Scenario: Inexistent user can not sign in
    When user "Anatoly" signs in with password "123123"
    Then user will see text "Invalid Email or password."

  Scenario: User can sign out
    Given the user "Konstantin" with password "123123"
    When user "Konstantin" signs in with password "123123"
    And user "Konstantin" signs out
    Then user will see text "Signed out successfully."
