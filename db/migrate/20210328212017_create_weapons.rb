class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.text :description
      t.integer :precision_modifier, default: 0
      t.integer :damage_modifier, default: 0

      t.timestamps
    end

    add_reference :fights, :first_fighter_weapon, index: true, foreign_key: { to_table: :weapons }
    add_reference :fights, :second_fighter_weapon, index: true, foreign_key: { to_table: :weapons }
  end
end
