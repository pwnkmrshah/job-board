class EmailWorker
	
	include Sidekiq::Worker
	sidekiq_options retry: false


  	def perform(mailer,  job_id)
  		id = job_id
			if mailer  == 'applied_job'
  			applied_job = AppliedJob.find_by_id(job_id)
				JobMailer.applied_job(applied_job).deliver_now
			elsif mailer  == 'posted_job'
  			posted_job = Job.find_by_id(job_id)
				JobMailer.posted_job(posted_job).deliver_now
		  end
	  end


end