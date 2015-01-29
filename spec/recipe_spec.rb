require('spec_helper')

describe (Recipe) do
  it {should have_and_belong_to_many (:categories)}

  it("validates that the name field is populated") do
    recipe = Recipe.new({:name => "", :ingredients => "oranges", :instructions => "juice oranges"})
    expect(recipe.save()).to(eq(false))
  end
  it("validates that the ingredients field is populated") do
    recipe = Recipe.new({:name => "orange juice", :ingredients => "", :instructions => "juice oranges"})
    expect(recipe.save()).to(eq(false))
  end
  it("validates that the instructions field is populated") do
    recipe = Recipe.new({:name => "orange juice", :ingredients => "oranges", :instructions => ""})
    expect(recipe.save()).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    recipe = Recipe.create({:name => "orange juice", :ingredients => "oranges", :instructions => "juice oranges"})
    expect(recipe.name()).to(eq("Orange Juice"))
  end

  describe('.five_star') do
    it('returns all 5-star recipes') do
    recipe1 = Recipe.create({:name => "Orange Juice", :ingredients => "Oranges", :instructions => "Juice oranges", :rating => 5})
    recipe2 = Recipe.create({:name => "Apple Juice", :ingredients => "Apple", :instructions => "Juice apples", :rating => 3})
    expect(Recipe.five_star()).to(eq([recipe1]))
    end
  end
end
