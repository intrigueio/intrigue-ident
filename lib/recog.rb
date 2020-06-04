require 'recog'

module Intrigue
module Ident
module Recog

module Helpers

  def recog_to_ident_hash(recog_hash)

    # do the field conversation 
    out = {}
    out["method"] = "recog"
    out["vendor"] = recog_hash["service.vendor"]
    out["product"] = recog_hash["service.product"]
    out["version"] = recog_hash["service.version"]
    out["cpe"] = recog_hash["service.cpe23"]
    out["match_details"] = "#{recog_hash["matched"]} (Recog: #{recog_hash["fingerprint_db"]})"
    out["inference"] = false
    out["hide"] = false
    out["issue"] = nil

  out
  end

end

module Http
  include Intrigue::Ident::Recog::Helpers

  def recog_match_http_server_banner(banner)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("http_servers.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(banner.gsub("server:","").strip)

    # now convert a match to ident match format
    matches.compact.map {|m| recog_to_ident_hash(m)}
  end

  def recog_match_http_cookies(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("http_cookies.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string.gsub("set-cookie:","").strip)

    # now convert it 
    matches.map {|m| recog_to_ident_hash(m)}
  end
end

module Smtp
  include Intrigue::Ident::Recog::Helpers
  def recog_match_smtp_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("smtp_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it 
    matches.map {|m| recog_to_ident_hash(m)}
  end
end

end
end
end