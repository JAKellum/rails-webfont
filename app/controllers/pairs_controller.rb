class PairsController < ApplicationController

  def export
    @pair = Pair.find(params[:pair_id])
  end

  def results
      @pair =  pair_search(playful ,modern, light, category)
      @pair << pair_search(!playful, modern, light, category) if not_3_results?
      @pair << pair_search(playful, !modern, light, category) if not_3_results?
      @pair << pair_search(playful, modern, !light, category) if not_3_results?
      insert_if_not_included(pair_search(playful, modern, light)) if not_3_results?
      insert_if_not_included(pair_search(!playful, modern, light)) if not_3_results?
      insert_if_not_included(pair_search(playful, !modern, light)) if not_3_results?
      insert_if_not_included(pair_search(playful, modern, !light)) if not_3_results?
      @pair << Pair.order("RANDOM()").first if not_3_results?
      @pair = @pair.flatten
      @pair = @pair[FIRST_3]
  end

  def casual_pairs
    render 'mood'
  end
  alias_method :formal_pairs, :casual_pairs
  alias_method :all_pairs, :casual_pairs

  def pair_search(playful, modern, light, category = false)
    Pair.find_pair(playful, modern, light, category).to_a
  end

  private

    def not_3_results?
      @pair.size < MINIMUM_RESULTS
    end

    def insert_if_not_included(new_pair)
      if !@pair.include(new_pair)
        @pair << new_pair
      end
    end

    [:playful, :modern, :light, :category].each do |action|
      define_method(action){ return params[action.to_sym] }
    end

    MINIMUM_RESULTS = 3
    FIRST_3 = 0..2

end

