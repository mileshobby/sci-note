class Api::UsersController < ApplicationController

    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        log_in(@user)
        render :show
      else
        render json: @user.errors.full_messages, status: 421
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end

end
