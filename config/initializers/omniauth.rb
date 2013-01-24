#OmniAuth.config.full_host = "http://4mcg.localtunnel.com"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,"906135252788.apps.googleusercontent.com", "OEUPs5pxwzqz0O7V6XQbdM9Q"
end
