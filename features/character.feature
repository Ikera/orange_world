Feature: Characters

  Scenario: Redirecting to login page
    Given an character exists called "Warrior" 
    When I try to visit the characters list
    Then I should see login page instead of an character called "Warrior"