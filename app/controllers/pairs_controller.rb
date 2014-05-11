class PairsController < ApplicationController

  def export
    @pair = Pair.find(params[:pair_id])
  end

  def results
    if params[:category]
      @pair =  pair_search(params[:playful],params[:modern], params[:light], params[:category])
    else
      @pair = pair_search(params[:playful],params[:modern],params[:light])
    end
  end

  def casual_pairs
    render 'mood'
  end

  alias_method :formal_pairs, :casual_pairs
  alias_method :all_pairs, :casual_pairs

  def pair_search(playful, modern, light, category = false)
    if category
      Pair.where(playful: params[:playful], modern: params[:modern], light: params[:light], category: Category.find_by_name(category)).limit(3)
    else
      Pair.where(playful: params[:playful], modern: params[:modern], light: params[:light]).limit(3)
    end
  end
  private

end

