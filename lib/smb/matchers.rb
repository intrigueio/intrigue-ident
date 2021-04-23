module Intrigue
  module Ident
    module Smb
      module Matchers
        require_relative 'smb'
        include Intrigue::Ident::Smb

        require_relative 'content'
        include Intrigue::Ident::Smb::Content

        def match_smb_response_hash(check, response_hash)
          # puts check[:matches->:match_content]
          if check[:type] == 'fingerprint'
            unless check[:matches]
              check[:matches] = [
                {
                  match_type: check[:match_type],
                  match_content: check[:match_content]
                }
              ]
            end
            match_results = []

            # stick it in our array, so we can keep track of each individual match
            check[:matches].each do |m|
              ###
              ### Different check types require differnt check methods,
              ### this handles that
              ###
              case m[:match_type]
              when :protocol_response
                value = _protocol(response_hash) =~ m[:match_response] ? true : false
              when :description_response
                value = _description(response_hash) =~ m[:match_response] ? true : false
              when :connection_status_response
                value = _connection_status(response_hash) =~ m[:match_response] ? true : false
              when :native_os_response
                value = _native_os(response_hash) =~ m[:match_response] ? true : false
              when :native_auth_response
                value = _native_auth(response_hash) =~ m[:match_response] ? true : false
              when :netbios_name_response
                value = _netbios_name(response_hash) =~ m[:match_response] ? true : false
              when :netbios_domain_response
                value = _netbios_domain(response_hash) =~ m[:match_response] ? true : false
              when :fqdn_of_the_computer_response
                value = _fqdn_of_the_computer(response_hash) =~ m[:match_response] ? true : false
              when :fqdn_of_the_domain_response
                value = _fqdn_of_the_domain(response_hash) =~ m[:match_response] ? true : false
              when :fqdn_of_the_forest_response
                value = _fqdn_of_the_forest(response_hash) =~ m[:match_response] ? true : false
              when :dialect_response
                value = _dialect(response_hash) =~ m[:match_response] ? true : false
              when :os_version_response
                value = _os_version(response_hash) =~ m[:match_response] ? true : false
              end

              # stick it in our array, so we can keep track of each individual match
              match_results << value
            end

            #
            # Now, we need to apply our logic about what a match actually is
            # before we can return the right thing
            #
            # valid values:
            # - :any
            # - :all
            #
            if check[:match_logic] == :any && match_results.any?
              _construct_match_response(check, response_hash)
            elsif check[:match_logic] == :all && match_results.all?
              _construct_match_response(check, response_hash)
              # legacy, default to simply returning if all (can only be one)
            elsif !check[:match_logic] && match_results.all?
              _construct_match_response(check, response_hash)
            end
          end
        end
      end
    end
  end
end
