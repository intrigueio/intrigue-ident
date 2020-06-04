require 'recog'

module Intrigue
module Ident
module Recog

module Http
  
  def recog_match_http_server_banner(banner)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("http_servers.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matcher.match_banner(banner.gsub("server:","").strip)
  end

  def recog_match_http_cookies(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("http_cookies.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matcher.match_banner(string.gsub("set-cookie:","").strip)
  end
end

module Smtp
  def recog_match_smtp_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("smtp_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matcher.match_banner(string)
  end
end

end
end
end