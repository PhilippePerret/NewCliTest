#!/usr/bin/env ruby
# encoding: UTF-8
=begin
  L'exécutable de l'application exemple
=end
begin
  require_relative 'lib/required'
  WhatsYourName.ask_for_user_name.say_hello
rescue CLiTestNoMoreValuesError => e
  exit 100  
rescue Exception => e
  puts "Un problème est suvenu : #{e.message}".rouge
  puts e.backtrace.join("\n").rouge
end
