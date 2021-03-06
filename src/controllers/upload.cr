# Upload path
get "/upload" do
  render "src/views/upload.ecr", "src/views/layout.ecr"
end

post "/upload" do |env|
  # grab the file from the enviroment
  file = env.params.files["file"]

  # make a new store
  store = Store.new(name: UUID.random.to_s)

  #Stop the upload if there is no file name
  halt env, status_code: 400, response: "Bad Request" if file.filename.nil?

  # make the paths for the dir and the file
  dir_path = File.join [FILES_PATH, store.name.to_s]
  # if the file name has an extension, we should preserve it.
  if file.filename.to_s =~ /\./
    store.filename = UUID.random.to_s + '.' + file.filename.to_s.split('.').last
    file_path = File.join [dir_path, store.filename.to_s]
  else
    store.filename = UUID.random.to_s
    file_path = File.join [dir_path, store.filename.to_s]
  end

  Dir.mkdir_p dir_path

  #Copy the file
  begin
    File.open(file_path, "w") do |f|
      IO.copy(file.tmpfile, f)
    end
  rescue IO::Error | IO::Timeout
    halt env, status_code: 400, response: "Bad Request"
  end

  #store the file path, pasword, and save
  store.path = file_path
  store.password = env.params.body["password"]
  store.save

  env.redirect "/uploadcomplete/#{store.name}"
end

# upload complete
get "/uploadcomplete/:name" do |env|
  filename = env.params.url["name"]
  render "src/views/uploadcomplete.ecr", "src/views/layout.ecr"
end