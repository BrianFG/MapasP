class CreatePuntos < ActiveRecord::Migration
  def change
    create_table :puntos do |t|
      t.string :nombre
      t.text :direccion
      t.float :lat
      t.float :lng
      t.integer :dotacion
      t.references :subzona
      t.references :relacion
      t.timestamps null: false
    end
  end
end
