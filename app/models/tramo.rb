﻿class Tramo < ActiveRecord::Base
  attr_accessible :cantidad, :nombre, :proyecto_id, :secuencia, :ttramo_id
  
  belongs_to :proyecto
  belongs_to :ttramo
  has_many :reltramovanos
  has_many :vanos, :through => :reltramovanos
  
  def calcabezal
  
      return
  end


  def calc132coplhoriz() #cálculo de dimensiones de líneas coplanar horizontal en 13,2kV
      #calcula valores mínimos de apoyo
      alin_lcruceta = dcond(0.7,1.28,0,13.2) * 2
      alin_lposte = (hlibre + flecha) / 0.9
      alin_hempotr = alin_lposte * 0.1
      alin_hcond1 = alin_hcond2 = alin_hcond3 = alin_lposte
      alin_hcondp = nil
  
      debugger
  end

  def dmin(lcadena,ang,un,dapoyo)
      return lcadena * Math.sin(ang / 180 * Math::PI) + dt1(un) + dapoyo/2 + 0.02      
  end

  def dm(lpend,lcadena,un)   #distancia entre ménsulas
      return lpend + lcadena + dt1(un)
  end

  def dcond(k,flecha,lcadena,un)
      return k * Math.sqrt(flecha+lcadena) + dt1(un)      
  end

  def dt1(un)
      return un / 150
  end
  
  def hcp(hcs, lm, lmcp) 
      return 1/3 * Math.sqrt( 2 * hcs + Math.sqrt(3) * (lm - lmcp) + hcs ** 2 + 4 * Math.sqrt(3) * (lm - lmcp) * hcs)
  end

end
