class PairsController < ApplicationController

  def export
    @linkpair = Pair.find_by(:slider1 => params[:slider1], 
                             :slider2 => params[:slider2], 
                             :slider3 => params[:slider3], 
                             :category_id => params[:category_id])
=begin
    name = params[:s1] + ".pdf"
    Prawn::Document.generate "#{name}" do |pdf|
      pdf.text @link
    end
=end
  end

  def search
    if request.headers.env["HTTP_REFERER"].match('formal')
      params[:category_id] = Category.formal
    else
      params[:category_id] = Category.casual
    end
    redirect_to action: 'export', slider1: params[:slider1], slider2: params[:slider2], slider3: params[:slider3], category_id: params[:category_id]
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

