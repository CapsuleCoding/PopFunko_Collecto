class PopFunk < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :locations, dependent: :destroy
    has_many :users, through: :locations
    accepts_nested_attributes_for :category

    validates :name, presence: true
    validates :price, presence: true
    validates :already_exist

    scope :order_by_location, -> {left_joins(:locations).group(:id).order("price desc")}

    def category_attributes(attributes)
        category = Category.find_or_create_by(attributes) if !name.empty
    end

    def already_exist
        if PopFunko.find_by(name: name,price: price)
            errors.add(:name, 'has already been added for that price')
        end
    end

    def name_of_location
        "#{name} - #{category.name}"
    end
    

end