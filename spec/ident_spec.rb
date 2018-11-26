require_relative "../lib/ident"

describe "Intrigue" do
describe "Ident" do

  include Intrigue::Ident

  it "should allow us to remove a bad match from a list of matches" do

    x = [
      { "match_type"=>"content_body",
        "product"=>"Drupal",
        "matched_content"=>"(?-mix:Drupal)",
        "type"=>"application",
        "vendor"=>"Drupal",
        "match_details"=>"Drupal CMS"}
      ]

    remove_bad_ident_matches(x).should be []
  end

  it "should correctly match a site" do
    matches = generate_requests_and_check("https://intrigue.io")
    expect(matches.first[:vendor]).to eq("Cloudflare")
  end

=begin
  it "should only request a small number of urls for a full check" do
    # gather all fingeprints for each product
    # this will look like an array of checks, each with a uri and a SET of checks
    generated_checks = Intrigue::Ident::CheckFactory.all.map{|x| x.new.generate_checks("x") }.flatten

    # group by the uris, with the associated checks
    # TODO - this only currently supports the first path of the group!!!!
    ggcs = generated_checks.group_by{|x| x[:paths].first }
    expect(ggcs.count).to be(9)
  end
=end

end
end
