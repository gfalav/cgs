class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :proyecto
      t.string :desc
      t.string :comitente
      t.string :constructor
      t.string :proyectista
      t.date :fproyecto
      t.string :ubicacion
      t.string :expediente
      t.integer :cond_e_id
      t.integer :cond_g_id
      t.integer :zona_id
      t.integer :tconstr_id
      t.decimal :vanomax
      t.decimal :dretmax

      t.timestamps
    end
  end
end
