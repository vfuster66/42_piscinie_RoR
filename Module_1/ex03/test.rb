#!/usr/bin/env ruby
# test_where.rb - Test du script Where.rb

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
  
  script = "./Where.rb"
  
  # Tests
  run_test("Test 1 : État valide", "#{script} Oregon", "Salem")
  run_test("Test 2 : État invalide", "#{script} toto", "Unknown state")
  run_test("Test 3 : Aucun argument", "#{script}", "")
  run_test("Test 4 : Trop d'arguments", "#{script} Oregon Alabama", "")
  run_test("Test 5 : État valide différent", "#{script} Alabama", "Montgomery")
  