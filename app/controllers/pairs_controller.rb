class PairsController < ApplicationController

  def home
  end

  def tone
  end

  def mood
  end

  def export
    linkpair = Pair.get_link_pair(params[:slider1], params[:slider2], params[:slider3])
    @link = Pair.link(linkpair)
=begin
    name = params[:s1] + ".pdf"
    Prawn::Document.generate "#{name}" do |pdf|
      pdf.text @link
    end
=end
  end

  def search
    redirect_to action: 'export', slider1: params[:slider1], slider2: params[:slider2], slider3: params[:slider3]
  end

  def category
    params[:category]
  end

  def casual_pairs
    category = Category.casual
    render 'mood'
  end

  def formal_pairs
    category = Category.formal
    render 'mood'
  end

  def selected_pair(selected_category)
    @pairs = selected_category.first.pairs
  end

  def find_category_of_pair
    @category = Pair.first.category
  end
end

