class Account < ApplicationRecord
	mount_uploader :img, AvatarUploader
	has_one :user
  	accepts_nested_attributes_for :user
  	enum roles: { admin: "admin", broker: "broker", trader: "trader"}

	has_many :logs

	after_create :create_log 

	def create_log 
		Log.create(account:self, description: "Account created.")
	end
end
