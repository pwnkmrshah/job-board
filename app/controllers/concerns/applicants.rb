module Applicants
  include ActiveSupport::Concern

    # included do
    #   before_action :set_twit, only: [:show, :edit, :destroy, :update]
    # end

  def get_all_jobs
    @jobs = Job.all.paginate(page: params[:page], per_page: 25)

  end

end
