#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

def list_checks
  Intrigue::Ident::CheckFactory.checks.map{|x| x.new.generate("x") }.flatten
end

list_checks.sort_by{|c| "#{c[:vendor]}"}.each {|c| puts " - #{c[:vendor]} #{c[:product]}"}
