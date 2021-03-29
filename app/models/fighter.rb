class Fighter < ApplicationRecord
  has_and_belongs_to_many :fights
  has_one_attached :image

  validates :name, presence: true

end
