class Applicants::DashboardController < ApplicationController
	
	include Applicants

	def new
		
	end

	def index
		get_all_jobs
		@part_time_jobs = @jobs.part_time   
		@full_time_jobs =@jobs.full_time
	end

	def job
		get_all_jobs
	end

end
