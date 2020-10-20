class User < ApplicationRecord
    has_many :locations
    has_many :locations_pop_funkos, through: :locations, source: :pop_funko 
    has_many :pop_funkos
    has_secure_password

    validates :username, uniqueness:true, presence:true
    validates :password, length: { in: 6..100}

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
    end
end
