class Reltramovano < ActiveRecord::Base
  attr_accessible :angulo, :tramo_id, :vano_id
  
  belongs_to :tramo
  belongs_to :vano
end
