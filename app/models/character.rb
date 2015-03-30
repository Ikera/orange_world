class Character < ActiveRecord::Base
	belongs_to :user
	mount_uploader :avatar, AvatarUploader
    has_many :skills, dependent: :destroy

end
