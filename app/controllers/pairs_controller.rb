class PairsController < ApplicationController

  def export
    @pair = Pair.find(params[:pair_id])
  end

  def results
      @pair =  pair_search(playful ,modern, light, category)
      if @pair.size < 3
        @pair << pair_search(!playful, modern, light, category).to_a
      end
      if @pair.size < 3
        @pair << pair_search(playful, !modern, light, category).to_a
      end
      if @pair.size < 3
        @pair << pair_search(playful, modern, !light, category).to_a
      end
      if @pair.size < 3
        new_pair = pair_search(playful, modern, light).to_a
        if !@pair.include(new_pair)
          @pair << new_pair
        end
      end
      if @pair.size < 3
        new_pair = pair_search(!playful, modern, light).to_a
        if !@pair.include(new_pair)
          @pair << new_pair
        end
      end
      if @pair.size < 3
        new_pair = pair_search(playful, !modern, light).to_a
        if !@pair.include(new_pair)
          @pair << new_pair
        end
      end
      if @pair.size < 3
        new_pair = pair_search(playful, modern, !light).to_a
        if !@pair.include(new_pair)
          @pair << new_pair
        end
      end
      if @pair.size< 3
        @pair << Pair.order("RANDOM()").first
      end
      @pair = @pair.flatten
      @pair = @pair[0..2]
  end
  def casual_pairs
    render 'mood'
  end
  alias_method :formal_pairs, :casual_pairs
  alias_method :all_pairs, :casual_pairs

  def pair_search(playful, modern, light, category = false)
      Pair.find_pair(playful, modern, light, category)
  end

  private

  [:playful, :modern, :light, :category].each do |action|
    define_method(action){ return params[action.to_sym] }
  end

end

