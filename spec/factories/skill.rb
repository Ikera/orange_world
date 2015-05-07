FactoryGirl.define do
	factory :skill do
		character_id "1"
		name "Intellect"
		value "50"
		icon { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app', 'assets', 'images','Intellect.jpg')) }   
	end
end