class PairsController < ApplicationController

  def export
    #category = Category.where('name' == params[:category]).first.id.to_i
    #binding.pry
    @linkpair = Pair.find_by(:slider1 => params[:slider1], 
                             :slider2 => params[:slider2], 
                             :slider3 => params[:slider3], 
                             :category => Category.find_by_name(params[:category]))
  end
=begin
    name = params[:s1] + ".pdf"
    Prawn::Document.generate "#{name}" do |pdf|
      pdf.text @link
    end
=end
  

  def search
    redirect_to action: 'export', slider1: params[:slider1], slider2: params[:slider2], slider3: params[:slider3], 
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

