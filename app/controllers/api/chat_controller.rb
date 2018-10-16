class Api::ChatController < ActionController::API
    before_action :set_chat, only: [:show, :edit, :update, :destory]

    def index
        @chats = Chat.all
        render json: @chats
    end

    def login
        if user_signed_in?
            @user = current_user
        else
            @user = nil
        end

        render json: @user
    end

    private
        def chat_params
            params.require(:chat).permit(:title)
        end

        def set_chat
            @chat = Chat.find(params[:id])
        end
end
