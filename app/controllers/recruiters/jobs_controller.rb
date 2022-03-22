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
		job = Job.new(job_params)
		job.save!
		EmailWorker.perform_async  'posted_job', job.id
		redirect_to recruiters_jobs_path, notice: "Job added."
	end

	def update
		job = Job.find_by_id(params[:id])
		job.update(job_params)
		EmailWorker.perform_async  'posted_job', job.id
		redirect_to recruiters_jobs_path, notice: "Job updated."
		
	end

	def approve_resume
		byebug
		job = AppliedJob.find_by_id(params[:id])
		job.update(status: 'approved')
	end


	def reject_resume
		byebug
		job = AppliedJob.find_by_id(params[:id])
		job.update(status: 'rejected')
	end

	def destroy
		job = Job.find_by_id(params[:id])
		job.destroy
		redirect_to recruiters_jobs_path, notice: "Job deleted."
		
	end

end

private

def job_params
	params.require(:job).permit(:company_name, :title, :skills, :job_type, :description, :locality, :user_id, :category, :type, :closing_date)
end
