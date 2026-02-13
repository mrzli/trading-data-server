# frozen_string_literal: true

require "bundler/setup"
require "dotenv/load"
Bundler.require(:default)

require_relative "environment"

loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path("../app", __dir__))
loader.collapse(File.expand_path("../app/routes", __dir__))
loader.setup

APP_LOADER = loader
