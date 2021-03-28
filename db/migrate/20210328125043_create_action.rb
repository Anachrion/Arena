class CreateAction < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.references :assaillant, index: true, foreign_key: { to_table: :fighters }
      t.references :defender, index: true, foreign_key: { to_table: :fighters }
      t.references :fight, index: true, foreign_key: true
      t.integer :hit_roll, default: 0
      t.integer :damage, default: 0
      t.integer :turn, default: 0
      t.integer :defender_hp_left
      t.timestamps
    end
  end
end
