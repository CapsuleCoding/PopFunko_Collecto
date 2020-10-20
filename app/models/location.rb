class Location < ApplicationRecord
    belongs_to :pop_funkos
    belongs_to :user

    validates :address, presence: true
    validates :bought, presence: true

    validates :pop_funko, uniqueness: { scope: :user, message:"Already added location"}
    
end