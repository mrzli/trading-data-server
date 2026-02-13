# frozen_string_literal: true

module RootRoutes
  def self.registered(app)
    app.get "/" do
      "Hello from Sinatra!"
    end
  end
end
