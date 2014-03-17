class PairsController < ApplicationController

  def export
    @linkpair = linkpair
  end
=begin
    name = params[:s1] + ".pdf"
    Prawn::Document.generate "#{name}" do |pdf|
      pdf.text @link
    end
=end

  def results
    @linkpair = Pair.find_by(:slider1 => params[:slider1],
                             :slider2 => params[:slider2],
                             :slider3 => params[:slider3],
                             :category => Category.find_by_name(params[:category]))

    linkpair=(@linkpair)
  end

  def linkpair=(pair)
    @linkpair = pair
  end

  def linkpair
    @linkpair
  end

=begin
    name = params[:s1] + ".pdf"
    Prawn::Document.generate "#{name}" do |pdf|
      pdf.text @link
    end
=end

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

