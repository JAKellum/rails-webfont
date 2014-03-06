class PairsController < ApplicationController

  def home
  end

  def tone
  end

  def mood
  end

  def export
    @link = "http://fonts.googleapis.com/css?family=EB+Garamond|Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
=begin
    name = params[:s1] + ".pdf"
    Prawn::Document.generate "#{name}" do |pdf|
      pdf.text @link
    end
=end
  end

  def search
    redirect_to action: 'export', slider1: params[:a1], slider2: params[:a2], slider3: params[:a3]
  end

  def category
    params[:category]
  end
end

