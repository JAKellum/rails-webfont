class PairsController < ApplicationController

  def export
    @linkpair = Pair.find(params[:pair_id])
    if session.loaded?
      @results_link = "/pairs/results?category=" + session[:category] + "&slider1=" + session[:slider1] + "&slider2=" + session[:slider2] + "&slider3=" + session[:slider3]
      @mood_link = "/pairs/" + session[:category]
    else
      @results_link = "#"
      @mood_link = "#"
    end
  end

  def results
    @linkpair = find_pair(session[:slider1], session[:slider2], session[:slider3], session[:category])
    case session[:slider1]
        when at_limit?(session[:slider1])
            if session[:slider1] == 1
                @linkpair2 = find_pair(session[:slider1].to_i + 1, session[:slider2], session[:slider3],session[:category])
                @linkpair3 = find_pair(session[:slider1].to_i + 2, session[:slider2], session[:slider3],session[:category])
            else
                @linkpair2 = find_pair(session[:slider1].to_i - 1, session[:slider2], session[:slider3],session[:category])
                @linkpair3 = find_pair(session[:slider1].to_i - 2, session[:slider2], session[:slider3],session[:category])
            end
        else
                @linkpair2 = find_pair(session[:slider1].to_i + 1, session[:slider2], session[:slider3],session[:category])
                @linkpair3 = find_pair(session[:slider1].to_i - 1, session[:slider2], session[:slider3],session[:category])
    end
  end

  def search
    session[:category] = params[:category]
    session[:slider1] = params[:slider1]
    session[:slider2] = params[:slider2]
    session[:slider3] = params[:slider3]
    redirect_to action: 'results', slider1: session[:slider1], slider2: session[:slider2], slider3: session[:slider3],
    category: session[:category]
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

