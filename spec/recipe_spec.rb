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

end
