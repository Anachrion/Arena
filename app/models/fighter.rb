class Fighter < ApplicationRecord
  has_and_belongs_to_many :fights, dependent: :destroy
  has_one_attached :image

  validates :name, :hit_points, :strength, :level,:precision, presence: true

  before_destroy :destroy_related_fights

  def destroy_related_fights
    fights.destroy_all
    # Fight.where(winner_id: id).destroy_all
  end
end
