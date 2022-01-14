module ActivitySuggestion
    class Client
        def self.random
            response = Request.call(http_method: 'get', endpoint:"/activity")
        end
    end
end