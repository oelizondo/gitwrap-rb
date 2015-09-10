require 'gitwrap/repos'

describe 'Repo' do

  context '.fetch_user_repos' do
    it 'should return an array of user repos' do
      repos = Gitwrap::Repo::fetch_user_repos('oelizondo')
      expect(repos.count).not_to eq(0)
    end
  end

  context '.fetch_org_repos' do
    it 'should return and orgs repo' do
      repos = Gitwrap::Repo::fetch_org_repos('IcaliaLabs')
      expect(repos.count).not_to eq 0
    end
  end

  context '.fetch_single_repo' do
    it 'should return a single repo' do
      repo = Gitwrap::Repo::fetch_single_repo('oelizondo', 'gitwrap-rb')
      expect(repo.name).to eq 'gitwrap-rb'
    end
  end

  context '.fetch_repos_by_language' do
    it "should return a language's repos" do
      repos = Gitwrap::Repo::fetch_repos_by_language('ruby')
      expect(repos.count).not_to eq(0)
    end
  end

end