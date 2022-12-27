Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.credentials.google[:client_id], Rails.application.credentials.google[:client_secret]
  provider :facebook, Rails.application.credentials.facebook[:app_id], Rails.application.credentials.facebook[:app_secret]
  # provider :linkedin, Rails.application.credentials.linkedin[:client_id], Rails.application.credentials.linkedin[:client_secret]

end
OmniAuth.config.allowed_request_methods = %i[get]