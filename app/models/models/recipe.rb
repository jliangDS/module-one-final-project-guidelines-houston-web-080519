class Recipe < ActiveRecord::Base 
    belongs_to :cookbook
    belongs_to :author 
end 