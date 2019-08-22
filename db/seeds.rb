


cookbook1 = Cookbook.create(:name => "Cookbook1", :author_id => 1)
cookbook2 = Cookbook.create(:name => "Cookbook2", :author_id => 1)
cookbook3 = Cookbook.create(:name => "Cookbook3", :author_id => 1)

recipe1 = Recipe.create(:name => "Recipe1", :cookbook_id => 1)
recipe2 = Recipe.create(:name => "Recipe2", :cookbook_id => 1)
recipe3 = Recipe.create(:name => "Recipe3", :cookbook_id => 1)

user1 = Author.create(:name => "User1", :password => "Password")
user2 = Author.create(:name => "User2", :password => "Password")
user3 = Author.create(:name => "User3", :password => "Password")

