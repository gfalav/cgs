class AddHlibreToProyectos < ActiveRecord::Migration
  def change
    add_column :proyectos, :hlibre, :decimal
  end
end
