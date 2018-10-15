require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask user for recipe name -> name
    name = @view.ask_for("name")
    # Ask user for recipe descriptio -> descriptio
    description = @view.ask_for("description")
    # create an instance of Recipe with name/description
    recipe = Recipe.new(name, description)
    # send the new instance to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # list the recipes
    display_recipes
    # ask user for index(number)
    index = (@view.ask_for("number").to_i - 1)
    # tell cookbook to remove the recipe
    @cookbook.remove(index)
  end

  private

  def display_recipes
    # get recipes from cookbook
    recipes = @cookbook.all
    # displaying recipes to user with index
    @view.display(recipes)
  end
end
