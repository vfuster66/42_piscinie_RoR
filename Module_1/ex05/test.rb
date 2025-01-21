#!/usr/bin/env ruby
# test_whereto.rb - Test du script whereto.rb

def run_test(description, command, expected_output)
    puts "=== #{description} ==="
    puts "Commande exécutée : #{command}"
    output = `#{command}`.strip
    puts "Résultat attendu  : #{expected_output}"
    puts "Résultat obtenu   : #{output}"
    if output == expected_output
      puts "✅ Test réussi"
    else
      puts "❌ Test échoué"
    end
    puts
  end
  
  script = "./whereto.rb"
  
  # Tests
  run_test("Test 1 : Cas valide avec plusieurs mots",
           "#{script} \"Salem , ,Alabama, Toto , ,MontGOmery\"",
           "Salem is the capital of Oregon (akr: OR)\nMontgomery is the capital of Alabama (akr: AL)\nToto is neither a capital city nor a state\nMontgomery is the capital of Alabama (akr: AL)")
  
  run_test("Test 2 : Aucun argument",
           "#{script}",
           "")
  
  run_test("Test 3 : Trop de paramètres",
           "#{script} \"Salem\" \"Montgomery\"",
           "")
  
  run_test("Test 4 : Cas invalide avec `,,`",
           "#{script} \"Salem,,Alabama\"",
           "")
  
  run_test("Test 5 : Cas simple, capitale valide",
           "#{script} \"Denver\"",
           "Denver is the capital of Colorado (akr: CO)")