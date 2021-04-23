module Contentful
  class ContentfulRecipe < Contentful::Entry
    def recipe_hash
      new_recipe = Hash.new
      new_recipe[:id] = id
      new_recipe[:title] = fields[:title]
      new_recipe[:image_url] = fields[:photo].https_image_url
      new_recipe[:calories] = fields[:calories] if fields[:calories]
      new_recipe[:description] = fields[:description] if fields[:description]
      if fields[:tags] && !fields[:tags].empty?
        new_recipe[:tags] = []
        fields[:tags].each do |tag|
          new_recipe[:tags] << tag.fields[:name].to_s
        end
      end
      if fields[:chef]
        new_recipe[:chef] = fields[:chef].fields[:name]
      end
      new_recipe
    end
  end
end