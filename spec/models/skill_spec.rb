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
	it { should_not allow_value('6').for(:value) }
	# it { should_not allow_value('16').for(:value) }
	it { should_not allow_value('101').for(:value) }
	it { should allow_value('10').for(:value) }
end