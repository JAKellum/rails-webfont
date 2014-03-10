class Pair < ActiveRecord::Base
  belongs_to :category


  def both_fonts
    [self.headline_font, self.body_font]
  end

  def self.get_link_pair(slider1, slider2, slider3, category)
    # binding.pry
    Pair.find_by(slider1: slider1, slider2: slider2, slider3: slider3, category_id: category)
    # pair.headline_font + '|' + pair.body_font
  end

  def link
    "http://fonts.googleapis.com/css?family=" + self.headline_font + "|" + self.body_font + ":300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
  end
end
