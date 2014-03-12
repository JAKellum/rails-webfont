class Pair < ActiveRecord::Base
  belongs_to :category


  def both_fonts
    [self.headline_font, self.body_font]
  end

  def self.get_link_pair(slider1, slider2, slider3, category)
    Pair.find_by(slider1: slider1, slider2: slider2, slider3: slider3, category_id: category)
  end

  def link
    fonts = self.headline_font + "|" + self.body_font
    fonts.gsub! ' ', '%20'
    link = "http://fonts.googleapis.com/css?family=" + fonts
  end
end
