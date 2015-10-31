class CreateEdads < ActiveRecord::Migration
  def change
    create_table :edads do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
