class CreateDimgeoms < ActiveRecord::Migration
  def change
    create_table :dimgeoms do |t|
      t.integer :tramo_id
      t.decimal :lcadena
      t.decimal :lpendulo
      t.decimal :k
      t.decimal :hl
      t.decimal :fmax
      t.decimal :dmens
      t.decimal :dconds
      t.decimal :hmi
      t.decimal :hmm
      t.decimal :hms
      t.decimal :hci
      t.decimal :hcm
      t.decimal :hcs
      t.decimal :hcpr
      t.decimal :lmensula
      t.decimal :lcruceta
      t.decimal :lposte
      t.decimal :empot

      t.timestamps
    end
  end
end
