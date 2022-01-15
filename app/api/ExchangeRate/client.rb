module ExchangeRate
    class Client
        def self.latest_exchange_rate(currency)
            response = Request.call(http_method: 'get', endpoint:"/06131a3a1bd44f624ca7fdcf/latest/#{currency}")
        end
    end
end