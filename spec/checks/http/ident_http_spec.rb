require_relative '../../../lib/ident'

describe 'Intrigue' do
  describe 'Ident' do
    include Intrigue::Ident

    # URIs to exclude
    excluded_uris = [Intrigue::Ident::Check::Analytics, Intrigue::Ident::Check::Authentication,
                     Intrigue::Ident::Check::Content, Intrigue::Ident::Check::SecurityHeaders,
                     Intrigue::Ident::Check::Generic]

    # Array of all checks after filtering the excluded ones
    all_checks = Intrigue::Ident::Http::CheckFactory.checks.reject do |check|
                   excluded_uris.include? check
                 end.map { |x| x.new.generate_checks('[uri]') }.flatten

    # Array of all approved tags
    approved_http_tags = JSON.parse(File.read('spec/data/approved_tags.json'))['approved_http_tags']

    it 'should load Http checks' do
      checks = Intrigue::Ident::Http::CheckFactory.checks.map { |x| x.new.generate_checks('[uri]') }.flatten
      expect(checks).to be_a Array
    end

    it 'should have allowed tags for Http checks' do
      just_tags = all_checks.map { |x| x[:tags] }.flatten
      just_tags.uniq.each do |tag|
        expect(approved_http_tags).to include(tag)
      end
    end

    it 'should have correct syntax for Http checks' do
      all_checks.each do |check|
        expect(check[:type]).to be_a(String) if check.key(:type)
        expect(check[:category]).to be_a(String) if check.key(:category)
        expect(check[:tags]).to be_a(Array) if check.key(:tags)
        expect(check[:vendor]).to be_a(String) if check.key(:vendor)
        expect(check[:product]).to be_a(String) if check.key(:product)
        expect(check[:website]).to be_a(String) if check.key(:website)
        expect(check[:references]).to be_a(Array) if check.key(:references)
        expect(check[:match_type]).to be_a(Symbol) if check.key(:match_type)
        expect(check[:match_logic]).to be_a(Symbol) if check.key(:match_logic)
        expect(check[:match_content]).to be_a(String) if check.key(:match_content)
        expect(check[:paths]).to be_a(Array) if check.key(:paths)
        expect(check[:inference]).to be_a(true).or be_a(false) if check.key(:inference)
        expect(check[:hide]).to be_a(true).or be_a(false) if check.key(:hide)
        expect(check[:version]).to be_a(String).or be nil if check.key(:version)
        expect(check[:description]).to be_a(String) if check.key(:description)
      end
    end

    it 'should have key attributes for Http checks' do
      all_checks.each do |check|
        expect(check).to have_key(:type)
        expect(check).to have_key(:category)
        expect(check).to have_key(:tags)
        expect(check).to have_key(:vendor)
        expect(check).to have_key(:website).or have_key(:references)
        expect(check).to have_key(:product)
        expect(check).to have_key(:description).or have_key(:match_details)
        expect(check).to have_key(:match_type).or have_key(:matches)
        expect(check).to have_key(:match_content).or have_key(:matches)
        expect(check).to have_key(:inference)
        expect(check).to have_key(:paths)

        # Not Key Attributes???
        # expect(check).to have_key(:match_logic)
        # expect(check).to have_key(:dynamic_version)
        # expect(check).to have_key(:dynamic_update)
        # expect(check).to have_key(:version)
        # expect(check).to have_key(:hide)
        # expect(check).to have_key(:test_target)
      end
    end
  end
end
