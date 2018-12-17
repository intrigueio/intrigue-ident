#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/intrigue-ident'

###
### Define the prompt & drop into pry repl
###
Pry.start(self, :prompt => [proc{"ident>"}])