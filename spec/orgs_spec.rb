require 'gitwrap/orgs'

describe 'Org' do

  context '.fetch_single_org' do
    it 'should return an org object' do
      o = Gitwrap::Org::fetch_single_org('IcaliaLabs')
      expect(o.name).to eq 'Icalia Labs'
    end
  end

  context '.fetch_all_orgs' do
    it 'should return an array of orgs' do
      os = Gitwrap::Org::fetch_all_orgs(10)
      expect(os.count).not_to eq 0
    end
  end

end