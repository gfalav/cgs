class Punto < ActiveRecord::Base
  attr_accessible :angulo, :distancia, :latitud, :longitud, :proyecto_id, :punto, :secuencia
end
