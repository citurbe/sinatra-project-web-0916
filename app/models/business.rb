class Business < ActiveRecord::Base
  def formatted_address
    require 'json'
    JSON.parse(self.address).join(', ')
  end


end
