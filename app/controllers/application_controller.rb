class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

  # rescue_from CanCan::AccessDenied do
  #   flash[:error] = 'Access denied!'
  #   redirect_to root_url
  # end  
  def after_sign_in_path_for(resource)
    case resource.class.to_s
    when "User"
      if resource.has_role? :applicant
        applicants_dashboard_index_path
      elsif resource.has_role? :recruiter
        # recruiters_dashboard_index_path
        my_account_recruiters_dashboard_index_path
      else
        root_path
      end
    when "AdminUser"
      admin_dashboard_path
    end
  end
  
  def routing_error(error = 'Routing error', status = :not_found, exception = nil)
    render :file => "#{Rails.root}/public/404.html.erb", :layout => "frontend", :status => 404
  end


    
end
