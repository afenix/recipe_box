class CreateRecipesAndCategories < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer, index: true)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
      t.timestamps
    end
    create_table(:categories) do |t|
      t.column(:name, :string)
      t.timestamps
    end
  end
end
