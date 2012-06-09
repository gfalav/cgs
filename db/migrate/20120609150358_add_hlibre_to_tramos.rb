class AddHlibreToTramos < ActiveRecord::Migration
  def change
    add_column :tramos, :hlibre, :decimal
  end
end
