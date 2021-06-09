class SessionsController < ApplicationController

    def welcome
    end

    def destory
        session.delete(:user_id)
        redirect_to '/'
    end

end