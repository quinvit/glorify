require "sinatra/base"
require "glorify/css"
require "glorify/extensions"
require "glorify/version"
require "glorify/renderer"

module Sinatra
  module Glorify
    module Helpers
      def glorify text
        rndr = Glorify::Renderer.new
        Redcarpet::Markdown.new(rndr, Glorify::EXTENSIONS).render(text)
      end
    end

    def self.registered(app)
      app.set :glorify_extensions, Glorify::EXTENSIONS
      app.helpers Glorify::Helpers

      app.get '/pygments.css' do
        glorify_css
      end
    end
  end

  register Glorify
end
