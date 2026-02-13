# frozen_string_literal: true

module Routes
  module Root
    def self.registered(app)
      app.get "/" do
        "Hello from Sinatra!"
      end

      app.get "/env" do
        "EODHD_DIR: #{Config.eodhd_dir}"
      end

      app.get "/exchanges" do
        content_type :json
        file_path = File.join(Config.eodhd_dir, "exchanges.json")
        
        unless File.exist?(file_path)
          status 404
          return { error: "File not found: #{file_path}" }.to_json
        end
        
        File.read(file_path)
      end
    end
  end
end
