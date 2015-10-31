class CreateImpactos < ActiveRecord::Migration
  def change
    create_table :impactos do |t|
      t.references :punto
      t.references :genero
      t.references :nse
      t.references :edad
      t.timestamps null: false
    end
  end
end
