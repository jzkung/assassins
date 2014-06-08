Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1475459796024695', 'bd831e516cc306b5d10606f459e4a4de',
           :scope => 'email,public_profile', :display => 'popup', :image_size => 'large'
end