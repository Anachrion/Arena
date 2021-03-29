module FightersHelper

  def victory_rate fighter
    fighter.fights.select{ |f| f.winner_id == fighter.id }.count.to_f / fighter.fights.count.to_f * 100
  end

end
