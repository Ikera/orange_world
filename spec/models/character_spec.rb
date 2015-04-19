require 'rails_helper'

describe Character do

    it "has a name and avatar" do
	  character = FactoryGirl.build(:character)
	  expect(character).to be_valid
	end

	it "is invalid without a name" do
	  character = Character.new(name: nil)
	  character.valid?
	  expect(character.errors[:name]).to include("can't be blank")
	 end

	it "create a character Warrior" do
      character = FactoryGirl.create(:character)
      expect(character).to be_valid
    end
end

describe Character do
	it { should validate_presence_of(:name)}
	it { should validate_presence_of(:avatar)}
	it { should have_many(:skills).dependent(:destroy) }
	it { should belong_to(:user) }
end