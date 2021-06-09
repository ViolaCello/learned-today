class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            # raise.params.inspect
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
