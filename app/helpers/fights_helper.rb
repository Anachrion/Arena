module FightsHelper

  def opponent (fight, fighter)
    (fight.fighters.first.id != fighter.id) ? fight.fighters.first : fight.fighters.last
  end

end
