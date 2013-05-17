# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

if Rails.env.production?
  config_file = File.join(File.expand_path(Rails.root),"..","..","shared","keys.yaml")
  puts "carregando : #{config_file}"
  File.readlines(config_file).each do |line|
    key,value = line.strip.chomp.split /: ?/
    ENV[key] =value
  end
 
p ENV
end
InventtoSite::Application.config.secret_token = ENV['inventto_secret_token']
