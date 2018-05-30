get "/download" do |env|
  render "src/views/download.ecr", "src/views/layout.ecr"
end

post "/download" do |env|
  name = env.params.body["storename"]
  password = env.params.body["password"]

  store = Store.find_by :name, name
  if store && password == store.password
    env.redirect "/files/#{store.name}/#{store.filename}"
  else
    env.redirect "/wrongpassword"
  end
end

get "/download/:storename" do |env|
  storename = env.params.url["storename"]
  render "src/views/download-store.ecr", "src/views/layout.ecr"
end

post "/download/:storename" do |env|
  name = env.params.url["storename"]
  password = env.params.body["password"]

  store = Store.find_by :name, name
  if store && password == store.password
    env.redirect "/files/#{store.name}/#{store.filename}"
  else
    env.redirect "/wrongpassword"
  end
end

get "/wrongpassword" do
  render "src/views/wrongpassword.ecr", "src/views/layout.ecr"
end