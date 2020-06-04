#!/usr/bin/env ruby

require 'net/http'
require 'openssl'
require 'zlib'

# load in generic utils
require_relative 'utils'
require_relative 'version'

# integrate recog
require_relative 'recog'

###
### Start protocol requires 
###

##################################
# Load in http matchers and checks
###################################
require_relative 'http/matchers'
include Intrigue::Ident::Http::Matchers

require_relative 'http/check_factory'
require_relative '../checks/http/base'

# http fingerprints
check_folder = File.expand_path('../checks/http', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# http content checks (always run)
content_check_folder = File.expand_path('../checks/http/content', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

# http content, wordpress specific checks
content_check_folder = File.expand_path('../checks/http/wordpress', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

# General helpers (apply widely across protocols)

require_relative 'simple_socket'
require_relative 'banner_helpers'

##################################
# Load in ftp matchers and checks
#################################
require_relative 'ftp/matchers'
include Intrigue::Ident::Ftp::Matchers

require_relative 'ftp/check_factory'
require_relative '../checks/ftp/base'

# ftp fingerprints
check_folder = File.expand_path('../checks/ftp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in smtp matchers and checks
##################################
require_relative 'smtp/matchers'
include Intrigue::Ident::Smtp::Matchers

require_relative 'smtp/check_factory'
require_relative '../checks/smtp/base'

# smtp fingerprints
check_folder = File.expand_path('../checks/smtp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in snmp matchers and checks
##################################
require_relative 'snmp/matchers'
include Intrigue::Ident::Snmp::Matchers

require_relative 'snmp/check_factory'
require_relative '../checks/snmp/base'

# snmp fingerprints
check_folder = File.expand_path('../checks/snmp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }


##################################
# Load in ssh matchers and checks
##################################
require_relative 'ssh/matchers'
include Intrigue::Ident::Ssh::Matchers

require_relative 'ssh/check_factory'
require_relative '../checks/ssh/base'

# ssh fingerprints
check_folder = File.expand_path('../checks/ssh', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in telnet matchers and checks
##################################
require_relative 'telnet/matchers'
include Intrigue::Ident::Telnet::Matchers

require_relative 'telnet/check_factory'
require_relative '../checks/telnet/base'

# telnet fingerprints
check_folder = File.expand_path('../checks/telnet', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

###
### End protocol requires 
###

# Load vulndb client 
require_relative "vulndb_client"

# set default encoding
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8


# set a base directory so we can use in checks 
$ident_dir = File.expand_path('../', File.dirname(__FILE__))

module Intrigue
  module Ident

    private

    def _construct_match_response(check, data)

      if check[:type] == "fingerprint"
        calculated_version = (check[:dynamic_version].call(data) if check[:dynamic_version]) || check[:version] || ""
        calculated_update = (check[:dynamic_update].call(data) if check[:dynamic_update]) || check[:update] || ""

        calculated_type = "a" if check[:category] == "application"
        calculated_type = "h" if check[:category] == "hardware"
        calculated_type = "o" if check[:category] == "operating_system"
        calculated_type = "s" if check[:category] == "service" # literally made up

        vendor_string = check[:vendor].gsub(" ","_") if check[:vendor]
        product_string = check[:product].gsub(" ","_") if check[:product]

        version = "#{calculated_version}".gsub(" ","_")
        update = "#{calculated_update}".gsub(" ","_")

        cpe_string = "cpe:2.3:#{calculated_type}:#{vendor_string}:#{product_string}:#{version}:#{update}".downcase

        ##
        ## Support for Dynamic 
        ##
        if check[:dynamic_issue]
          issue = check[:dynamic_issue].call(data)
        elsif check[:issue]
          issue = check[:issue]
        else
          issue = nil
        end
        
        ##
        ## Support for Dynamic Hide
        ##
        if check[:dynamic_hide]
          hide = check[:dynamic_hide].call(data)
        elsif check[:hide]
          hide = check[:hide]
        else
          hide = false
        end

        ##
        ## Support for Dynamic Task
        ##
        if check[:dynamic_task]
          task = check[:dynamic_task].call(data)
        elsif check[:task]
          task = check[:task]
        else
          task = nil
        end

        to_return = {
          "method" => "ident",
          "type" => check[:type],
          "vendor" => check[:vendor],
          "product" => check[:product],
          "version" => calculated_version,
          "update" => calculated_update,
          "tags" => check[:tags],
          "match_type" => check[:match_type],
          "match_details" => check[:match_details],
          "hide" => hide,
          "cpe" => cpe_string,
          "issue" => issue, 
          "task" => task, # [{ :task_name => "example", :task_options => {}}]
          "inference" => check[:inference]
        }

      elsif check[:type] == "content"

        # Mandatory lambda
        result = check[:dynamic_result].call(data)

        ##
        ## Support for Dynamic Issue (must be dynamic, these checks always run)
        ##
        if result
        
          ##
          ## Support for Dynamic 
          ##
          if check[:dynamic_issue]
            issue = check[:dynamic_issue].call(data)
          elsif check[:issue]
            issue = check[:issue]
          else
            issue = nil
          end
          
          ##
          ## Support for Dynamic Hide
          ##
          if check[:dynamic_hide]
            hide = check[:dynamic_hide].call(data)
          elsif check[:hide]
            hide = check[:hide]
          else
            hide = false
          end

          ##
          ## Support for Dynamic Task
          ##
          if check[:dynamic_task]
            task = check[:dynamic_task].call(data)
          elsif check[:task]
            task = check[:task]
          else
            task = nil
          end

        end

        to_return = {
          "type" => check[:type],
          "name" => check[:name],
          "hide" => hide,
          "issue" => issue,
          "task" => task,
          "result" => result
        }
      end

    to_return
    end

end
end



# always include 
include Intrigue::Ident
