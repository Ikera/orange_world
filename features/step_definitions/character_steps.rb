Given /^an character exists called "(.+)"$/ do |name|
	FactoryGirl.create(:character)
end

When /^I try to visit the characters list$/ do
	visit root_path
end

Then /^I should see login page instead of an character called "(.+)"$/ do |name|
	page.should !have_content(name)
end	

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