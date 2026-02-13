# frozen_string_literal: true

require "sinatra/base"
require_relative "routes/root_routes"

class App < Sinatra::Base
  configure do
    set :show_exceptions, false if settings.environment == :production
  end

  register RootRoutes
end
