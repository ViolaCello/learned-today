class TopicsController < ApplicationController

    def new
        @topic = Topic.new
        @entry = Entry.find_by_id(params[:entry_id])
    end

    def create
        raise.params.inspect
        @user = current_user if logged_in?
        @entry = Entry.find_by_id(params[:entry_id])
    end




    private 

    def topic_params
        params.require(:topic).permit(:keyword, :entry_id, :user_id)
    end
end