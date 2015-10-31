class CreateZonas < ActiveRecord::Migration
  def change
    create_table :zonas do |t|
      t.string :nombre
      t.references :estado
      t.timestamps null: false
    end
  end
end
