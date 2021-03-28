class CreateFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fighters do |t|
      t.string :name
      t.text :description
      t.integer :hit_points, default: 0
      t.integer :strength, default: 0
      t.integer :precision, default: 0

      t.timestamps
    end
  end
end
