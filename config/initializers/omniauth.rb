OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  	provider :facebook, ENV['1475459796024695'], ENV['bd831e516cc306b5d10606f459e4a4de'],
  			 :scope => 'email', :display => 'popup'
end