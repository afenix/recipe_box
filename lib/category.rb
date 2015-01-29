class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)

  validates(:name, :presence => true)

  before_save(:capitalize_every_word)

  private
  define_method(:capitalize_every_word) do
    word_array = []
    self.name().split(' ').each do |word|
      word_array.push(word.capitalize!())
    end
    self.name = word_array.join(' ')
  end
end
