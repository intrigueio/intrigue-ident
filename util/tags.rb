#!/usr/bin/env ruby
require_relative "../lib/ident"
include Intrigue::Ident

def list_checks
  Intrigue::Ident::Http::CheckFactory.checks.map{|x| x.new.generate_checks("[uri]") }.flatten
  #Intrigue::Ident::Ftp::CheckFactory.checks.map{|x| x.new.generate_checks.flatten
  #Intrigue::Ident::Smtp::CheckFactory.checks.map{|x| x.new.generate_checks.flatten
  #Intrigue::Ident::Snmp::CheckFactory.checks.map{|x| x.new.generate_checks.flatten
end

def tag_description(tag_name)

  descriptions = {
    "Application Server" => "Identified as application server software (ex: Tomcat - note that this is different than \"Web Server\").",
    "COTS" => "Identified as Commercial Off the Shelf Software installed by the user.",
    "CDN" => "Identified a Content Delivery Network (ex: Cloudflare, Akamai, LimeLight Networks)",
    "CMS" => "Identified as Content Mangement System Software (ex: Wordpress)",
    "IaaS" => "Identified as Infrastructure as a Service. Used when the entity is identified as a IaaS platform (ex: AWS, GCP, Azure, etc).",
    "Networking" => "Identified as hardware or software relevant to the network infrastructure.",
    "PaaS" => "Identified as Platform as a Service. Used when a Platform that hosts user code is identified (ex: Heroku, Joyent, etc).",
    "SaaS" => "Identified as oftware as a Service. Used when the entity is hosted as SaaS. (ex: StatusPage, Wix, etc)",
    "WAF" => "Identified as Web Application Firewall (ex: Cloudflare, Incapsula, etc).",
    "Web Server" => "Identified as web server software. (ex: Apache, Nginx, IIS)",
  }

descriptions[tag_name]
end

tags = list_checks.map{ |x| x[:tags] }.flatten.compact
tag_counts = Hash.new(0).tap { |h| tags.each { |t| h[t] += 1 } }

tag_counts.sort_by{|t,c| c }.reverse.each  do |t,c|
  puts "#{c} #{t}: #{tag_description(t.strip)}"
end

