Carrierwave.configure do |config|
  config.fog_credentials = {
    provider:                  'AWS',
    aws_access_key_id:         ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key_id:  ENV['AWS_SECRET_ACCESS_KEY_ID'],
    region:                    ''
  }
  #for testing, upload files to local 'tmp' folder
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end
end
