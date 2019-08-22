require_relative '../config/environment'
ActiveRecord::Base.logger = nil 
prompt = TTY::Prompt.new 

a = Artii::Base.new :font => 'slant'
prompt.say(a.asciify('Cookbook'))

current_user = nil
while current_user == nil

    users_response = prompt.select("Welcome to Cookbook", ["Sign Up", "Login", "Exit"])

    if ( users_response == "Sign Up" )
        name = prompt.ask("What is your name?")
        password = prompt.ask("What is your password?")
        current_user = Author.create({
            name: name,
            password: password
        })
       
        choice = prompt.select("What would you like to do?", ["Create a Cookbook", "View Cookbooks", "Exit"])
        if ( choice == "Create a Cookbook")
            name = prompt.ask("name?")
            Cookbook.create(:name => name, :author_id => current_user.id)
            prompt.say("Congratulations you created a new Cookbook! #{Cookbook.all.last.name} is created!")
        end 

        if ( choice == "View Cookbooks" )
            morechoice = prompt.select("Which Cookbooks would you like to view?", ["Your Cookbooks", "All Cookbooks", "Exit"])
            if ( morechoice == "Your Cookbooks" )
                cookbooks = Cookbook.all.select {|cookbook| cookbook.author_id == current_user.id}
                your_cookbooks = cookbooks.map {|cookbook| cookbook.name}
                puts "Here's all your Cookbooks #{current_user.name}! #{your_cookbooks}" 

            end 
        end 

        if ( morechoice == "All Cookbooks")
            allcookbooks = Cookbook.all.map { |cookbook| cookbook.name }
            puts "Here's all Cookbooks #{current_user.name}! #{allcookbooks}"
        end 

        if ( choice == "Exit" )
            break 
        end 
    end 

    if ( users_response == "Login")
        current_user = Author.where({
            name: prompt.ask("What is your name?"),
            password: prompt.ask("What is your password")
        }).first 

        puts current_user.id 
        
        choice = prompt.select("What would you like to do?", ["Create a Cookbook", "View Cookbooks", "Exit"])
        if ( choice == "Create a Cookbook")
            name = prompt.ask("name?")
            Cookbook.create(:name => name, :author_id => current_user.id)
            prompt.say("Congratulations you created a new Cookbook! #{Cookbook.all.last.name} is created!")
        end 

        if ( choice == "View Cookbooks")
            morechoice = prompt.select("Which Cookbooks would you like to view?", ["Your Cookbooks", "All Cookbooks", "Exit"])
            if ( morechoice == "Your Cookbooks")
                cookbooks = Cookbook.all.select { |cookbook| cookbook.author_id == current_user.id}
                your_cookbooks = cookbooks.map { |cookbook| cookbook.name }
                puts "Here's all your Cookbooks #{current_user.name}! #{your_cookbooks}"
            end 

            if ( morechoice == "All Cookbooks")
                allcookbooks = Cookbook.all.map { |cookbook| cookbook.name }
                puts "Here's all Cookbooks #{current_user.name}! #{allcookbooks}"
                evenmorechoice = prompt.select("Which Cookbooks would you like to view?", allcookbooks)
                evenmorechoices = prompt.select("You chose #{evenmorechoice}, would you like to view the recipes, #{current_user.name}?", ["Yes", "No", "Exit"])
                if ( evenmorechoices == "Yes")
                    puts "Here are all the recipes in #{evenmorechoice}:"
                    evenmorechoicess = Cookbook.where({name: evenmorechoice})
                    evenmorechoicesss = Recipe.where({cookbook_id: evenmorechoicess.ids})
                    evenmorechoicessss = evenmorechoicesss.map {|recipe| recipe.name}
                    evenmorechoicesssss = prompt.select("Here are all the recipes in #{evenmorechoice}:", evenmorechoicessss)
                    evenmorechoicessssss = Recipe.where({name: evenmorechoicesssss})
                    puts evenmorechoicessssss
                end 

                if ( evenmorechoices == "No")
                    puts "No"
                end 

                if ( evenmorechoices == "Exit")
                    break 
                end 

            end 

            if ( morechoice == "Exit")
                break
            end 
        end

        
    end 

    if ( users_response == "Exit")
        break 
    end 
 
end 






