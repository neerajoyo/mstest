class RecipesController < ApplicationController

  attr_accessor :recipes, :recipe

  def index
    @tag = 'gluten'
    @refresh_params = true
    recipe_connection = Contentful::Recipe.new
    raw_recipes_data = recipe_connection.get_all_recipe_with_assets
    @recipes = parse_recipes_list(raw_recipes_data)

  end

  def show
    recipe_connection = Contentful::Recipe.new
    raw_recipe = recipe_connection.get_recipe_with_id(params[:id])
    p raw_recipe
    @recipe = parse_single_recipe(raw_recipe)
  end


  private
  def parse_recipes_list(raw_recipes_list)
    recipe_list = Array.new
    raw_recipes_list.each do |recipe_item|
      new_recipe = Hash.new
      new_recipe[:id] = recipe_item.id
      new_recipe[:title] = recipe_item.fields[:title] if recipe_item.fields[:title]
      new_recipe[:image_url] = recipe_item.fields[:photo].https_image_url
      new_recipe[:calories] = recipe_item.fields[:calories] if recipe_item.fields[:calories]
      new_recipe[:description] = recipe_item.fields[:description] if recipe_item.fields[:description]
      if recipe_item.fields[:tags]
        new_recipe[:tags] = Array.new
        recipe_item.fields[:tags].each do |tag|
          new_recipe[:tags] << tag.fields[:name].to_s
        end
      end
      if recipe_item.fields[:chef]
        new_recipe[:chef] = recipe_item.fields[:chef].fields[:name]
      end
    recipe_list << new_recipe
    end
    recipe_list
  end

  def parse_single_recipe(recipe_item)
    new_recipe = Hash.new
    new_recipe[:id] = recipe_item.id
    new_recipe[:title] = recipe_item.fields[:title] if recipe_item.fields[:title]
    new_recipe[:image_url] = recipe_item.fields[:photo].https_image_url
    new_recipe[:calories] = recipe_item.fields[:calories] if recipe_item.fields[:calories]
    new_recipe[:description] = recipe_item.fields[:description] if recipe_item.fields[:description]
    if recipe_item.fields[:tags]
      new_recipe[:tags] = Array.new
      recipe_item.fields[:tags].each do |tag|
        new_recipe[:tags] << tag.fields[:name].to_s
      end
    end
    if recipe_item.fields[:chef]
      new_recipe[:chef] = recipe_item.fields[:chef].fields[:name]
    end
    new_recipe
  end




end
