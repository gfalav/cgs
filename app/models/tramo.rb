class Tramo < ActiveRecord::Base
  attr_accessible :cantidad, :nombre, :proyecto_id, :secuencia, :ttramo_id
  
  belongs_to :proyecto
  belongs_to :ttramo
  has_one :dimgeom
  has_many :reltramovanos
  has_many :vanos, :through => :reltramovanos
  
  def calcabezal
  
    tramo = self
    
      
    case tramo.proyecto.tconstr_id
      when 1
        dimgeom13coplhoriz(tramo)
      when 5
        dimgeom33canadiense(tramo)
    end
  
    return
  end


  def dimgeom33canadiense(tramo) #cálculo de dimensiones de líneas coplanar horizontal en 13,2kV
    #calcula valores mínimos de apoyo
    
    un = 33
    lcadena =  0.525 + 0.08 + 0.09    # 52.5 del aislador orgánico + 8 de la órbita + 9 de la morsa
    lpendulo = 0.22 #pendulo de 22cm
    k = 0.7 #para conductores de aluminio
    hl = tramo.hlibre #altura libre desde el tramo
    fmax = tramo.vanos.maximum(:flechamax_e) #la mayor fecha de los vanos que llegan al apoyo
    dmens = dm(lpendulo,lcadena,un) #distancia vertical entre ménsulas
    dconds = dcond(k,fmax,lcadena,un) #distancia entre conductores
      
    hmi = hl + fmax + lcadena + lpendulo #suma altura libre + flecha + cadena + pendulo
    
    if (dmens>dconds)
      hms = hmi + 1.6 
    else 
      hms = hmi + 1.6 
    end
             
    hmm = (hms + hmi) / 2
    hci = hmi - lpendulo - lcadena
    hcm = hmm - lpendulo - lcadena
    hcs = hms - lpendulo - lcadena
             
    lmensula = 
      case tramo.ttramo_id
        when 1,3,4,5  #cálculo de arranque, terminal, retensión, alineación
          dcond(k,fmax,lcadena,un)
        when 2 #desvio
          dcond(k,fmax,lcadena,un) / Math.sin(tramo.angulo * Math::PI/180/2)
      end
    lcruceta = lmensula * 2            

    hcpr = hcp( hcs.to_f, lmensula.to_f, 0.to_f) # en coplanar no hay cable de protección
      
    lposte = (hcpr - 0.1) / 0.9 #en coplanar es la altura de la mensula + 10% de empotr
    empot = 0.1 * lposte #10% de empotrado

    guarda_dim(tramo.id, lcadena, lpendulo, k, hl, fmax, dmens, dconds, hmi, hmm, hms, hci, hcm, hcs, hcpr, lmensula, lcruceta, lposte, empot)
      
  end


  def dimgeom13coplhoriz(tramo) #cálculo de dimensiones de líneas coplanar horizontal en 13,2kV
    #calcula valores mínimos de apoyo
      
    un =13.2
    lcadena = -0.10 #10cm de perno fijo que elevan el cable
    lpendulo = 0 #no hay pendulo en perno fijo
    k = 0.7 #para coplanar horizontal de conductores de aluminio
    hl = tramo.hlibre #altura libre desde el tramo
    fmax = tramo.vanos.maximum(:flechamax_e) #la mayor fecha de los vanos que llegan al apoyo
    dmens = dm(lpendulo,lcadena,un) #distancia entre ménsulas = 0 en coplanar horiz
    dconds = dcond(k,fmax,lcadena,un) #distancia entre conductores
      
    hmi = hl + fmax + lcadena + lpendulo #suma altura libre + flecha + cadena + pendulo
    hms = hmi
             
    hmm = (hms + hmi) / 2
    hci = hmi - lpendulo - lcadena
    hcm = hmm - lpendulo - lcadena
    hcs = hms - lpendulo - lcadena
             
    lposte = (hms + 0.08) / 0.9 #en coplanar es la altura de la mensula + 10% de empotr
    empot = 0.1 * lposte #10% de empotrado
    lmensula = 
      case tramo.ttramo_id
        when 1,3,4,5  #cálculo de arranque, terminal, retensión, alineación
          dcond(k,fmax,lcadena,un)
        when 2 #desvio 
          dcond(k,fmax,lcadena,un) / Math.sin(tramo.angulo * Math::PI/180/2)
      end
    lcruceta = lmensula * 2            

    hcpr = 0 # en coplanar no hay cable de protección

  end

  def guarda_dim(tramo_id, lcadena, lpendulo, k, hl, fmax, dmens, dconds, hmi, hmm, hms, hci, hcm, hcs, hcpr, lmensula, lcruceta, lposte, empot)
    d = Dimgeom.new
    d.tramo_id = tramo_id
    d.lcadena = lcadena
    d.lpendulo = lpendulo
    d.k = k
    d.hl = hl
    d.fmax = fmax
    d.dmens = dmens
    d.dconds = dconds
    d.hmi = hmi
    d.hmm = hmm
    d.hms = hms
    d.hci = hci
    d.hcm = hcm
    d.hcs = hcs
    d.hcpr = hcpr
    d.lmensula = lmensula
    d.lcruceta = lcruceta
    d.lposte = lposte
    d.empot = empot
    d.save
  end
  
  def dmin(lcadena,ang,un,dapoyo)
      return lcadena * Math.sin(ang / 180 * Math::PI) + dt1(un) + dapoyo/2 + 0.02      
  end

  def dm(lpend,lcadena,un)   #distancia entre ménsulas
    if (un <132)
      return lpend + lcadena + dt1(un)
    else 
      return lpend + lcadena + 1.26
    end
  end

  def dcond(k,flecha,lcadena,un)
    return k * Math.sqrt(flecha+lcadena) + dt1(un)      
  end

  def dt1(un)
    return un / 150
  end
  
  def hcp(hcs, lm, lmcp)
    d = (2.0 * hcs + Math.sqrt(3.0) * (lm - lmcp) + Math.sqrt(hcs ** 2.0 + 4.0 * Math.sqrt(3.0) * (lm - lmcp) * hcs))/3.0
    
    puts 'hcp return: ', hcs.to_s, lm.to_s, lmcp.to_s, d.to_d
    
    return d 
    #
  end

end
