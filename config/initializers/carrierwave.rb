CarrierWave.configure do |config|
  config.delete_tmp_file_after_storage = false
  config.dropbox_app_key = ENV["APP_KEY"]
  config.dropbox_app_secret = ENV["APP_SECRET"]
  config.dropbox_access_token = ENV["ACCESS_TOKEN"]
  config.dropbox_access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  config.dropbox_user_id = ENV["USER_ID"]
  config.dropbox_access_type = "dropbox"
end