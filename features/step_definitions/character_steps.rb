Given /^an character exists called "(.+)"$/ do |name|
	FactoryGirl.create(:character, name: name)
end

When /^I try to visit the characters list$/ do
	visit characters_path
end

Then /^I should see login page instead of an character called "(.+)"$/ do |name|
	page.should !have_content(name)
end	