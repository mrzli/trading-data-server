# frozen_string_literal: true

require "sinatra/base"
require "sinatra/namespace"

class Application < Sinatra::Base
  register Sinatra::Namespace

  configure do
    set :show_exceptions, false if settings.environment == :production
  end

  register Routes::Example
  register Routes::Exchanges
  register Routes::Meta
  register Routes::Data
end
