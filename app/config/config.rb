# frozen_string_literal: true

module Config
  class Error < StandardError; end

  Eodhd = Data.define(:dir)

  class << self
    def eodhd
      Eodhd.new(dir: eodhd_dir)
    end

    def eodhd_dir
      required_env("EODHD_DIR")
    end

    private

    def required_env(key)
      value = ENV[key].to_s.strip
      raise Error, "Missing #{key} in environment (.env)" if value.empty?

      value
    end
  end
end
