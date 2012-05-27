class CreatePuntos < ActiveRecord::Migration
  def change
    create_table :puntos do |t|
      t.string :punto
      t.integer :proyecto_id
      t.integer :secuencia
      t.decimal :latitud
      t.decimal :longitud
      t.decimal :distancia
      t.decimal :angulo

      t.timestamps
    end
  end
end
