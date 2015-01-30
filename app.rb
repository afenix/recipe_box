require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + './lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/recipes') do
  Recipe.create(:name => params.fetch('name'), :ingredients => params.fetch('ingredients'), :instructions => params.fetch('instructions'))
  redirect('/')
end

get('/recipes/:id') do
  id = params.fetch('id').to_i()
  @recipe = Recipe.find(id)
  @categories = Category.all()
  erb(:recipe)
end

patch "/add_categories" do
  category_ids = params.fetch("category_ids")
  recipe_id = params.fetch("recipe_id").to_i()
  tomato_soup = Recipe.find(recipe_id)
  category_objects = []
  category_ids.each do |id|
    this_category = Category.find(id.to_i())
    category_objects.push(this_category)
  end
  category_objects.each do |object|
    tomato_soup.categories.push(object)
  end
  redirect ('/')
end
