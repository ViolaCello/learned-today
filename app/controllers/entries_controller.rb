class EntriesController < ApplicationController
    before_action :require_login

    def index
        @user = User.find_by_id(params[:user_id])
        if @user 
            @entries = @user.entries
        else 
            raise "problem in EntriesController line 9".inspect
        end

    end

    def new
        
    end


    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
