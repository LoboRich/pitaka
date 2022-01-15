module Api
    class IntertainmentsController < ApplicationController
        def activity_suggestion
            activity = ActivitySuggestion::Client.random
            render json: activity
        end

        def cat_fact
            fact = CatRandomFact::Client.random
            render json: fact
        end

        def exchange_rate
            rate = ExchangeRate::Client.latest_exchange_rate(params['currency'])
            render json: rate
        end

        def random_positive_emoji
            emoji = EmojiRandomizer::Client.random_positive_emoji
            render json: emoji
        end

        def random_quote
            quote = QuoteRandomizer::Client.today
            render json: quote
        end

    end
end