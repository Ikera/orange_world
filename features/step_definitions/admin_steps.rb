Given(/^an admin$/) do
  @admin = FactoryGirl.build(:admin, email: "baki@baki.org", password: "bakibaki")
  @admin.save
end

When(/^there is an "(.*?)"$/) do |user|
  user = FactoryGirl.create(:user)
  user.save
end

When(/^there is an "(.*?)" of that user$/) do |character|
  character = FactoryGirl.create(:character)
  character.save
end

When(/^there is an "(.*?)" of that character$/) do |skill|
  skill = FactoryGirl.create(:skill)
  skill.save
end

# Login as admin

When(/^I visit welcome page$/) do
 visit root_path
end

When(/^I click on Users link$/) do
  click_link('Users')
end

When(/^I log in with my "(.*?)" and "(.*?)"$/) do |email, password|
  fill_in('Email', :with => 'baki@baki.org')
  fill_in('Password', :with => 'bakibaki')
  click_button('Log In')
end

Then(/^I am on the users page$/) do
  visit admins_users_path
end

# Showing User characters

Given(/^an Admin$/) do
 steps %{
    When I visit welcome page
    And I click on Users link
    And I log in with my "email" and "password"
    Then I am on the users page
 }
end

When(/^I click on show link$/) do
  click_link('Show')
end

Then(/^I am on the user page$/) do
  visit('/admins/users/1')
end

Then(/^I see character named "(.*?)"$/) do |text|
  page.should have_content(text)
end


# Showing character skills

Given(/^Admin on the users characters page$/) do
  steps %{
  	Given an Admin
    When I click on show link
    Then I am on the user page
    And I see character named "Warrior"
  }
end

When(/^I click on show button$/) do
  click_link('Show')
end

Then(/^I can see character skill named "(.*?)"$/) do |skill|
  page.should have_content(skill)
end

# Deleting users

When(/^I click on Delete link$/) do
  click_link('Delete')
end

When(/^I confirm with ok in alert window$/) do
  page.driver.browser.switch_to.alert.accept
end


Then(/^I do not see user named Baki$/) do
 page.should have_no_content('Baki')
end

# Deleting characters

Given(/^Admin in particular character page$/) do
 steps %{
  Given Admin on the users characters page
  When I click on show button
  Then I can see character skill named "Intellect"
 }
end

Then(/^I do not see character named Warrior$/) do
  page.should have_no_content('Warrior')
end

# Deleting skills

Then(/^I do not see skill named Intellect$/) do
  page.should have_no_content('Intellect')
end

# Editing users

When(/^I click on Edit link$/) do
  click_link('Edit')
end

Then(/^I am on the edit user page$/) do
  visit('/admins/users/1/edit')
end

Then(/^I change users personal informations$/) do
  fill_in('Username', :with => 'Ikera 2')
  fill_in('Email', :with => 'baki@baki.org')
  fill_in('Password', :with => 'bakibaki')
  fill_in('Password confirmation', :with => 'bakibaki')
  click_button('Edit')
end

Then(/^I can see user with changed personal infornations$/) do
  visit admins_users_path
  page.should have_content('Ikera 2')
end

# Editing characters

Then(/^I am on the edit character page$/) do
  visit('/admins/characters/1/edit')
end

Then(/^I change character personal informations$/) do
  fill_in('Name', :with => 'Warrior 2')
  click_button('Submit')
end

Then(/^I can see character with changed personal informations$/) do
  visit('/admins/users/1')
  page.should have_content('Warrior 2')
end

# Editing skills

When(/^I click on Edit skill link$/) do
  click_link('Edit skill')
end

Then(/^I am on the edit skill page$/) do
   visit('/admins/skills/1/edit')
end

Then(/^I change skill charactersistics$/) do
  fill_in('Name', :with => 'Speed')
  click_button('Submit')
end

Then(/^I can see skill with changed characteristics$/) do
  visit('/admins/characters/1')
  page.should have_content('Speed')
end
