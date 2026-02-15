# frozen_string_literal: true

module Routes
  module Info
    def self.registered(app)
      app.namespace "/info" do
        get "/dividends/:exchange/:symbol" do
          content_type :json
          exchange = params[:exchange]
          symbol = params[:symbol]
          file_path = File.join(Config.eodhd_dir, "info", exchange, symbol, "dividends.json")
          
          unless File.exist?(file_path)
            status 404
            return { error: "File not found: #{file_path}" }.to_json
          end
          
          File.read(file_path)
        end

        get "/splits/:exchange/:symbol" do
          content_type :json
          exchange = params[:exchange]
          symbol = params[:symbol]
          file_path = File.join(Config.eodhd_dir, "info", exchange, symbol, "splits.json")
          
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
