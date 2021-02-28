class String

  def sanitize_unicode
    self.encode("UTF-8", undef: :replace, invalid: :replace, replace: "?" ).gsub("\u0000","")
  end
  
end