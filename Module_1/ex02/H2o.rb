#!/usr/bin/env ruby
# H2o.rb - Exercice 02 : Hashment bien

def process_data
  # Déclaration du tableau data
  data = [
    ["Caleb", 24],
    ["Calixte", 84],
    ["Calliste", 65],
    ["Calvin", 12],
    ["Cameron", 54],
    ["Camil", 32],
    ["Camille", 5],
    ["Can", 52],
    ["Caner", 56],
    ["Cantin", 4],
    ["Carl", 1],
    ["Carlito", 23],
    ["Carlo", 19],
    ["Carlos", 26],
    ["Carter", 54],
    ["Casey", 2]
  ]

  # Transformation en hash
  hash = {}
  data.each do |name, number|
    # Ajout dans le hash
    hash[number] ||= [] # Initialise un tableau vide pour gérer les doublons
    hash[number] << name
  end

  # Affichage du hash
  hash.each do |key, values|
    values.each do |value|
      puts "#{key} : #{value}"
    end
  end
end

# Appel de la fonction principale
process_data
