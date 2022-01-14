module QuoteRandomizer
    class Client
        def self.today
            response = Request.call(http_method: 'get', endpoint:'qod.json?language=en')
        end
    end
end