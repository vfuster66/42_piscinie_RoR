#!/usr/bin/env ruby
# var.rb - Exercice 00 : Classe Pas Classe

def my_var
    # Déclaration et initialisation des variables
    a = 10
    b = "10"
    c = nil
    d = 10.0
  
    # Affichage des variables et de leurs types
    puts "mes variables :"
    puts "a contient : #{a} et est de type: #{a.class}"
    puts "b contient : #{b} et est de type: #{b.class}"
    puts "c contient : #{c.inspect} et est de type: #{c.class}"
    puts "d contient : #{d} et est de type: #{d.class}"
  end
  
  # Appel de la fonction
  my_var
  