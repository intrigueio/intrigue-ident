require 'recog'

module Intrigue
module Ident
module RecogWrapper

module Helpers

  def recog_to_ident_hash(recog_hash)

    # do the field conversation 
    out = {}
    out["method"] = "recog"
    out["vendor"] = recog_hash["service.vendor"]
    out["product"] = recog_hash["service.product"]
    out["version"] = recog_hash["service.version"]
    out["cpe"] = "#{recog_hash["service.cpe23"]}".gsub("cpe:/a:","cpe:2.3:a:").gsub("cpe:/o:","cpe:2.3:o:").gsub("cpe:/h:","cpe:2.3:h:") << "::"
    out["match_details"] = "#{recog_hash["matched"]} (Recog: #{recog_hash["fingerprint_db"]})"
    out["inference"] = false
    out["hide"] = false
    out["tags"] = []
    out["issue"] = nil

  out
  end

end


module Dns
  include Intrigue::Ident::RecogWrapper::Helpers
  def recog_match_dns_version(string)
    options = OpenStruct.new(
      color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("dns_versionbind.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out
    end  
  end
end



module Ftp
  include Intrigue::Ident::RecogWrapper::Helpers
  def recog_match_ftp_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("ftp_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out
    end  
  end
end

module Http
  include Intrigue::Ident::RecogWrapper::Helpers

  def recog_match_http_server_banner(banner)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("http_servers.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(banner.gsub("server:","").strip)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out["tags"] << "Web Server" unless recog_out["tags"].include?("Web Server")
      recog_out
    end  
  end

  def recog_match_http_cookies(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("http_cookies.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string.gsub("set-cookie:","").strip)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out["tags"] << "Web Server" unless recog_out["tags"].include?("Web Server")
      recog_out
    end  
  end
end

module Smtp
  include Intrigue::Ident::RecogWrapper::Helpers
  
  def recog_match_smtp_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("smtp_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out["tags"] << "MailServer" unless recog_out["tags"].include?("MailServer")
      recog_out
    end  

  end
end

module Snmp
  include Intrigue::Ident::RecogWrapper::Helpers
 
  def recog_match_snmp_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("snmp_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out["tags"] << "Networking" unless recog_out["tags"].include?("Networking")
      recog_out
    end  
  end
  
end

module Ssh
  include Intrigue::Ident::RecogWrapper::Helpers
  def recog_match_ssh_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("ssh_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out
    end  
  end
end

module Telnet
  include Intrigue::Ident::RecogWrapper::Helpers
  def recog_match_telnet_banner(string)
    options = OpenStruct.new(color: false, detail: true, fail_fast: false, multi_match: true)
    ndb = ::Recog::DB.new("telnet_banners.xml");nil
    options.fingerprints = ndb.fingerprints;nil
    matcher = ::Recog::MatcherFactory.build(options);nil
    matches = matcher.match_banner(string)

    # now convert it & return it 
    matches.compact.map do |m| 
      recog_out = recog_to_ident_hash(m)
      recog_out
    end 
  end
end

end
end
end