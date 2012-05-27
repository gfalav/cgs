class CreateZonas < ActiveRecord::Migration
  def change
    create_table :zonas do |t|
      t.string :nombre

      t.timestamps
    end
    
    Zona.create(:nombre=>'Zona A')
    Zona.create(:nombre=>'Zona B')
    Zona.create(:nombre=>'Zona C')
    Zona.create(:nombre=>'Zona D')
    Zona.create(:nombre=>'Zona E')
    Zona.create(:nombre=>'Zona Espanola B')
  end
end
