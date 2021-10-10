class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  attr_accessor :role
  # enum role: [ :applicant, :recruiter]
  rolify
  has_many :jobs
  has_many :applied_jobs, :class_name => 'AppliedJob', :foreign_key => :applicant_id


  has_many :favorite_jobs  
  
  has_many :favorites, through: :favorite_jobs, source: :job # the actual recipes a user favorites



end
