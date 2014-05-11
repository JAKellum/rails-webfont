class Pair < ActiveRecord::Base
  belongs_to :category, inverse_of: :pair

  def self.find_pair(playful, modern, light, category = false)

    if category
      pair = Pair.where(playful: playful,
                modern: modern,
                light: light,
                category: Category.find_by_name(category)).limit(3)
    else
      pair = Pair.where(playful: playful,
                 modern: modern,
                 light: light).limit(3)
    end
  end

  def self.random
    Pair.limit(3).order('RANDOM()')
  end

  def link
    "http://fonts.googleapis.com/css?family=" + self.headline_font + "|" + self.body_font
  end
end
