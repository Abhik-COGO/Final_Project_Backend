class UserController < ApplicationController

    # skip_before_action :verify_authenticity_token

    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

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

    def update
        user = params[:user_id]
        if(@current_user.id == user)
             @current_user.bio = params[:bio] || @current_user.bio
             @current_user.profile_url = params[:imageURl] || @current_user.profile_url
             @current_user.save
        else
            render text: 'Not Authorized to update this user'
        end
    end

    def user_params
        params.permit(:username, :name, :bio, :email, :password, :profile_url, :gender, :age)
    end

    def find_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { errors: 'User not found' }, status: :not_found
      end

end
