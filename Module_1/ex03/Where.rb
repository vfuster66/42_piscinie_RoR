#!/usr/bin/env ruby
# Where.rb - Exercice 03 : Where am I ?

def find_capital(state_name)
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
  
    # Trouve l'abréviation de l'État
    state_code = states[state_name]
  
    # Trouve la capitale si l'abréviation existe
    capital = capitals_cities[state_code]
  
    # Retourne la capitale ou un message d'erreur
    capital || "Unknown state"
  end
  
  # Vérifie les arguments
  if ARGV.length == 1
    puts find_capital(ARGV[0])
  end
  