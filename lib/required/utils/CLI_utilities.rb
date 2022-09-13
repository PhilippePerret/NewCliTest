# encoding: UTF-8
=begin

  CLI_utilities
  --------------
  Utilitaires pour les applications en ligne de commande.

  version 1.2
  (historique de version en bas de fichier)

=end


# Pour nettoyer la console
def clear
  puts "\n" # pour certaines méthodes
  puts "\033c"
end

# True si mode verbeux
def verbose?
  :TRUE == @isverbose ||= true_or_false(cli?('-v') || cli?('--verbose'))
end

def debug?
  :TRUE == @isdebug ||= true_or_false(cli?('--debug'))
end

# True si mode test
def test?
  :TRUE == @ismodetest ||= true_or_false((defined?(MODE_TEST) && MODE_TEST) || ENV['MODE_CLI_TEST'] || cli?('--test'))
end

def test_integration?
  :TRUE == @isintegrationtests ||= true_or_false(ENV['MODE_CLI_TEST'] == true)
end

##
# Retourne true si la ligne de commande contient exactement +str+
#
def cli?(str)
  ARGV.include?(str)
end


def help?
  cli?('help') || cli?('-h') || cli?('--help') || cli?('--aide') || cli?('aide')
end


def path_exists_or_raise(path, what = "fichier", solution = nil)
  unless File.exists?(path)
    log("Le #{what} '#{path}' est inconnu… #{solution||''}\n\n", :rouge, true)
    exit 1
  end
  return path # pour l'utiliser en fin de méthode
end

def true_or_false(value)
   value ? :TRUE : :FALSE
end

##
# Pour l'exécution d'une opération dans un bloc, avec un message
# en bleu pendant l'opération puis un message en vert à la fin
# de l'opération.
# @return  {String} Résultat de l'opération
#
def proceed_with_message(msg, &block)
  if CONFIG.cron?
    # --- Par le cron ---
    res = yield
    log(msg)
  else
    # --- hors cron ---
    STDOUT.write "#{msg}…".bleu
    res = yield
    puts "\r#{msg.vert}    "
  end
  return res
end

##
# Pour afficher une notification
#
def notify(msg, title = "")
  cmd = <<-CMD
osascript -e 'display notification "#{msg}" with title "#{title}" sound name "Frog"'
CMD
  `#{cmd}`
end

=begin

  Historique des versions
  ------------------------

  1.2
    Version pour application CLI avec test d'intégration
  
  1.1 
    Première version pour les applications CLI avec tests unitaire

=end
