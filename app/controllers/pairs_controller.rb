class PairsController < ApplicationController

  def export
    @pair = Pair.find(params[:pair_id])
  end

  def results
    if params[:category]
      @pair =  Pair.where(category: Category.find_by_name(params[:category]), playful: params[:playful], modern: params[:modern], light: params[:light]).limit(3)
    else
      @pair = Pair.where(playful: params[:playful], modern: params[:modern], light: params[:light]).limit(3)
    end
  end

  def casual_pairs
    render 'mood'
  end

  alias_method :formal_pairs, :casual_pairs
  alias_method :all_pairs, :casual_pairs

  private

end

