class Skill < ActiveRecord::Base
  belongs_to :character
  mount_uploader :icon, IconUploader
end
