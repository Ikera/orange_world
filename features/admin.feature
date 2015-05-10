Feature: Admin

  Background:
    Given an admin
    And there is an "user"
    And there is an "character" of that user
    And there is an "skill" of that character
  
  @javascript
  Scenario: Login as admin 
    Given I visit welcome page
    And I click on Users link
    And I log in with my "email" and "password"
    Then I am on the users page

  @javascript
  Scenario: Showing User characters
    Given an Admin
    When I click on show link
    Then I am on the user page
    And I see character named "Warrior"
    
  @javascript
  Scenario: Showing character skills
    Given Admin on the users characters page
    When I click on show button
    Then I can see character skill named "Intellect"

  @javascript
  Scenario: Deleting user
    Given an Admin
    When I click on Delete link
    And I confirm with ok in alert window 
    Then I do not see user named Baki

  @javascript
  Scenario: Deleting characters
    Given Admin in particular character page
    When I click on Delete link
    And I confirm with ok in alert window
    Then I do not see character named Warrior

  @javascript
  Scenario: Deleting skills
    Given Admin in particular character page
    When I click on Delete link
    And I confirm with ok in alert window
    Then I do not see skill named Intellect

  @javascript
  Scenario: Editing users
    Given an Admin
    When I click on Edit link
    Then I am on the edit user page
    And I change users personal informations
    Then I can see user with changed personal infornations

  @javascript
  Scenario: Editing characters
    Given Admin in particular character page
    When I click on Edit link
    Then I am on the edit character page
    And I change character personal informations
    Then I can see character with changed personal informations

  @javascript
  Scenario: Editing skills
     Given Admin in particular character page
     When I click on Edit skill link
     Then I am on the edit skill page
     And I change skill characteristics
     Then I can see skill with changed characteristics

  @javascript
  Scenario: Creating an User
    Given an Admin
    When I click on Create new User link
    Then I am on the page for creating users
    And when I fill in users details
    Then I can see new skill

  @javascript
  Scenario: Creating character
     Given Admin on the users characters page
     When I click on Create new character link
     Then I am on the page for creating characters
     And when I fill in characters details
     Then I can see new character
