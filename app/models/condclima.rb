class Condclima < ActiveRecord::Base
  attr_accessible :hielo, :nombre, :temp, :viento, :zona_id
  
  belongs_to :zona
end
