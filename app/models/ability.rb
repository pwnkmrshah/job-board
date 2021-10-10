# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :recruiter
      can :new
      can :create
      can :index
      can :edit
      can :update
      can :candidates
      can :download_pdf
      can :destroy
      can :user_list
      can :chat_with_candidate
      can :candidates
    elsif user.has_role? :applicant
      can :show
      can :apply_job
      can :my_favourite_jobs
      can :favorite
      can :user_list
      can :chat_with_candidate
    end  
  end
end
