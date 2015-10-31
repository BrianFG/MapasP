class CreateSubzonas < ActiveRecord::Migration
  def change
    create_table :subzonas do |t|
      t.string :nombre
      t.references :zona
      t.timestamps null: false
    end
  end
end
