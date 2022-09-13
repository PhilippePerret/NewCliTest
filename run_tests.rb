#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'lib/required'

if ARGV[0] && File.exist?(ARGV[0])
  pth = ARGV[0]
elsif ['-h','--help','help','aide'].include?(ARGV[0])
  NewCliTest.open_manuel
  return
else
  pth = File.expand_path('.')
end

Dir.chdir(pth) do
  NewCliTest.run
end
