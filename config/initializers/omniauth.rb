Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '3f41f364b1b80827f86c', '264d8fe165c88b41f243537e40f1cffcbe8c1f95'
end
