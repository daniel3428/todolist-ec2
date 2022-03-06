class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end

    def create
        
        User.all.each do |user|
            if user.userwallet == user_params[:userwallet]
                @user = user
            end
        end
        
        if @user
        else
            @user = User.new(user_params)
            @user.save
        end

        render json: @user
    end

    def destroy
        @user.destroy
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:id, :userwallet)
        end
end
