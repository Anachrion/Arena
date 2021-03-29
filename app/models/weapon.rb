class Weapon < ApplicationRecord
  has_one_attached :image
  before_destroy :destroy_related_fights

  def destroy_related_fights
    Fight.where(first_fighter_weapon: id).or(Fight.where(second_fighter_weapon: id)).destroy_all
  end

end
