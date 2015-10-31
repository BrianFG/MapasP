class CreateRelacions < ActiveRecord::Migration
  def change
    create_table :relacions do |t|
      t.references :tipo
      t.references :categoria
      t.references :cadena
      t.timestamps null: false
    end
  end
end
