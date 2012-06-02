class Proyecto < ActiveRecord::Base
  attr_accessible :comitente, :cond_e_id, :cond_g_id, :constructor, :desc, :dretmax, :expediente, :fproyecto, :proyectista, :proyecto, :tconstr_id, :ubicacion, :vanomax, :zona_id
  
  belongs_to :zona
  belongs_to :cond_e, :class_name=>'Conductor', :foreign_key=>'cond_e_id'
  belongs_to :cond_g, :class_name=>'Conductor', :foreign_key=>'cond_g_id'
  belongs_to :tconstr
  has_many :puntos
  
end
