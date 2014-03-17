class PairsController < ApplicationController

  def export
    @linkpair = Pair.find(session[:pair_id])
  end

  def results
    @linkpair = Pair.find_by(:slider1 => params[:slider1],
                             :slider2 => params[:slider2],
                             :slider3 => params[:slider3],
                             :category => Category.find_by_name(params[:category]))

    linkpair=(@linkpair)
    session[:pair_id] = @linkpair.id
  end

  def search
    redirect_to action: 'results', slider1: params[:slider1], slider2: params[:slider2], slider3: params[:slider3],
    category: params[:category]
  end

  def casual_pairs
    render 'mood'
  end

  alias_method :formal_pairs, :casual_pairs

  def home
  end

  def tone
  end

  def mood
  end

end

