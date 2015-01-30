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

patch ("/add_categories") do
  recipe_id = params.fetch("recipe_id").to_i()
  found_recipe = Recipe.find(recipe_id)
  category_ids = params.fetch("category_ids")
  category_ids.each do |id|
    this_category = Category.find(id.to_i())
    found_recipe.categories.push(this_category)
  end
  redirect ('/')
end

get ('/edit_recipe/:id') do
  id = params.fetch("id").to_i()
  @recipe = Recipe.find(id)
  erb(:edit_recipe)
end

patch('/recipes/:id') do
  found_recipe = Recipe.find(params.fetch('id').to_i())
  name =params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  found_recipe.update({:name => name, :ingredients => ingredients, :instructions => instructions})
  rating = params.fetch("rating").to_i()
  found_recipe.update({:rating => rating})
  redirect('/')
end
