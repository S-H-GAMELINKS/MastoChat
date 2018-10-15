class Api::ChatController < ActionController::API

    def index
        @chats = Chat.all
        render json: @chats
    end
end
