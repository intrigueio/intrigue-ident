#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

def list_checks
  Intrigue::Ident::CheckFactory.checks.map{|x| x.new.generate_checks("[uri]") }.flatten
end

list_checks.sort_by{|c| "#{c[:type]}" }.each {|c| puts " - #{c[:type]} ... #{c[:name]} #{c[:vendor]} #{c[:product]} #{c[:version]} (Version detection: #{!c[:dynamic_version].nil?}) #{c[:paths]}"}
