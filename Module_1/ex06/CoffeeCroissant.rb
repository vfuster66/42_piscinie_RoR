#!/usr/bin/env ruby
# CoffeeCroissant.rb

# Définition des données
data = [
  ['Frank', 33],
  ['Stacy', 15],
  ['Juan', 24],
  ['Dom', 32],
  ['Steve', 24],
  ['Jill', 24]
]

# Tri du tableau :
# 1. Par âge croissant (premier critère)
# 2. Par ordre alphabétique des noms quand les âges sont égaux (second critère)
sorted_data = data.sort_by { |person| [person[1], person[0]] }

# Affichage des noms uniquement
sorted_data.each { |person| puts person[0] }