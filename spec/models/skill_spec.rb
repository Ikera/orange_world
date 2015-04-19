require 'rails_helper'

describe Skill do
	it "Create skill" do
		skill = FactoryGirl.create(:skill)
		expect(skill).to be_valid
	end

	it { should validate_presence_of(:name)}
	it { should validate_presence_of(:value)}
	it { should validate_presence_of(:icon)}
	it { should belong_to(:character) }
end