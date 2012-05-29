class CreateReltramovanos < ActiveRecord::Migration
  def change
    create_table :reltramovanos do |t|
      t.integer :tramo_id
      t.integer :vano_id
      t.decimal :angulo

      t.timestamps
    end
  end
end
