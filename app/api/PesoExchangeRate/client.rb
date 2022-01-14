module PesoExchangeRate
    class Client
        def self.php_latest_exchange_rate
            response = Request.call(http_method: 'get', endpoint:"/06131a3a1bd44f624ca7fdcf/latest/PHP")
        end
    end
end