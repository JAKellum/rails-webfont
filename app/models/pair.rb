class Pair < ActiveRecord::Base
  belongs_to :category

  def self.find_pair(slider1, slider2, slider3, category)
    Pair.find_by(slider1: slider1, slider2: slider2, slider3: slider3, category_id: Category.find_by_name(category))
  end

  def link
    "http://fonts.googleapis.com/css?family=" + self.headline_font + "|" + self.body_font
  end
end
