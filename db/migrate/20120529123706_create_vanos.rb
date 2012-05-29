class CreateVanos < ActiveRecord::Migration
  def change
    create_table :vanos do |t|
      t.integer :proyecto_id
      t.string :nombre
      t.decimal :vano
      t.integer :cond_e_id
      t.integer :cond_g_id
      t.decimal :tiromax_e
      t.decimal :flechamax_e
      t.decimal :tma_e
      t.decimal :tiromax_g
      t.decimal :flechamax_g
      t.decimal :tma_g

      t.timestamps
    end
  end
end
