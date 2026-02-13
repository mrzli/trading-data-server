# frozen_string_literal: true

module Routes
  module Example
    def self.registered(app)
      app.get "/" do
        "Hello from Sinatra!"
      end

      app.get "/env" do
        "EODHD_DIR: #{Config.eodhd_dir}"
      end
    end
  end
end
