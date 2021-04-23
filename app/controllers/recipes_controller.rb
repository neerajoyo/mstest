class RecipesController < ApplicationController

  attr_accessor :recipes, :recipe

  def index
    recipe_connection = Contentful::Recipe.new
    raw_recipes_data = recipe_connection.get_all_recipe_with_assets
    parse_recipes_list(raw_recipes_data)

  end

  def show
    recipe_connection = Contentful::Recipe.new
    raw_recipe = recipe_connection.get_recipe_with_id(params[:id])
    @recipe = raw_recipe.recipe_hash
  end


  private
  def parse_recipes_list(raw_recipes_list)
    recipe_list = Array.new
    raw_recipes_list.each do |recipe_item|
      recipe_list << recipe_item.recipe_hash
    end
    @recipes = recipe_list
  end

end
