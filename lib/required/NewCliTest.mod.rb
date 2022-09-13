# encoding: UTF-8

module NewCliTest

  # Raccourci pour lancer les tests
  def self.run
    # puts "-> NewCliTest::run"
    clear
    load_tests
    Test.run
  end

  ##
  # Méthode qui permet de charger tous les tests
  def self.load_tests
    Dir["./tests/clitests/**/*.rb"].each do |m| 
      begin
        require m
      rescue Exception => e
        puts "Un problème est survenu avec le module #{m} : #{e.message}".rouge
        # puts e.backtrace.join("\n").rouge
      end
    end
  end

  ##
  # Ouverture du manuel
  def self.open_manuel
    pth = File.join(APP_FOLDER,'Manuel','Manuel.pdf')
    `open "#{pth}"`
  end

end #/module NewCliTest
