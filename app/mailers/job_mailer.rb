class JobMailer < Devise::Mailer
  helper  :application # helpers defined within `application_helper`
	
  default from: 'pwnkmrshah@gmail.com'

  layout  'mailer'

  def posted_job(job)
  	@title = job.title
  	@company_name = job.company_name
  	@job_type = job.job_type&.titleize
  	@category = job.category
  	@location = job.locality
  	to_email = []
  	to_email << job.user.email
  	to_email << User.all.map(&:email)
  	to_email = to_email.compact
    mail(to: to_email, subject: 'A new job posted.')

  	
  end

  def applied_job(applied_job)
  	@recruiter = applied_job.recruiter
  	@company_name = applied_job.job.company_name
  	@title = applied_job.job.title
  	@job_type = applied_job.job.job_type&.titleize
  	@location = applied_job.job.locality
  	recruiter_email = applied_job.job.user.email
    mail(to: recruiter_email, subject: "One Application Recieved for #{@title} Position")  if recruiter_email
  end

end

