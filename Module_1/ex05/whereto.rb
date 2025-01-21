#!/usr/bin/env ruby
# whereto.rb - Exercice 05 : Hal

def process_input(input)
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
  
    # Vérifie les cas invalides
    return if input.include?(",,")
  
    # Analyse les mots, en ignorant les espaces et en insensibilité à la casse
    words = input.split(",").map(&:strip).reject(&:empty?)
    
    # Stocker les résultats
    results = []
  
    # Traite chaque mot
    words.each do |word|
      normalized_word = word.downcase
      
      # Vérifie si le mot est une capitale
      state_code = capitals_cities.find { |_k, v| v.downcase == normalized_word }&.first
      if state_code
        state_name = states.key(state_code)
        capital = capitals_cities[state_code]
        results << "#{capital} is the capital of #{state_name} (akr: #{state_code})"
        next
      end
  
      # Vérifie si le mot est un État
      state_code = states.find { |k, v| k.downcase == normalized_word }&.last
      if state_code
        capital = capitals_cities[state_code]
        state_name = states.key(state_code)
        results << "#{capital} is the capital of #{state_name} (akr: #{state_code})"
        next
      end
  
      # Aucun des deux
      results << "#{word} is neither a capital city nor a state"
    end
  
    # Affiche les résultats (sans uniq)
    results.each { |result| puts result }
  end
  
  # Vérifie les arguments
  if ARGV.length == 1
    process_input(ARGV[0])
  end