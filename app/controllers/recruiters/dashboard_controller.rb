class Recruiters::DashboardController < ApplicationController

	def new
		
	end

	def index
		
	end

	def user_list
        @users = User.all 
    end 

    def chat_with_candidate
        @sender = User.find(params[:user_id])
        @receiver = User.find(params[:receiver_id])
        @messages = Message.where(sender_id: @sender.id, receiver_id: @receiver.id).or(Message.where(sender_id: @receiver.id, receiver_id: @sender.id))
        @chat_id = [@sender.id, @receiver.id].sort.join("") #generates a unique identifier for a pair of user 
    end 
end
