#!/usr/bin/env ruby

# monkey-patches for core classes
require_relative 'initialize/hash'
require_relative 'initialize/string'

# only necessary for cases of acual checking. if ident is being
# used as a library, we can skip this
begin
  # integrate recog
  require "recog"
  require_relative 'recog_wrapper'

  # favicon checksums
  require 'murmurhash3'
rescue LoadError => e
  # unable to load dependencies, presumable unavailable
  puts "Unable to load dependency, functionality may be limited #{e}"
rescue RuntimeError => e
  # unable to load dependencies, presumable unavailable (Typheous throws a runtime error)
  puts "Unable to load dependency, functionality may be limited #{e}"
end

# only necessary for cases of acual checking. if ident is being
# used as a library, we can skip this
#
# Note that these are separated because they require native code
# not ideal for the library use case.
begin
  # new http request lib
  require 'typhoeus'
  require 'net/http'
  require 'openssl'
  require 'zlib'
  require 'ruby_smb'
rescue LoadError => e
  # unable to load dependencies, presumable unavailable
  puts "Unable to load dependency, functionality may be limited #{e}"
rescue RuntimeError => e
  # unable to load dependencies, presumable unavailable (Typheous throws a runtime error)
  puts "Unable to load dependency, functionality may be limited #{e}"
end



# load in generic utils
require_relative 'utils'
include Intrigue::Ident::Utils

require_relative 'version'

###
### Start protocol-specific deps
###

##################################
# Load in http matchers and checks
###################################
require_relative 'http/http'
require_relative 'http/http_certificate'
require_relative 'http/content'
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

# http content, javascript specific checks
content_check_folder = File.expand_path('../checks/http/javascript', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

# General helpers (apply widely across different protocols)
require_relative 'simple_socket'
require_relative 'banner_helpers'
require_relative 'error_helpers'
require_relative 'mongodb_connection_helper'

##################################
# Load in dns matchers and checks
#################################
require_relative 'dns/matchers'
include Intrigue::Ident::Dns::Matchers

require_relative 'dns/check_factory'
require_relative '../checks/dns/base'

# ftp fingerprints
check_folder = File.expand_path('../checks/dns', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

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
# Load in mysql matchers and checks
#################################
require_relative 'mysql/matchers'
include Intrigue::Ident::Mysql::Matchers

require_relative 'mysql/check_factory'
require_relative '../checks/mysql/base'

# mysql fingerprints
check_folder = File.expand_path('../checks/mysql', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in pop3 matchers and checks
##################################
require_relative 'pop3/matchers'
include Intrigue::Ident::Pop3::Matchers

require_relative 'pop3/check_factory'
require_relative '../checks/pop3/base'

# pop3 fingerprints
check_folder = File.expand_path('../checks/pop3', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in redis matchers and checks
#################################
require_relative 'redis/matchers'
include Intrigue::Ident::Redis::Matchers

require_relative 'redis/check_factory'
require_relative '../checks/redis/base'

# redis fingerprints
check_folder = File.expand_path('../checks/redis', File.dirname(__FILE__)) # get absolute directory
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

##################################
# Load in imap matchers and checks
##################################
require_relative 'imap/matchers'
include Intrigue::Ident::Imap::Matchers

require_relative 'imap/check_factory'
require_relative '../checks/imap/base'

# imap fingerprints
check_folder = File.expand_path('../checks/imap', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in elastic search matchers and checks
##################################
require_relative 'elastic_search/matchers'
include Intrigue::Ident::ElasticSearch::Matchers

require_relative 'elastic_search/check_factory'
require_relative '../checks/elastic_search/base'

# elastic search fingerprints
check_folder = File.expand_path('../checks/elastic_search', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in mongodb matchers and checks
##################################
require_relative 'mongodb/matchers'
include Intrigue::Ident::MongoDb::Matchers

require_relative 'mongodb/check_factory'
require_relative '../checks/mongodb/base'

# mongodb fingerprints
check_folder = File.expand_path('../checks/mongodb', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in amqp matchers and checks
##################################
require_relative 'amqp/matchers'
include Intrigue::Ident::Amqp::Matchers

require_relative 'amqp/check_factory'
require_relative '../checks/amqp/base'

# amqp fingerprints
check_folder = File.expand_path('../checks/amqp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

##################################
# Load in smb matchers and checks
##################################
require_relative 'smb/matchers'
include Intrigue::Ident::Smb::Matchers

require_relative 'smb/check_factory'
require_relative '../checks/smb/base'

# smb fingerprints
check_folder = File.expand_path('../checks/smb', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }


##################################
# Load in upnp matchers and checks
##################################
require_relative 'upnp/matchers'
include Intrigue::Ident::Upnp::Matchers

require_relative 'upnp/check_factory'
require_relative '../checks/upnp/base'

# upnp fingerprints
check_folder = File.expand_path('../checks/upnp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }



##################################
# Load in custom ip checks
##################################
require_relative 'ip/ip'
require_relative 'ip/check_factory'
require_relative '../checks/ip/base'
include Intrigue::Ident::Ip

# tcp fingerprints
check_folder = File.expand_path('../checks/ip', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

###
### End protocol requires
###

# Load vulndb client
require_relative 'vulndb_client'

# set default encoding
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# set a base directory so we can use in checks
$ident_dir = File.expand_path('../', File.dirname(__FILE__))

module Intrigue
  module Ident
    class Ident

      # list all checks
      def list_checks(path = '[URI]')
        Intrigue::Ident::Http::CheckFactory.checks.map do |x|
          x.new.generate_checks(path)
        end.concat(
          Intrigue::Ident::Dns::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::ElasticSearch::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Ftp::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Imap::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::MongoDb::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Mysql::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Pop3::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Redis::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Smtp::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Snmp::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Ssh::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Telnet::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Amqp::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Smb::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Upnp::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).concat(
          Intrigue::Ident::Ip::CheckFactory.checks.map { |x| x.new.generate_checks }
        ).flatten
      end

      # This is the main interface for ident interaction going foward!!!
      #
      # Fingerprint by uri
      #
      def fingerprint_uri(uri, opts = {})
        x = URI.parse(uri)
        port = x.port
        hostname = x.host

        # set scheme and path as options
        opts[:scheme] = x.scheme
        opts[:path] = x.path

        # fingerprint it
        fingerprint_service(hostname, port, opts)
      end

      # Fingerprint by hostname and port ... note that you should generally
      # be using fingerprint_uri vs fingerprint_service
      #
      def fingerprint_service(ip_address_or_hostname, port, opts = {})
        ident_matches = nil

        ###
        ### First handle HTTP/S, since it requires a good bit more setup
        ###

        ### calculate a url that gets used below
        # if scheme was provided by original uri use that, otherwise default to "http"
        scheme = opts.key?(:scheme) ? opts[:scheme] : "http"
        path = opts.key?(:path) ? opts[:path] : ""

        # handle ipv6 here... note that this is needed for urls, as well as the
        # fallback-to-http situation below
        if ip_address_or_hostname =~ /:/
          ip_address_or_hostname = "[#{ip_address_or_hostname}]"
        end

        url = "#{scheme}://#{ip_address_or_hostname}:#{port}#{path}"

        if scheme == 'http' || scheme == 'https' || port == 80 || port =~ /^\d+80$/ || port == 443 || port =~ /^\d+443$/
          ident_matches = generate_http_requests_and_check(url, opts) || {}
        end

        ###
        ### Now handle the rest of the protocols, they just take an ip address / prot
        ###

        if scheme == 'dns' || port == 53 || port =~ /^\d+53$/
          ident_matches = generate_dns_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'elastic' || port == 9200 || port =~ /^\d?920\d$/
          ident_matches = generate_elastic_search_request_and_check(ip_address_or_hostname, port, opts[:debug]) || {}
        end

        if scheme == 'ftp' || port == 21 || port =~ /^\d+21$/
          ident_matches = generate_ftp_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'imap' || port == 143 || port =~ /^\d+143$/
          ident_matches = generate_imap_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'mongo' || scheme == 'mongodb' || port == 27_017 || port =~ /^\d+27017$/
          ident_matches = generate_mongodb_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'mysql' || port == 3306 || port =~ /^\d+3306$/
          ident_matches = generate_mysql_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'pop3' || port == 110 || port =~ /^\d+110$/
          ident_matches = generate_pop3_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'redis' ||port == 6379 || port =~ /^\d?6379$/
          ident_matches = generate_redis_request_and_check(ip_address_or_hostname, port, debug = opts[:debug]) || {}
        end

        if scheme == 'smtp' || port == 25 || port =~ /^\d+25$/ || port == 587 || port =~ /^\d+587$/
          ident_matches = generate_smtp_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'snmp' || port == 161 || port =~ /^\d+161$/
          ident_matches = generate_snmp_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'ssh' || port == 22 || port =~ /^\d+22$/
          ident_matches = generate_ssh_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'telnet' || port == 23 || port =~ /^\d+23$/
          ident_matches = generate_telnet_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'amqp' || port == 5672 || port =~ /^\d+5672$/
          ident_matches = generate_amqp_request_and_check(ip_address_or_hostname) || {}
        end

        if scheme == 'smb' || port == 139 || port == 445 || port =~ /^\d+(139|445)$/
          ident_matches = generate_smb_request_and_check(ip_address_or_hostname, port) || {}
        end

        if scheme == 'upnp' || port == 1900 || port =~ /^\d+1900$/
          ident_matches = generate_upnp_request_and_check(ip_address_or_hostname) || {}
        end

        if port == 2083 || port =~ /^\d+2083$/
          ident_matches = generate_http_requests_and_check(ip_address_or_hostname, opts) || {}
        end

        # if you want a custom tcp protocol to be scanned, enter them here
        if port == 4786 || port == 3389 || port == 7001 || port == 9100 || port == 3299 || port == 11211 || port == 8649 || port == 2181
          ident_matches = generate_ip_requests_and_check(ip_address_or_hostname, port) || {}
        end

        ###
        ### Now, finally, default to checking HTTP for anything we don't yet know about, since it's
        ### the most common protocol, and we don't want to miss something simple
        ###
        if ident_matches
          return ident_matches # return right away if we a FP
        else

          # just fingerprint it as a url
          ident_matches = generate_http_requests_and_check(url, opts) || {}

          # if we didnt fail, pull out the FP and match to vulns
          ident_fingerprints = ident_matches['fingerprint'] || []

          # TODO ... are we missing vuln matching here?

          # merge them
          out = ident_matches.merge({ 'fingerprint' => ident_fingerprints })
        end

        out
      end

      private

      def _sanitize_string(string)
        # return nil if string is empty, to allow valid version comparison.
        return nil if ['', nil].include?(string)

        string.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      end

      def _construct_match_response(check, data)
        if check[:type] == 'fingerprint'
          calculated_product = _sanitize_string((if check[:dynamic_product]
                                                   check[:dynamic_product].call(data)
                                                 end) || check[:product])
          calculated_version = _sanitize_string((if check[:dynamic_version]
                                                   check[:dynamic_version].call(data)
                                                 end) || check[:version])
          calculated_update = _sanitize_string((if check[:dynamic_update]
                                                  check[:dynamic_update].call(data)
                                                end) || check[:update])

          calculated_type = 'a' if check[:category] == 'application'
          calculated_type = 'h' if check[:category] == 'hardware'
          calculated_type = 'o' if check[:category] == 'operating_system'
          calculated_type = 's' if check[:category] == 'service' # literally made up

          vendor_string = check[:vendor].gsub(' ', '_') if check[:vendor]
          product_string = calculated_product.gsub(' ', '_') if calculated_product

          version = calculated_version.to_s.gsub(' ', '_')
          update = calculated_update.to_s.gsub(' ', '_')

          cpe_string = _sanitize_string("cpe:2.3:#{calculated_type}:#{vendor_string}:#{product_string}:#{version}:#{update}".downcase)

          ##
          # Support for Dynamic Product
          ##
          if check[:dynamic_product]
            calculated_product = check[:dynamic_product].call(data)
          elsif check[:product] # also handle singular
            calculated_product = check[:product]
          end

          ##
          # Support for Dynamic Issues
          ##
          issues = if check[:dynamic_issues]
                     check[:dynamic_issues].call(data)
                   elsif check[:dynamic_issue] # also handle singular
                     [check[:dynamic_issues].call(data)]
                   elsif check[:issues]
                     check[:issues]
                   elsif check[:issue] # also handle singular
                     [check[:issue]]
                   end

          ##
          # Support for Dynamic Hide
          ##
          hide = if check[:dynamic_hide]
                   check[:dynamic_hide].call(data)
                 elsif check[:hide]
                   check[:hide]
                 else
                   false
                 end

          ##
          # Support for Dynamic Task
          ##
          tasks = if check[:dynamic_tasks]
                    check[:dynamic_tasks].call(data)
                  elsif check[:tasks]
                    check[:tasks]
                  end

          to_return = {
            'method' => 'ident',
            'type' => check[:type],
            'vendor' => check[:vendor],
            'product' => calculated_product,
            'version' => calculated_version,
            'update' => calculated_update,
            'tags' => check[:tags],
            'match_type' => check[:match_type],
            'description' => check[:description],
            'hide' => hide,
            'cpe' => cpe_string,
            'issues' => issues,
            'tasks' => tasks, # [{ :task_name => "example", :task_options => {}}]
            'inference' => check[:inference]
          }
        elsif check[:type] == 'content'

          # Mandatory lambda
          result = check[:dynamic_result].call(data)

          ##
          ## Support for Dynamic Issue (must be dynamic, these checks always run)
          ##
          if result

            ##
            ## Support for Dynamic
            ##
            issue = if check[:dynamic_issue]
                      check[:dynamic_issue].call(data)
                    elsif check[:issue]
                      check[:issue]
                    end

            ##
            ## Support for Dynamic Hide
            ##
            hide = if check[:dynamic_hide]
                     check[:dynamic_hide].call(data)
                   elsif check[:hide]
                     check[:hide]
                   else
                     false
                   end

            ##
            ## Support for Dynamic Task
            ##
            task = if check[:dynamic_task]
                     check[:dynamic_task].call(data)
                   elsif check[:task]
                     check[:task]
                   end

            to_return = {
              'type' => check[:type],
              'name' => check[:name],
              'hide' => hide,
              'issue' => issue,
              'task' => task,
              'result' => result
            }

            # only return if not empty in this case
            to_return = nil if (result.is_a?(Hash) || result.is_a?(Array)) && result.empty?
          else
            to_return = nil
          end
        end

        to_return
      end
    end
  end
end
