CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => ENV['WDI_S3_BUCKET'],                        
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                       
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                       
    :region                 => 'eu-west-1' 
  }
  config.fog_directory  = 'name_of_directory'                     
  config.fog_public     = true                                  
end
