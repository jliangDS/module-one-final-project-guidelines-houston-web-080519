class CreateAuthors < ActiveRecord::Migration[4.2]
    def change 
        create_table :authors do |t| 
            t.string :name 
            t.string :password 
        end 
    end 
end 