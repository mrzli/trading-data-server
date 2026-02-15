# frozen_string_literal: true

module Routes
  module Symbols
    def self.registered(app)
      app.namespace "/symbols" do
        get "/exchanges" do
          content_type :json
          file_path = File.join(Config.eodhd_dir, "exchanges.json")
          
          unless File.exist?(file_path)
            status 404
            return { error: "File not found: #{file_path}" }.to_json
          end
          
          File.read(file_path)
        end

        get "/meta" do
          content_type :json
          file_path = File.join(Config.eodhd_dir, "meta.json")
          
          unless File.exist?(file_path)
            status 404
            return { error: "File not found: #{file_path}" }.to_json
          end
          
          File.read(file_path)
        end
      end
    end
  end
end
