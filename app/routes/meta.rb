# frozen_string_literal: true

module Routes
  module Meta
    def self.registered(app)
      app.get "/meta/:exchange/:symbol/dividends" do
        content_type :json
        exchange = params[:exchange]
        symbol = params[:symbol]
        file_path = File.join(Config.eodhd_dir, "meta", exchange, symbol, "dividends.json")
        
        unless File.exist?(file_path)
          status 404
          return { error: "File not found: #{file_path}" }.to_json
        end
        
        File.read(file_path)
      end

      app.get "/meta/:exchange/:symbol/splits" do
        content_type :json
        exchange = params[:exchange]
        symbol = params[:symbol]
        file_path = File.join(Config.eodhd_dir, "meta", exchange, symbol, "splits.json")
        
        unless File.exist?(file_path)
          status 404
          return { error: "File not found: #{file_path}" }.to_json
        end
        
        File.read(file_path)
      end
    end
  end
end
