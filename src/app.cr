require "uuid"
require "kemal"
require "./models/*"
require "./controllers/*"

FILES_PATH = File.join [Kemal.config.public_folder, "files/"]
Dir.mkdir_p("./db")

# Home path
get "/" do
  render "src/views/home.ecr", "src/views/layout.ecr"
end

get "/files" do |env|
  halt env, status_code: 404, response: "Forbidden" 
end

get "/files/*" do |env|
  halt env, status_code: 404, response: "Forbidden" 
end

Kemal.run