class CreateCadenas < ActiveRecord::Migration
  def change
    create_table :cadenas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
