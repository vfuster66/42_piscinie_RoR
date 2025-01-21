#!/usr/bin/env ruby
# test_erehW.rb - Test du script erehW.rb

def run_test(description, command, expected_output)
    puts "=== #{description} ==="
    puts "Commande exécutée : #{command}"
    output = `#{command}`.strip
    puts "Résultat attendu  : #{expected_output.inspect}"
    puts "Résultat obtenu   : #{output.inspect}"
  
    if output == expected_output
      puts "✅ Test réussi"
    else
      puts "❌ Test échoué"
    end
    puts
  end
  
  script = "./erehW.rb"
  
  # Tests
  run_test("Test 1 : Capitale valide", "#{script} Salem", "Oregon")
  run_test("Test 2 : Capitale invalide", "#{script} toto", "Unknown capital city")
  run_test("Test 3 : Aucun argument", "#{script}", "")
  run_test("Test 4 : Trop d'arguments", "#{script} Salem Montgomery", "")
  run_test("Test 5 : Autre capitale valide", "#{script} Montgomery", "Alabama")
  