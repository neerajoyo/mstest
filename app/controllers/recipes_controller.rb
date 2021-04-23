class RecipesController < ApplicationController

  attr_accessor :recipes, :recipe

  def index
    raw_recipes_data = Contentful::Recipe.instance.get_all_recipe_with_assets
    parse_recipes_list(raw_recipes_data)
  end

  def show
    @recipe = Contentful::Recipe.instance.get_recipe_with_id(params[:id]).recipe_hash
  end


  #API connection object Contentful::Recipe.instance has been repeated in index and show. this can be made DRY using before_action although it's not the ideal way
  private
  def parse_recipes_list(raw_recipes_list)
    recipe_list = Array.new
    raw_recipes_list.each do |recipe_item|
      recipe_list << recipe_item.recipe_hash
    end
    @recipes = recipe_list
  end

end
