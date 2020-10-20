class CreatePopFunkos < ActiveRecord::Migration[6.0]
    def change
      create_table :pop_funkos do |t|
        t.string :name
        t.integer :price
        t.belongs_to :category, null: false, foreign_key: true
        t.belongs_to :user, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
  