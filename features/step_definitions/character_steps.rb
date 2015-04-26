Given /^an character exists called "(.+)"$/ do |name|
	FactoryGirl.create(:character)
end

When /^I try to visit the characters list$/ do
	visit root_path
end

Then /^I should see login page instead of an character called "(.+)"$/ do |name|
	page.should !have_content(name)
end	

# Sign up

Given(/^an "(.*?)"$/) do |user|
  FactoryGirl.build(:user)
end

When(/^I try to sign up$/) do
  visit root_path
end

When(/^I push sign up link$/) do
 click_link('Sign up')
end

When(/^I enter my "(.*?)", "(.*?)", "(.*?)" and "(.*?)"$/) do |username, email, password,
 password_confirmation|
 fill_in('Username', :with => 'Lale')
 fill_in('Email', :with => 'lale@lale.org')
 fill_in('Password', :with => 'lalelale')
 fill_in('Password confirmation', :with => 'lalelale')
end

When(/^I push sign up button$/) do
 click_button('Sign up')
end

Then(/^I am log in as user$/) do
 page.should have_content("Character List")
end

# Make a Character

Given(/^an sign up User$/) do
  steps %{
  	Given an "User"
    When I try to sign up
    And I push sign up link
    And I enter my "username", "email", "password" and "password_confirmation"
    And I push sign up button
    Then I am log in as user 
  }
end

When(/^I click New Character button$/) do
  click_on('New Character')
end

When(/^I enter name "(.*?)"$/) do |name|
  fill_in('Name', :with => 'Warrior')
 
end

When(/^I click on Avatar$/) do
 # document.getElementById("character_avatar")
  attach_file('Avatar', File.join(Rails.root, 'public', 'uploads', 'character', 'avatar', '1', 'thumb_warrior.jpg'))
end

When(/^I swich to popup$/) do
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
end

When(/^I click Submit button$/) do
  click_button('Submit')
end

Then(/^I can see Error message$/) do
  page.should have_content("Avatar can't be blank")
end