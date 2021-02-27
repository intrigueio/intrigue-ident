module Intrigue
module Ident
module Check
class Ibm < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Embedded", "Appliance","COTS", "WebServer"],
        vendor: "IBM",
        product:"Datapower",
        references: ["https://www.ibm.com/developerworks/community/blogs/HermannSW/entry/datapower_x_backside_transport_transfer_encoding_and_connection_header_fields9?lang=en"],
        version: nil,
        match_type: :content_headers,
        match_content:  /X-Backside-Transport:/i,
        description:"header thrown by ibm datapower (on error)",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WebServer"],
        vendor: "IBM",
        product:"HTTP Server",
        references: [],
        version: nil,
        match_type: :content_body,
        match_content:  /<address>IBM_HTTP_Server Server/i,
        description:"error thrown by ibm http server",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WebServer"],
        vendor: "IBM",
        product:"HTTP Server",
        references: [],
        version: nil,
        match_type: :content_headers,
        match_content:  /^server: IBM_HTTP_Server/i,
        description:"server header",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative","COTS"],
        vendor: "IBM",
        product:"IBM Security Access Manager for Web",
        references: ["https://www.ibm.com/support/knowledgecenter/SSPREK_9.0.2.1/com.ibm.isam.doc/wrp_config/concept/con_sam_intro.html"],
        version: nil,
        match_type: :content_headers,
        match_content:  /www-authenticate: Basic realm=\"IBM Security Access Manager for Web\"/i,
        description:"IBM security access manager login prompt",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative","COTS"],
        vendor: "IBM",
        product:"Tivoli Access Manager for e-business",
        references: ["https://www.ibm.com/support/knowledgecenter/en/SSPREK_6.1.0/com.ibm.itame.doc_6.1/am61_qsg_en.htm"],
        version: nil,
        match_type: :content_body,
        match_content:  /<title>Access Manager for e-Business Login/i,
        description:"Generic Ibm tivoli copyright",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WebServer","COTS"],
        vendor: "IBM",
        product:"WebSEAL",
        references: ["https://www.ibm.com/support/knowledgecenter/en/SSPREK_8.0.1.2/com.ibm.isamw.doc_8.0.1.2/wrp_config/task/tsk_submt_form_data_ws.html"],
        version: nil,
        match_type: :content_body,
        match_content:  /<form method=\"POST\" action=\"\/pkmslogin.form\">/i,
        description:"form action to submit to webseal (on ourselves)",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WebServer","COTS"],
        vendor: "IBM",
        product:"WebSEAL",
        references: ["https://www.ibm.com/support/knowledgecenter/en/SSPREK_8.0.1.2/com.ibm.isamw.doc_8.0.1.2/wrp_config/task/tsk_submt_form_data_ws.html"],
        match_type: :content_headers,
        match_content:  /^server:\ WebSEAL\/[\d\.]{1,}(\ \(Build \d{6}\)){0,1}$/i,
        dynamic_version: lambda { |x| 
          _first_header_capture(x,/^server:\ WebSEAL\/[\d\.]{1,}(\ \(Build \d{6}\)){0,1}$/i) },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "IBM",
        product:"WebSphere",
        references: ["https://github.com/wireghoul/lbmap/commit/2d15ace54266ecf146fdf8a06f4d226398ddd19c"],
        match_type: :content_headers,
        match_content:  /^\$WSEP:.*$/i,
        description: "header",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "IBM",
        product:"WebSphere",
        references: [],
        match_type: :content_headers,
        match_content:  /^server: WebSphere Application Server\/[\d\.]+$/i,
        dynamic_version: lambda { |x| 
          _first_header_capture(x,/^server: WebSphere Application Server\/([\d\.]+)/i) },
        description: "webphere header",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "IBM",
        product:"WebSphere",
        references: ["https://github.com/danamodio/webintel"],
        version: "6.1",
        match_type: :content_body,
        match_content:  /infocenter\/wasinfo\/v6r1/i,
        description: "header",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "IBM",
        product:"WebSphere",
        references: ["https://github.com/wireghoul/lbmap/commit/2d15ace54266ecf146fdf8a06f4d226398ddd19c"],
        version: nil,
        match_type: :content_body,
        match_content:  /SRVE0190E: File not found/i,
        description: "header",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "IBM",
        product:"WebSphere",
        references: ["https://github.com/wireghoul/lbmap/commit/2d15ace54266ecf146fdf8a06f4d226398ddd19c"],
        version: nil,
        match_type: :content_body,
        match_content:  /SRVE0190E: File not found/i,
        description: "header",
        paths:[{ path: "#{url}/doesntexist-123", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
