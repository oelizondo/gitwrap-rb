require 'gitwrap/users'

describe 'User' do

  context '.fetch_single_user' do
    it 'should retrieve a hash containing user info' do
      o = Gitwrap::User::fetch_single_user('oelizondo')
      expect(o.login).to eq 'oelizondo'
    end
  end

  context '.fetch_all_users' do
    it 'should return an array of user objects' do
      users = Gitwrap::User::fetch_all_users(1)
      expect(users.count).not_to eq(0)
    end
  end

  context '.fetch_users_by_language' do
    it 'should return an array of users whose repos are in the designated language' do
      users = Gitwrap::User::fetch_users_by_language('Ruby')
      expect(users.count).not_to eq(0)
    end
  end

  context '.fetch_users_by_location' do
    it 'should return an array of users in a certain area' do
      users = Gitwrap::User::fetch_users_by_location('Monterrey')
      expect(users.count).not_to eq(0)
    end
  end

  context '.fetch_users_by_location_and_language' do
    it 'should return an array of users filtered by area and language' do
      users = Gitwrap::User::fetch_users_by_location_and_language('Monterrey', 'Ruby')
      expect(users.count).not_to eq(0)
    end
  end


end