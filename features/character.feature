Feature: Characters

  Scenario: Redirecting to login page
    Given an character exists called "Warrior" 
    When I try to visit the characters list
    Then I should see login page instead of an character called "Warrior"

  Scenario: Sign up
    Given an "User"
    When I try to sign up
    And I push sign up link
    And I enter my "username", "email", "password" and "password_confirmation"
    And I push sign up button
    Then I am log in as user 