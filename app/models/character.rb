class Character < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	validates :avatar, presence: true
	belongs_to :user
	mount_uploader :avatar, AvatarUploader
    has_many :skills, dependent: :destroy

end
