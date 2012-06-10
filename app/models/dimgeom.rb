class Dimgeom < ActiveRecord::Base
  attr_accessible :dconds, :dmens, :empot, :fmax, :hci, :hcm, :hcpr, :hcs, :hl, :hmi, :hmm, :hms, :k, :lcadena, :lcruceta, :lmensula, :lpendulo, :lposte, :tramo_id
  
  belongs_to :tramo
  
end
