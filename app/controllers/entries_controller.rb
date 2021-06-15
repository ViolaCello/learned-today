class EntriesController < ApplicationController
    # before_action :require_login
 
     def index
         @user = User.find_by_id(session[:user_id])
         if @user 
             @entries = @user.entries
             redirect_to entries_path(@entries)
         else 
             byebug
            # raise "Line 9 in Entry".inspect
         end
 
     end
 
     def new
         @entry = Entry.new
     end
 
     def create
         @user = current_user if logged_in?
         if @user
             @entry = @user.entries.build(entry_params)
             if @entry.save 
                 #raise.params.inspect
               #   byebug
                 redirect_to entry_path(@entry)
             else 
                 @errors = @entry.errors
                 render :'entries/new'
             end
         end
     end
 
     def show
        @entry = Entry.find_by_id(params[:id])
     end

     def edit
        if logged_in?
            @user = current_user
            user_ok?(@user)
            @entry = Entry.find_by_id(params[:id])
            redirect_to '/' if @user.id != @entry.user_id
        else
            redirect_to '/'
        end
    end

     def update
        raise.params.inspect
     end

     private
 
     def require_login
         return head(:forbidden) unless session.include? :user_id
     end
 
     private
 
 def entry_params
     params.require(:entry).permit(:title, :post, :user_id)
 end
 
 end
 