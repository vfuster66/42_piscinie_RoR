#!/usr/bin/env ruby
# erehW.rb - Exercice 04 : Backward

def find_state_by_capital(capital_name)
    # Déclare les hashs
    states = {
      "Oregon" => "OR",
      "Alabama" => "AL",
      "New Jersey" => "NJ",
      "Colorado" => "CO"
    }
  
    capitals_cities = {
      "OR" => "Salem",
      "AL" => "Montgomery",
      "NJ" => "Trenton",
      "CO" => "Denver"
    }
  
    # Inverse capitals_cities pour avoir les capitales comme clés
    inverted_capitals = capitals_cities.invert
  
    # Trouve l'abréviation de l'État
    state_code = inverted_capitals[capital_name]
  
    # Retourne le nom de l'État ou un message d'erreur
    states.key(state_code) || "Unknown capital city"
  end
  
  # Vérifie les arguments
  if ARGV.length == 1
    puts find_state_by_capital(ARGV[0])
  end
  