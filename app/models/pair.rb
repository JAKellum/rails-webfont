class Pair < ActiveRecord::Base
  belongs_to :category


  def both_fonts
    [self.headline_font, self.body_font]
  end

  def self.get_link_pair(slider1, slider2, slider3)
    pair = Pair.find_by slider1: slider1, slider2: slider2, slider3: slider3
    pair.headline_font + '|' + pair.body_font
  end

  def link(linkpair)
    "http://fonts.googleapis.com/css?family=" + linkpair + ":300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
  end
end
