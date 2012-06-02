class CreateTconstrs < ActiveRecord::Migration
  def change
    create_table :tconstrs do |t|
      t.string :tipo

      t.timestamps
    end
    
    Tconstr.create(:tipo=>'13,2kV - Coplanar Horizontal - Todo Madera')
    Tconstr.create(:tipo=>'13,2kV - Coplanar Horizontal - Esp H°A°')
    Tconstr.create(:tipo=>'13,2kV - Coplanar Horizontal - Todo H°A°')
    Tconstr.create(:tipo=>'13,2kV - Line Post - H°A°')
    Tconstr.create(:tipo=>'33kV - Canadiense - Esp H°A°')
    Tconstr.create(:tipo=>'33kV - Canadiense - Todo H°A°')
    Tconstr.create(:tipo=>'33kV - Line Post - H°A°')
    Tconstr.create(:tipo=>'BT - Preensamblado - Todo Madera')
    Tconstr.create(:tipo=>'BT - Preensamblado - Esp H°A°')
    Tconstr.create(:tipo=>'BT - Preensamblado - Todo H°A°')
    Tconstr.create(:tipo=>'SETA Monoposte')
    Tconstr.create(:tipo=>'SETA Biposte')
    Tconstr.create(:tipo=>'SETA A - Madera')
  end
end
