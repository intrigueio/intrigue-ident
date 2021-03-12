module Intrigue
  module Ident
    module ElasticSearch
      module Matchers
        require_relative "elastic_search"
        include Intrigue::Ident::ElasticSearch

        require_relative "content"
        include Intrigue::Ident::ElasticSearch::Content

        def match_elastic_search_response_hash(check, response_hash)
          # puts check[:matches->:match_content]
          if check[:type] == "fingerprint"
            unless check[:matches] #
              check[:matches] = [
                {
                  match_type: check[:match_type],
                  match_content: check[:match_content],
                },
              ]
            end
            match_results = []

            # stick it in our array, so we can keep track of each individual match
            check[:matches].each do |m|

              ###
              ### Different check types require differnt check methods,
              ### this handles that
              ###
              if m[:match_type] == :content_response_body
                value = _response_body(response_hash) =~ m[:match_content] ? true : false
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
            out = nil
            if check[:match_logic] == :any && match_results.any?
              out = _construct_match_response(check, response_hash)
            elsif check[:match_logic] == :all && match_results.all?
              out = _construct_match_response(check, response_hash)
              # legacy, default to simply returning if all (can only be one)
            elsif !check[:match_logic] && match_results.all?
              out = _construct_match_response(check, response_hash)
            end
          end
        end
      end
    end
  end
end
