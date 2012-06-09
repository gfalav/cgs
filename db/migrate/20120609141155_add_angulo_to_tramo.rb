class AddAnguloToTramo < ActiveRecord::Migration
  def change
    add_column :tramos, :angulo, :decimal
  end
end
