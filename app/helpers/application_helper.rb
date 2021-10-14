module ApplicationHelper
	def resource_name
  :user
end

def resource
  @resource ||= User.new
end

def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end

def resource_class
  devise_mapping.to
end
  
  def current_class?(path)
    
    current_route = Rails.application.routes.recognize_path(path)
    return 'active' if current_page?(path) or params[:controller] == current_route[:controller]

    # return 'active' if request.path == path
    ''
  end
end
