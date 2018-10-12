class View
  def display(recipes) # recipes > array of instances
    if recipes.empty?
      puts "No recipes in cookbook"
    else
      recipes.each_with_index do |recipe, index| #instance
        puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
      end
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    return gets.chomp
  end
end
