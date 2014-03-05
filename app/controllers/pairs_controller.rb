class PairsController < ApplicationController
  def home
  end

  def tone
  end
  def mood
  end
  def export
  end

  def casual_pairs
    category = Category.where(name: 'casual').to_a
    @pairs = category.first.pairs.each
    render 'mood'
  end

  def formal_pairs
    category = Category.where(name: 'formal').to_a
    @pairs = category.first.pairs.each
    render 'mood'
  end

  def find_category_of_pair
    @category = Pair.first.category
  end
end
