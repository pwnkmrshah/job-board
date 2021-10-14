class UserMailer < Devise::Mailer
  helper  :application # helpers defined within `application_helper`
	
  default from: 'pwnkmrshah@gmail.com'

  layout  'mailer'

end
