require_relative "./app"

map "/api" do
  run Application
end
