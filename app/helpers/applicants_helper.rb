module ApplicantsHelper
	def recruiter_id(job_id)
		Job.find_by_id(job_id).user_id

	end

	def already_applied(job)
		job.applied_jobs.find_by(applicant_id:current_user.id)
	end

	def is_favorite(job)
		job.favorited_by.map(&:id).include? current_user.id
	end

	def applied_date(job)
		if job.applied_date.present?
			job.applied_date.try(:strftime, "%D")
		else
			''
		end
	end

end
