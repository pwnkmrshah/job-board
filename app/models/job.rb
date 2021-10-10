
class Job < ApplicationRecord
 
	belongs_to :user, optional: true
  	has_many :applied_jobs, :class_name => 'AppliedJob', :foreign_key => :job_id
  	has_many :favorite_jobs
  	has_many :favorited_by, through: :favorite_jobs, source: :user 
  	enum job_type: [ :part_time, :full_time]
end
