class Tramo < ActiveRecord::Base
  attr_accessible :cantidad, :nombre, :proyecto_id, :secuencia, :ttramo_id
  
  belongs_to :proyecto
  belongs_to :ttramo
  has_many :reltramovanos
  has_many :vanos, :through => :reltramovanos
  
end
