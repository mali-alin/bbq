require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAWG6GUQIWDG53YNRQ',
      aws_secret_access_key: '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'
    }

    config.fog_directory  = 'megabit-bucket'
  end
end
