module Applicants
  include ActiveSupport::Concern

    # included do
    #   before_action :check_stripe_customer_id, only: [:subscription]
    # end

  def get_all_jobs
    @jobs = Job.all.paginate(page: params[:page], per_page: 25)

  end

  def check_stripe_customer_id
    Stripe.api_key = STRIPE_SECRET
    cutomer = Stripe::Customer.create({
          email: current_user.email,
        })  
    user.update(stripe_customer_id: cutomer.id)
  end

end
