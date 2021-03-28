class Fight < ApplicationRecord
  has_and_belongs_to_many :fighters
  has_many :actions, -> { order(:id) }, dependent: :destroy
  belongs_to :winner, :class_name => 'Fighter', optional: true

  validates :fighters, length: { is: 2 }
  # TODO validates not twice the same fighter

  before_create :execute

  def execute
    players = [
      { hp: fighters.first.hit_points, fighter: fighters.first },
      { hp: fighters.last.hit_points, fighter: fighters.last }
    ]

    turn = 1
    until players.any? { |p| p[:hp].zero? }
      defender = players[turn%2]
      assaillant = players[(turn+1)%2]

      hit_roll = rand(1..100)
      damage = hit_roll <= assaillant[:fighter].precision ? assaillant[:fighter].strength : 0
      defender[:hp] = damage < defender[:hp] ? defender[:hp] - damage : 0

      actions.create!(
        turn: turn,
        defender_id: defender[:fighter].id,
        assaillant_id: assaillant[:fighter].id,
        hit_roll: hit_roll,
        damage:  damage,
        defender_hp_left: defender[:hp]
      )
      turn += 1
    end

    self.winner_id = assaillant[:fighter].id
  end
end
