#!/usr/bin/env ruby
require_relative "../lib/ident"
ident = Intrigue::Ident::Ident.new
puts ident.list_checks.map{|c| c[:paths] }.flatten.sort.uniq