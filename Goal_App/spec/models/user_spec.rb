# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(name: 'Ray', password: 'Hi123456')}

  it {should validate_presence_of (:name)}
  it {should validate_presence_of (:password_digest)} 
  it {should validate_length_of(:password).is_at_least(6)}
  it {should have_many(:goals)} 

  describe 'Uniqueness' do 
    # create(:user) 

    it {should validate_uniqueness_of (:name)}
    it {should validate_uniqueness_of (:session_token)}
  end
end
