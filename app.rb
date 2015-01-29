require('bundler/setup')
Bundler.require(:default)
# require('./lib/recipe')

Dir[File.dirname(__FILE__) + './lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/recipes') do
  Recipe.create(:name => params.fetch('name'), :ingredients => params.fetch('ingredients'), :instructions => params.fetch('instructions'))
  redirect('/')
end
