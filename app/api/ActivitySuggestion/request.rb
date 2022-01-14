require 'rest-client'

module ActivitySuggestion
    class Request
        BASE_URL = 'https://www.boredapi.com/api'
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