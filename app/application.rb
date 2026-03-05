# frozen_string_literal: true

require "sinatra/base"
require "sinatra/namespace"
require "rack/cors"

class Application < Sinatra::Base
  register Sinatra::Namespace

  use Rack::Cors do
    allow do
      origins "*"
      resource "*", headers: :any, methods: %i[get post put patch delete options head]
    end
  end

  configure do
    set :show_exceptions, false if settings.environment == :production
  end

  register Routes::Example
  register Routes::Symbols
  register Routes::Info
  register Routes::Data
end
