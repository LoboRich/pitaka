module Api
    class QuotesController < ApplicationController
        def index
            quotes = QuoteRandomizer::Client.today

            render json: quotes
        end
    end
end