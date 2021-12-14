class Account < ApplicationRecord
	mount_uploader :img, AvatarUploader
	has_one :user
  	accepts_nested_attributes_for :user
  	enum roles: { admin: "admin", broker: "broker", trader: "trader"}

	# after_create :create_wallet

	# def create_wallet
	# 	Wallet.create()
	# end
end
