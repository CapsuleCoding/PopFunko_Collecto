class CreateLocations < ActiveRecord::Migration[6.0]
    def change
      create_table :locations do |t|
        t.boolean :bought
        t.string :address
        t.belongs_to :pop_funko, null: false, foreign_key: true
        t.belongs_to :user, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
  