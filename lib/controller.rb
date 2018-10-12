require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    # View = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask user for recipe name -> name
    name = View.ask_for("name")
    # Ask user for recipe descriptio -> descriptio
    description = View.ask_for("description")
    # create an instance of Recipe with name/description
    recipe = Recipe.new(name, description)
    # send the new instance to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # list the recipes
    display_recipes
    # ask user for index(number)
    index = (View.ask_for("number").to_i - 1)
    # tell cookbook to remove the recipe
    @cookbook.remove(index)
  end

  private

  def display_recipes
    # get recipes from cookbook
    recipes = @cookbook.all
    # displaying recipes to user with index
    View.display(recipes)
  end
end
