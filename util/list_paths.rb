#!/usr/bin/env ruby
require_relative "../lib/ident"
include Intrigue::Ident

def list_checks
  Intrigue::Ident::Http::CheckFactory.checks.map{|x| x.new.generate_checks("[uri]") }.flatten
  #Intrigue::Ident::Ftp::CheckFactory.checks.map{|x| x.new.generate_checks.flatten
  #Intrigue::Ident::Smtp::CheckFactory.checks.map{|x| x.new.generate_checks.flatten
  #Intrigue::Ident::Snmp::CheckFactory.checks.map{|x| x.new.generate_checks.flatten
end

puts list_checks.map{|c| c[:paths] }.flatten.sort.uniq