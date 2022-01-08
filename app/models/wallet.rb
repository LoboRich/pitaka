class Wallet < ApplicationRecord
    belongs_to :account

    def self.deduct(wallet, price)
        wallet.update!(balance: wallet.balance.to_f - price.to_f)
        Log.create(account: wallet.account, description: "Purchased stock amounting to #{price.to_f}")
    end
    
    def self.sufficient_balance?(wallet, price)
        wallet.balance.to_f > price.to_f
    end
end
