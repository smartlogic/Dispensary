CarrierWave.configure do |config|
  config.permissions = 0666
  config.storage = :s3

  config.s3_access_key_id = '0943GY2MVTN18DENQWG2'
  config.s3_secret_access_key = '1mkIX9esxj4xmCV91mbLWW4Prm0j+Vfi5GjZshIo'

  require 'carrierwave/orm/activerecord'

  config.s3_headers= {"Content-Transfer-Encoding" => "binary", "Content-Type" => "application/octet-stream"}

  if Rails.env.test? or Rails.env.cucumber?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end
end

