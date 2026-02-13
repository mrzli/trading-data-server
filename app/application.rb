# frozen_string_literal: true

require "sinatra/base"

class Application < Sinatra::Base
  configure do
    set :show_exceptions, false if settings.environment == :production
  end

  register Routes::Root
end
