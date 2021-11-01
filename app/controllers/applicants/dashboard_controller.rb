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
		check_stripe_customer_id  unless current_user.stripe_customer_id  			
		Stripe.api_key = STRIPE_SECRET
		# Create a  payment
		begin
			payment = Stripe::PaymentMethod.create({
								  type: 'card',
									card: {
									number: params[:card_number],
									exp_month: params[:exp_month],
									exp_year: params[:exp_year],
									cvc: params[:cvc]
									}
								})

			puts "============payment created=========================="

		Stripe::PaymentMethod.attach(
									  payment.id,
									  {customer: current_user.stripe_customer_id},
									)
		puts "============pay method attached=========================="
		# update customer default payment method
			pay_method  = Stripe::Customer.update(
												current_user.stripe_customer_id, 
												{invoice_settings: 
													{default_payment_method: payment.id}
												},
											)
		puts "============ pay method updated=========================="
		# Create subscription
			plan = Plan.first
			subscribe  =	Stripe::Subscription.create({
											  customer: current_user.stripe_customer_id,
											  items: [
											    {price: plan.stripe_price_id},
											  ]
											})
			puts "============subscription created=========================="
			subscription = current_user.build_subscription(subscription_params) if subscribe
		rescue StandardError => e
			puts "============#{e.message}=========================="
		end
			
		# if request.post?
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
					# render json: {success: true, message:'Subscription done.'}

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
