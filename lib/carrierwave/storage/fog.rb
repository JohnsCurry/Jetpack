CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIFGBO27GDPPJUVGA',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-standard'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'jetpack-assets'                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  #config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end