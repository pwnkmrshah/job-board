class Applicants::DashboardController < ApplicationController
	
	include Applicants

	def new
		
	end

	def index
		get_all_jobs
		@part_time_jobs = @jobs.part_time   
		@full_time_jobs =@jobs.full_time
	end

	def my_account
				current_user.update(user_params) if request.post?
	end

	def my_applications
		@my_jobs = current_user.applied_jobs
	end


	def application_detail
		@applied_job = AppliedJob.find_by_job_id(params[:id])
	end

	def subscription
		if request.post?
			# success = false
			# Stripe.api_key = STRIPE_SECRET
			# 	begin
			# 		card = Stripe::Token.create({
			# 			card: {
			# 			number: params[:card_number],
			# 			exp_month: params[:exp_month],
			# 			exp_year: params[:exp_year],
			# 			cvc: params[:cvc]
			# 			},
			# 		})

			# 	  charge = Stripe::Charge.create({
			# 		  amount: params[:paid_amount].to_i*100,  
			# 		  currency: "INR",
			# 		  source: card.id,
			# 		})

			# 		subscription = current_user.build_subscription(subscription_params) if charge&.paid
			# 		subscription.save!
					render json: {success: true, message:'Subscription done.'}

				# rescue StandardError => e
				#   flash[:error] = e.message
				# end
				

		end

	end
	
end
private
	def subscription_params
		params.permit(:user_id, :paid_amount,:start_date,:end_date)
	end
