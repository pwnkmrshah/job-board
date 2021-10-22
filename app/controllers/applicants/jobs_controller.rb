class Applicants::JobsController < ApplicationController
	load_and_authorize_resource
	include Applicants


	def index
		@featured_jobs = Job.featured_jobs.sort
	end

	def show
		@job =  Job.find_by_id(params[:id])
	end

	def favorite
    type = params[:type]
  	job = Job.find_by_id(params[:id])
    if type == "favorite"
      current_user.favorites << job
      redirect_to applicants_dashboard_index_path, notice: "You favorited #{job.company_name}"
    elsif type == "unfavorite"
      current_user.favorites.delete(job)
      redirect_to applicants_dashboard_index_path, notice: "Unfavorited #{job.company_name}"
    else
      redirect_to :back, notice: 'Nothing happened.'
    end
	end


	def my_favourite_jobs
		@jobs = current_user.favorites.paginate(page: params[:page], per_page: 5)
	end

	def apply_job
		job  = AppliedJob.new(job_params)
		job.status = 'active'
		job.applied_date   = Date.today
		job.save!
		redirect_to applicants_dashboard_index_path
	end

	def job_detail
		@job = Job.find_by_id(params[:id])
	end







end

private

def job_params
	params.require(:applied_job).permit(:job_id, :applicant_id,  :recruiter_id, :resume,:applicant_name, :applicant_email)
end
