class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: { scope: :email, message: "Email already exists." }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :account

  def role
    self.account.role
  end

  def portfolio
    self.account.portfolio
  end

  def market_portfolios
    self.account.portfolio.market_portfolios
  end

end
