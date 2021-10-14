class Recruiters::DashboardController < ApplicationController

	def new
		
	end

	def index
		
	end

	def my_account
		current_user.update(user_params) if request.post?
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

private
def user_params
	params.require(:user).permit(:name,:dp, :qualification, :address,  :phone, :total_experience )
	
end
