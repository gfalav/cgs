class Tconstr < ActiveRecord::Base
  attr_accessible :tipo
  
  has_many :proyectos
end
