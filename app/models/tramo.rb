class Tramo < ActiveRecord::Base
  attr_accessible :cantidad, :nombre, :proyecto_id, :secuencia, :ttramo_id
  
  belongs_to :proyecto
  belongs_to :ttramo
  has_many :reltramovanos
  has_many :vanos, :through => :reltramovanos
  
  def calcabezal
  
      return
  end


  def dmin(lcadena,ang,dt1,dapoyo)
      return lcadena * Math.sin(ang / 180 * Math::PI) + dt1 + dapoyo/2 + 0.02      
  end

  def dm(lpend,lcadena)   #distancia entre ménsulas
      return lpend + lcadena + dt1
  end

  def dcond(k,flecha,lcadena,dt1)
      return k * Math.sqrt(flecha+lcadena) + dt1      
  end

  def dt1(Un)
      return Un / 150
  end
  
  def hcp(hcs, lm, lmcp) 
      return 1/3 * Math.sqrt( 2 * hcs + Math.sqrt(3) * (lm - lmcp) + hcs ** 2 + 4 * Math.sqrt(3) * (lm - lmcp) * hcs)
  end

end
