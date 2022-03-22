
class Job < ApplicationRecord
 
	belongs_to :user, optional: true
  	has_many :applied_jobs, :class_name => 'AppliedJob', :foreign_key => :job_id
  	has_many :favorite_jobs
  	has_many :favorited_by, through: :favorite_jobs, source: :user 
  	enum job_type: [ :part_time, :full_time]
	scope :part_time, -> { where(job_type: 'part_time') }
	scope :full_time, -> { where(job_type: 'full_time') }
	scope :featured_jobs, -> {where("created_at >= ? AND created_at <= ?", Date.today -  2.months, Date.today )}

end
