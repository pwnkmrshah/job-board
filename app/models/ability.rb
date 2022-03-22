# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :recruiter
      can :new, Job
      can :create, Job
      can :index, Job
      can :edit, Job
      can :update, Job
      can :candidates, Job
      can :download_pdf, Job
      can :destroy, Job
      can :user_list, Job
      can :chat_with_candidate, Job
      can :candidates, Job
      can :view_application, Job
    elsif user.has_role? :applicant
      can :show, Job
      can :index, Job
      can :all_jobs, Job
      can :job_detail, Job
      can :apply_job, Job
      can :my_favourite_jobs, Job
      can :favorite, Job
      can :user_list, Job
      can :application_detail, Job
      can :chat_with_candidate, Job
    end  
  end
end
