module Intrigue
  module Ident
  module ErrorHelpers
  
    # matching helpers
    def _all_error_captures(content, regex)
      return nil unless content["details"]["error"] &&
        content["details"]["error"].match(regex)
  
      match = content["details"]["error"].match(regex)
      return match.captures.map{|x|x.to_s.strip} if match
    nil
    end
  
    def _first_error_match(content, regex)
      return nil unless content["details"]["error"] &&
        content["details"]["error"].match(regex)
  
    content["details"]["error"].match(regex)
    end
  
    def _first_error_capture(content, regex, filter=[])
      return nil unless content["details"]["error"]
      x = content["details"]["error"].match(regex)
      if x && x.captures
        x = x.captures.first.strip
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip
        return x if x.length > 0
      end
    nil
    end
    
  end
  end
  end
  