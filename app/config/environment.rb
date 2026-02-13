# frozen_string_literal: true

module Environment
  module_function

  def eodhd_root
    ENV.fetch("EODHD_ROOT", "https://eodhd.com/api")
  end
end
