class UserMailer < Devise::Mailer
  helper  :application # helpers defined within `application_helper`
	
  include Devise::Controllers::UrlHelpers # eg. `confirmation_url`

  default from: 'pwnkmrshah@gmail.com'

  layout  'mailer'

end
