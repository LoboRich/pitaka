module CatRandomFact
    class Client
        def self.random
            response = Request.call(http_method: 'get', endpoint:"/fact")
        end
    end
end