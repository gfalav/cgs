class CreateCalcmecanicos < ActiveRecord::Migration
  def change
    create_table :calcmecanicos do |t|
      t.integer :vano_id
      t.integer :condclima_id
      t.decimal :tension
      t.decimal :tiro
      t.decimal :flecha_t
      t.decimal :flecha_v
      t.decimal :flecha_h
      t.integer :conductor_id
      t.decimal :temp
      t.decimal :viento
      t.decimal :hielo

      t.timestamps
    end
  end
end
