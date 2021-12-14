class Account < ApplicationRecord
	mount_uploader :img, AvatarUploader
	has_one :user
	has_one :wallet
	has_one :portfolio
	has_many :logs
  accepts_nested_attributes_for :user
  enum roles: { admin: "admin", broker: "broker", trader: "trader"}

	after_create :create_wallet, :create_log, :create_portfolio

	def create_wallet
		Wallet.create(account: self, balance: "100k")
	end

	def create_log 
		Log.create(account:self, description: "Account created.")
	end

	def create_portfolio 
		Portfolio.create(account: self)
	end
end
