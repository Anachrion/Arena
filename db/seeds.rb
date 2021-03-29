# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

fighter_list = [
  {
    name: "Fox McCloud",
    description: "Un renard de l'espace, originaire de la série de jeux vidéo Star Fox de Nintendo. Il est le meneur de l’unité de mercenaires d'élite Star Fox et c'est un pilote d'élite.",
    strength: 5,
    precision: 50,
    hit_points: 8,
    image_path: "fox.jpg"
  },
  {
    name: "Link",
    description: "Héros Hylien de la triforce, originaire de la série de jeux vidéo The legend of Zelda de Nintendo. Se bat avec une épée et un bouclier. A la capacité de voyager à travers le temps en s'affranchissant du principe de causalité et évitant ainsi les paradoxes temporels.",
    strength: 5,
    precision: 45,
    hit_points: 10,
    image_path: "link.png"
  },
  {
    name: "Samus Aran",
    description: "Protagoniste de la série de jeux vidéo de science fiction Metroid. Samus Aran est une ex-soldat de la Fédération galactique devenue une chasseuse de primes intergalactique, généralement équipée d'une armure motorisée avec des armes qui incluent des armes à énergie dirigée et des missiles, ainsi que la capacité à prendre la forme d'une boule, la morphing ball",
    strength: 4,
    precision: 65,
    hit_points: 10,
    image_path: "samus.png"
  },
  {
    name: "Ganondorf",
    description: "Antagoniste principal de la série de jeux vidéo The legend of Zelda. Au même titre que Link, Ganondorf est l'un des détenteurs de la Triforce (de la force).",
    strength: 8,
    precision: 35,
    hit_points: 20,
    image_path: "ganondorf.png"
  },
  {
    name: "Bowser",
    description: "Reptile anthropomorphe et principal antagoniste de la série Super Mario. Roi des Koopas, ennemis récurrents de la série, il possède des écailles jaunes, une épaisse carapace verte munie de piques, de grosses griffes, des cornes ainsi qu'une crête et de larges sourcils rouges.",
    strength: 10,
    precision: 20,
    hit_points: 25,
    image_path: "bowser.png"
  }
]

fighter_list.each do |fighter_params|
  image_path = fighter_params.delete(:image_path)
  fighter = Fighter.new(fighter_params)
  path = Rails.root.join('app', 'assets', 'images', image_path)
  fighter.image.attach(io: File.open(path), filename: 'test1.png')
  fighter.save!
end

weapon_list = [
  {
    name: "Soul Calibur",
    description: "Une épée légendaire qui peut boire l'âme de ses victimes.",
    precision_modifier: 8,
    damage_modifier: 5,
    image_path: "soul-calibur.png"
  },
  {
    name: "Lance de Longin",
    description: "Une lance très ancienne.",
    precision_modifier: 15,
    damage_modifier: 2,
    image_path: "longuinus-spear.png"
  },
  {
    name: "Master Sword",
    description: "Une épée Hyliène, supposée incassable.",
    precision_modifier: 5,
    damage_modifier: 5,
    image_path: "master-sword.jpg"
  },
  {
    name: "Dragon Slayer",
    description: "Cette épée gigantesque est capable de couper un cheval en deux.",
    precision_modifier: -10,
    damage_modifier: 10,
    image_path: "dragon_slayer.jpg"
  }
]

weapon_list.each do |weapon_params|
  image_path = weapon_params.delete(:image_path)
  weapon = Weapon.new(weapon_params)
  path = Rails.root.join('app', 'assets', 'images', image_path)
  weapon.image.attach(io: File.open(path), filename: 'test1.png')
  weapon.save!
end

fight = Fight.new(
  name: 'Le combat des titans',
  description: 'Une description',
  first_fighter_weapon: Weapon.find_by(name: 'Dragon Slayer')
)
fight.fighters << Fighter.find_by(name: 'Ganondorf')
fight.fighters << Fighter.find_by(name: 'Bowser')
fight.save!


fight = Fight.new(
  name: 'Duel à mort',
  description: 'Une description',
  first_fighter_weapon: Weapon.find_by(name: 'Master Sword'),
  second_fighter_weapon: Weapon.find_by(name: 'Lance de Longin')
)
fight.fighters << Fighter.find_by(name: 'Link')
fight.fighters << Fighter.find_by(name: 'Samus Aran')
fight.save!

fight = Fight.new(
  name: 'Bataille au sommet',
  description: 'Une description',
  first_fighter_weapon: Weapon.find_by(name: 'Soul Calibur'),
  second_fighter_weapon: Weapon.find_by(name: 'Lance de Longin')
)
fight.fighters << Fighter.find_by(name: 'Bowser')
fight.fighters << Fighter.find_by(name: 'Link')
fight.save!
