class Fight < ApplicationRecord
  has_and_belongs_to_many :fighters
  has_many :actions, -> { order(:id) }, dependent: :destroy
  belongs_to :winner, :class_name => 'Fighter', optional: true

  belongs_to :first_fighter_weapon, :class_name => 'Weapon', optional: true
  belongs_to :second_fighter_weapon, :class_name => 'Weapon', optional: true

  belongs_to :winner, :class_name => 'Fighter', optional: true

  validates :name, presence: true
  validates :fighters, length: { is: 2 }

  before_create :execute

  def execute
    players = [
      FighterDecorator.new(fighters.first, first_fighter_weapon),
      FighterDecorator.new(fighters.last, second_fighter_weapon)
    ]

    turn = 1
    until players.any? { |p| p.remaining_hp.zero? }
      defender = players[turn%2]
      assaillant = players[(turn+1)%2]

      hit_roll = rand(1..100)
      has_hit = hit_roll <= assaillant.precision
      damage_range = has_hit ? assaillant.damage_range : 0
      damage = rand(0..damage_range)
      defender.remaining_hp = (damage < defender.remaining_hp) ? defender.remaining_hp - damage : 0

      actions.build(
        turn: turn,
        defender_id: defender.id,
        assaillant_id: assaillant.id,
        assaillant_precision: assaillant.precision,
        hit_roll: hit_roll,
        damage:  damage,
        defender_hp_left: defender.remaining_hp
      )
      turn += 1
    end

    self.winner_id = assaillant.id
    self.winner.level += 1
    self.winner.save!
  end


  class FighterDecorator < SimpleDelegator
    attr_accessor :remaining_hp
    attr_accessor :fighter

    def initialize(fighter, weapon)
      super fighter
      @remaining_hp = fighter.hit_points
      @weapon = weapon
    end

    def bonus_level
      level-1
    end

    def precision
      super*(10+bonus_level)/10 + (@weapon.present? ? @weapon.precision_modifier : 0)
    end

    def damage_range
      strength*(10+bonus_level)/10 + (@weapon.present? ? @weapon.damage_modifier : 0)
    end
  end
end
