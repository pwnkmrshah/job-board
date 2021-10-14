class Recruiters::JobsController < ApplicationController
	load_and_authorize_resource
	include  Recruiters
	def new
		@job = Job.new
	end

	def index
		@jobs = @jobs.paginate(page: params[:page], per_page: 5)
	end

	def candidates
		@jobs =  AppliedJob.includes(:job).where(recruiter_id: current_user.id).paginate(page: params[:page], per_page: 5)
	end

	def edit
		@job = Job.find_by_id(params[:id])
	end
	
	def create
		byebug
		job = Job.new(job_params)
		job.save!
		JobMailer.post_job(job).deliver_now
		redirect_to recruiters_jobs_path, notice: "Job added."
	end

	def update
		job = Job.find_by_id(params[:id])
		job.update(job_params)
		redirect_to recruiters_jobs_path, notice: "Job updated."
		
	end

	def destroy
		job = Job.find_by_id(params[:id])
		job.destroy
		redirect_to recruiters_jobs_path, notice: "Job deleted."
		
	end

end

private

def job_params
	params.require(:job).permit(:company_name, :title, :skills, :description, :locality, :user_id, :category, :type, :closing_date)
end
