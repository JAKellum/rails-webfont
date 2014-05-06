class PairsController < ApplicationController

  def export
  end

  def results
  end

  def casual_pairs
    render 'mood'
  end

  alias_method :formal_pairs, :casual_pairs
  alias_method :all_pairs, :casual_pairs

  def home
  end

  def tone
  end

  def search
    redirect_to '/results'
  end

  def mood
  end

    private

        def at_limit?(slider)
            slider == 1 || slider == 5 ? true : false
        end

        def find_pair(slider1, slider2, slider3, category)
         pair = Pair.find_by(slider1: slider1, slider2: slider2, slider3: slider3, category_id: Category.find_by_name(category))
         if pair
           pair
         end

         if !pair
          [1,2,3,4].each do |x|
            pair = Pair.find_by(slider1: (slider1.to_i - x).abs.to_s, slider2: slider2, slider3: slider3, category_id: Category.find_by_name(category))
            break if pair
            end
         end

        if !pair
          [1,2,3,4].each do |x|
            pair = Pair.find_by(slider1: slider1, slider2: (slider2.to_i - x).abs.to_s, slider3: slider3, category_id: Category.find_by_name(category))
            break if pair
            end
        end

         if !pair
          [1,2,3,4].each do |x|
            pair = Pair.find_by(slider1: slider1, slider2: slider2, slider3: (slider3.to_i - x).abs.to_s, category_id: Category.find_by_name(category))
            break if pair
            end
        end

         return pair || Pair.find(4)
        end
end

