class Zona < ActiveRecord::Base
  attr_accessible :nombre
  
  has_many :proyectos
end
