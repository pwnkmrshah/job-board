class Applicants::DashboardController < ApplicationController
	
	include Applicants

	def new
		
	end

	def index
		get_all_jobs
	end

	def job
		get_all_jobs
	end

end
