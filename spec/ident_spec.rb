require_relative "../lib/ident"

describe "Intrigue" do
describe "Ident" do

  include Intrigue::Ident

  it "should load Http checks" do
    checks = Intrigue::Ident::Http::CheckFactory.checks.map{|x| x.new.generate_checks("[uri]") }.flatten
    expect(checks).to be_a Array
  end

end
end
