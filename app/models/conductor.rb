class Conductor < ActiveRecord::Base
  attr_accessible :coef_e, :coef_t, :diametro, :imax, :nombre, :peso, :relec, :rmec, :seccion, :tmax, :tmed
  
  has_many :proyectos
end
