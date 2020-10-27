class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]
    before_action :authenticate_user
    before_action :ensure_current_user, only: [:edit, :update]
    
    def index
        @search = User.ransack(params[:q])
        @users = @search.result
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
            redirect_to users_path, notice: "ユーザー情報を変更しました"
        else
            render :edit
        end
    end
    
    private
    
    def find_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_user, :remove_image_user, :profile)
    end
end