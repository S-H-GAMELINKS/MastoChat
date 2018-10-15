class Api::ChatController < ActionController::API
    before_action :set_chat, only: [:show, :edit, :update, :destory]

    def index
        @chats = Chat.all
        render json: @chats
    end

    private
        def set_chat
            @chat = Chat.find(params[:id])
        end
end
