require 'singleton'
module Contentful
  class Recipe < Base
    include Singleton

    def initialize()
      super()
    end

    def get_all_recipe_with_assets
      @client.entries(include: 10, content_type: 'recipe')
    end

    def get_recipe_with_id(id)
      @client.entry(id, include: 10)
    end

  end
end
