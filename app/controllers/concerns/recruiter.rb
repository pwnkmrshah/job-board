module Recruiters
  include ActiveSupport::Concern

    included do
      before_action :my_uploaded_jobs, only: [:index]
    end

  def my_uploaded_jobs
    @jobs = current_user.jobs

  end

end
