class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  attr_accessor :role
  after_create  :create_stripe_customer
  # enum role: [ :applicant, :recruiter]
  rolify
  has_many :jobs
  has_many :applied_jobs, :class_name => 'AppliedJob', :foreign_key => :applicant_id
  has_one :subscription


  has_many :favorite_jobs  
  
  has_many :favorites, through: :favorite_jobs, source: :job # the actual recipes a user favorites


   has_many :messagee, foreign_key: :receiver_id, class_name: 'Message'  
    has_many :senders, through: :messagee
    has_many :messaged, foreign_key: :sender_id, class_name: 'Message'
    has_many :receivers, through: :messaged

      has_attached_file :dp
    validates_attachment :dp,
                     content_type: { content_type: /\Aimage\/.*\z/ }



  def create_stripe_customer
    user  = User.last
    Stripe.api_key = STRIPE_SECRET
    cutomer = Stripe::Customer.create({
          email: user.email,
        })  
    user.update(stripe_customer_id: cutomer.id)
  end

end
