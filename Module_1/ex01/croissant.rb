#!/usr/bin/env ruby
# croissant.rb - Exercice 01 : Petit Déjeuner

def sort_numbers_from_file(file_path)
    # Vérifie si le fichier existe
    unless File.exist?(file_path)
      puts "Erreur : fichier #{file_path} introuvable."
      exit 1
    end
  
    # Lit le contenu du fichier et transforme en tableau d'entiers
    numbers = File.read(file_path).split(",").map(&:to_i)
  
    # Trie les nombres dans l'ordre croissant
    sorted_numbers = numbers.sort
  
    # Affiche chaque nombre sur une ligne
    sorted_numbers.each { |number| puts number }
  end
  
  # Appel de la fonction avec le fichier numbers.txt
  sort_numbers_from_file("numbers.txt")
  