class UserController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @user = User.new(user_params);
        @user.save;
        render json: @user;
    end

    def allUser
        @user = User.all
        render json: @user
    end

    def destroy
        user = User.find_by(name: params[:name])
        render json: user
        user.destroy
    end

    def user_params
        params.permit(:username, :name, :bio, :email, :password, :profile_url, :gender, :age)
    end

end
