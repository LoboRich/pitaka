module EmojiRandomizer
    class Client
        def self.today
            response = Request.call(http_method: 'get', endpoint:'today.json')
        end

        def self.random_positive_emoji
            response = Request.call(http_method: 'get', endpoint:"/random/group_face_positive")
        end
    end
end