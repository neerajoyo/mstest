require 'contentful'

module Contentful
  class Base
    attr_accessor :client
    def initialize()
      @client = Contentful::Client.new(
            space: 'kk2bw5ojx476',
            access_token: '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c',
            dynamic_entries: :auto,
            resource_mapping: {
              'Asset' => ContentfulImage
            },
            entry_mapping: {
                'recipe' => ContentfulRecipe
            }
      )
    end
  end
end