OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "281560092221774", "d7291ddcc14ab0b3b7293d1f05bbcd1c"
end
