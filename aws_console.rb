require 'rubygems'
require 'fog'

class S3
  CONN = Fog::Storage.new(:provider => 'AWS', :aws_secret_access_key => '1mkIX9esxj4xmCV91mbLWW4Prm0j+Vfi5GjZshIo', :aws_access_key_id => '0943GY2MVTN18DENQWG2')
  DEPO = CONN.directories.get("sls-appdepository-dev")
end
