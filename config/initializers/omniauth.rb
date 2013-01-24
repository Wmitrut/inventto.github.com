#OmniAuth.config.full_host = "http://4mcg.localtunnel.com"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,"1027125253473.apps.googleusercontent.com", "AIzaSyBCzoUjVJg0mT7anHF1hyVaqbDlsJUZmlA"
end
