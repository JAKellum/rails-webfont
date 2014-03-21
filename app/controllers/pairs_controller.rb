class PairsController < ApplicationController

  def export
    @linkpair = Pair.find(session[:pair_id])
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
    case params[:slider1]
        when at_limit?(params[:slider1])
            if params[:slider1] == 1
                @linkpair2 = Pair.find_by(:slider1 => params[:slider1].to_i + 1,
                                            :slider2 => params[:slider2],
                                            :slider3 => params[:slider3],
                                            :category => Category.find_by_name(params[:category]))
                @linkpair3 = Pair.find_by(:slider1 => params[:slider1].to_i + 2,
                                            :slider2 => params[:slider2],
                                            :slider3 => params[:slider3],
                                            :category => Category.find_by_name(params[:category]))
            else
                @linkpair2 = Pair.find_by(:slider1 => params[:slider1].to_i - 1,
                                            :slider2 => params[:slider2],
                                            :slider3 => params[:slider3],
                                            :category => Category.find_by_name(params[:category]))
                @linkpair3 = Pair.find_by(:slider1 => params[:slider1].to_i - 2,
                                            :slider2 => params[:slider2],
                                            :slider3 => params[:slider3],
                                            :category => Category.find_by_name(params[:category]))
            end
        else
                @linkpair2 = Pair.find_by(:slider1 => params[:slider1].to_i + 1,
                                            :slider2 => params[:slider2],
                                            :slider3 => params[:slider3],
                                            :category => Category.find_by_name(params[:category]))
                @linkpair3 = Pair.find_by(:slider1 => params[:slider1].to_i - 1,
                                            :slider2 => params[:slider2],
                                            :slider3 => params[:slider3],
                                            :category => Category.find_by_name(params[:category]))
    end
    @linkpair2 ||= @linkpair
    @linkpair3 ||= @linkpair

    session[:pair_id] = @linkpair.id
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

    private

        def at_limit?(slider)
            slider == 1 || slider == 5 ? true : false
        end

end

