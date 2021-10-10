class AppliedJob < ApplicationRecord
	has_attached_file :resume
   validates_attachment_content_type :resume,
   :content_type => ["application/pdf"]




	# belongs_to :user, optional: true
	belongs_to :job, optional: true
	has_many :applicants, :class_name => 'User', :foreign_key => :applicant_id

	belongs_to :applicant, :class_name => "User"
	belongs_to :recruiter, :class_name => "User"
end
