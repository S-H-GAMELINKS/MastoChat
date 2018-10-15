class Api::ChatController < ActionController::API
    before_action :set_chat, only: [:show, :edit, :update, :destory]

    def index
        @chats = Chat.all
        render json: @chats
    end

    private
        def chat_params
            params.require(:chat).permit(:title)
        end

        def set_chat
            @chat = Chat.find(params[:id])
        end
end
