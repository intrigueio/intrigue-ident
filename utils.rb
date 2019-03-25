module Intrigue
module Ident
module Utils

    ## Helpers 
    def encode_string(string)
      return string unless string.kind_of? String
    string.encode("UTF-8", :undef => :replace, :invalid => :replace, :replace => "?")
    end

    def encode_hash(hash)
      return hash unless hash.kind_of? Hash
      hash.each {|k,v| hash[k] = encode_string(v) if v.kind_of? String }
    hash
    end

end
end
end