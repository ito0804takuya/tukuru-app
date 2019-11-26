require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1' #例 'ap-northeas-1'
    }
    config.fog_directory  = 'tukuru-app'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tukuru-app'
  end
end


# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     # aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
#     aws_access_key_id: ENV['ACCESS_KEY_ID'],
#     # aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
#     aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
#     region: 'ap-northeast-1'
#   }
  


#   config.fog_directory  = 'tukuru-app'
#   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tukuru-app'
# end
