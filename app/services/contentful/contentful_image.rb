module Contentful
  class ContentfulImage < Contentful::Asset
    def https_image_url
      image_url.sub %r<\A//>, 'https://'
    end
  end
end