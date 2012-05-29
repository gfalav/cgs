class Calcmecanico < ActiveRecord::Base
  attr_accessible :condclima_id, :conductor_id, :flecha_h, :flecha_t, :flecha_v, :hielo, :temp, :tension, :tiro, :vano_id, :viento
end
