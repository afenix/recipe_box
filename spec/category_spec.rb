require('spec_helper')

describe (Category) do
  it {should have_and_belong_to_many (:recipes)}

  it("validates that the name field is populated") do
    category = Category.new({:name => ""})
    expect(category.save()).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    category = Category.create({:name => "dim sum"})
    expect(category.name()).to(eq("Dim Sum"))
  end

end
