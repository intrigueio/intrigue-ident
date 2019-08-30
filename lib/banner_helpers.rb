module Intrigue
module Ident
module BannerHelpers

  # matching helpers
  def _all_banner_captures(content, regex)
    return nil unless content["details"]["banner"] &&
      content["details"]["banner"].match(regex)

    match = content["details"]["banner"].match(regex)
    return match.captures.map{|x|x.to_s.strip} if match
  nil
  end

  def _first_banner_match(content, regex)
    return nil unless content["details"]["banner"] &&
      content["details"]["banner"].match(regex)

  content["details"]["banner"].match(regex)
  end

  def _first_banner_capture(content, regex, filter=[])
    return nil unless content["details"]["banner"]
    x = content["details"]["banner"].match(regex)
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
