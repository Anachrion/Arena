class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.string :name
      t.text :description
      t.references :winner, index: true, foreign_key: { to_table: :fighters }
      t.timestamps
    end
  end

  create_join_table :fights, :fighters do |t|
    t.index :fight_id
    t.index :fighter_id
  end
end
