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

	def job
		get_all_jobs
		@part_time_jobs = @jobs.part_time   
		@full_time_jobs =@jobs.full_time
	end

end
