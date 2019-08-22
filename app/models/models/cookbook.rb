class Cookbook < ActiveRecord::Base 
    belongs_to :author
    has_many :recipes 
end 