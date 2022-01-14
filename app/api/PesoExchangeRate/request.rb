require 'rest-client'

module PesoExchangeRate
    class Request
        BASE_URL = 'https://v6.exchangerate-api.com/v6'
        TOKEN = 'token'

        def self.call(http_method:, endpoint:)
            result = RestClient::Request.execute(
                method: http_method,
                url: "#{BASE_URL}#{endpoint}",
                # url: "#{BASE_URL}#{endpoint}?apikey=#{TOKEN}"
                headers: {'Content-Type'=> 'application/json'}
            )
            JSON.parse(result)
        end
    end
end