class Market < ApplicationRecord
  mount_uploader :logo, AvatarUploader
  validates :name, uniqueness: { scope: :name, message: "Market name already exists." }
  validates :symbol, presence: true 
  validates :description, presence: true

  has_many :market_portfolios
end
