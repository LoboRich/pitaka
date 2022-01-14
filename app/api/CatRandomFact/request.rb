require 'rest-client'

module CatRandomFact
    class Request
        BASE_URL = 'https://catfact.ninja'
        def self.call(http_method:, endpoint:)
            result = RestClient::Request.execute(
                method: http_method,
                url: "#{BASE_URL}#{endpoint}",
                headers: {'Content-Type'=> 'application/json'}
            )
            JSON.parse(result)
        end
    end
end