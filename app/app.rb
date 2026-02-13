# frozen_string_literal: true

require "sinatra/base"

class App < Sinatra::Base
  configure do
    set :show_exceptions, false if settings.environment == :production
  end

  register RootRoutes
end
