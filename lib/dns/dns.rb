require 'dnsruby'

module Intrigue
  module Ident
    module Dns

      include Intrigue::Ident::SimpleSocket

      # gives us the recog dns matchers 
      include Intrigue::Ident::RecogWrapper::Dns

      def generate_dns_request_and_check(nameserver, debug=false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)

        sq = ServerQuery.new(nameserver)
        
        version_string = sq.version
        authors_string = sq.authors
        hostname_string = sq.hostname

        details = {
          "details" => {
            "version.bind" => version_string,
            "authors.bind" => authors_string,
            "hostname.bind" => hostname_string
          }
        }

        results = []
  
        # generate the checks 
        checks = Intrigue::Ident::Dns::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten

        # and run them against our result
        checks.each do |check|
          results << match_dns_response_hash(check,details)
        end
  
        # Run recog across the banner
        recog_results = recog_match_dns_version(version_string)
  
      { "fingerprint" => (results + recog_results).uniq.compact, 
        "content" => [] }.merge(details["details"])
      end
    end

    class ServerQuery

      include Dnsruby
    
      def initialize(ns)

        config = {
          :search => [],
          :retry_times => 2,
          :retry_delay => 2,
          :packet_timeout => 10,
          :query_timeout =>10,
          :nameserver => ns
        }

        @resolver = Dnsruby::Resolver.new(config)

      end

      def version
    
        name = "version.bind."
        type = 'TXT'
        klass = 'CH'
    
        resp = _do_query name, type, klass
      resp.answer.first.rdata.first if resp.answer.first
      end 
    
      def hostname
    
        name = "hostname.bind."
        type = 'TXT'
        klass = 'CH'
    
        resp = _do_query name, type, klass
      resp.answer.first.rdata.first if resp.answer.first
      end 
    
      def authors
    
        name = "authors.bind."
        type = 'TXT'
        klass = 'CH'
    
        resp = _do_query name, type, klass
      resp.answer.first.rdata.first if resp.answer.first
      end 

      private
          
      def _do_query(name,type,klass)
        begin 
          @resolver.query(name, type, klass)
        rescue Dnsruby::Refused
        end
      end
    
    end

  end
end




