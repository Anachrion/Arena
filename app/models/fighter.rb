class Fighter < ApplicationRecord
  has_and_belongs_to_many :fights
  has_one_attached :image

  validates :name, :hit_points, :strength, :level,:precision, presence: true

end
