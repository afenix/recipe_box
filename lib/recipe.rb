class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  scope(:five_star, -> do
    where ({:rating => 5})
  end) 

  validates(:name, :presence => true)
  validates(:ingredients, :presence => true)
  validates(:instructions, :presence => true)
  before_save(:capitalize_entire_name)


private

  define_method(:capitalize_entire_name) do
    split_string =[]
    self.name().split(' ').each do |word|
      split_string.push(word.capitalize())
    end
    self.name = split_string.join(' ')
  end

end
