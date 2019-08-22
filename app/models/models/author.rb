class Author < ActiveRecord::Base 
    has_many :cookbooks 
    has_many :recipes, through: :cookbooks 
end 