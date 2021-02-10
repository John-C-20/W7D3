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

class User < ApplicationRecord
    validates :name, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true  
    validates :password, length: {minimum: 6, allow_nil: true}
    
    attr_reader :password 

    after_initialize :ensure_session_token

    def password=(password) 
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.generate_session_token 
        SecureRandom::urlsafe_base64 
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal 

end
