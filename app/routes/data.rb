# frozen_string_literal: true

module Routes
  module Data
    def self.registered(app)
      app.get "/data/day/:exchange/:symbol" do
        content_type "text/csv"
        exchange = params[:exchange]
        symbol = params[:symbol]
        file_path = File.join(Config.eodhd_dir, "data", "eod", exchange, "#{symbol}.csv")
        
        unless File.exist?(file_path)
          status 404
          content_type :json
          return { error: "File not found: #{file_path}" }.to_json
        end
        
        File.read(file_path)
      end

      app.get "/data/intra/:exchange/:symbol" do
        content_type :json
        exchange = params[:exchange]
        symbol = params[:symbol]
        from = params[:from]
        to = params[:to]
        
        unless from && to
          status 400
          return { error: "Missing required parameters: from and to (format: yyyy-MM)" }.to_json
        end
        
        result = {}
        current = from
        
        while current <= to
          file_path = File.join(Config.eodhd_dir, "data", "intraday", exchange, symbol, "#{current}.csv")
          
          if File.exist?(file_path)
            result[current] = File.read(file_path)
          end
          
          # Increment month
          year, month = current.split("-").map(&:to_i)
          month += 1
          if month > 12
            month = 1
            year += 1
          end
          current = format("%04d-%02d", year, month)
        end
        
        result.to_json
      end
    end
  end
end
