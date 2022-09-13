# encoding: UTF-8
require 'json'

APP_FOLDER = File.dirname(__dir__)

# Requérir tous les modules du dossier 'required'
Dir["#{__dir__}/required/**/*.rb"].each{|m|require(m)}
