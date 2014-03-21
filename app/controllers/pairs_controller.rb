class PairsController < ApplicationController

  def export
    @linkpair = Pair.find(params[:font_id])
    name = params[:font_id] + ".pdf"
    Prawn::Document.generate "public/assets/pdf/#{name}" do |pdf|
      pdf.text @link
    end
    session[:font_id] = params[:font_id]
  end

  def download
    send_file "#{Rails.root}/public/assets/pdf/#{session[:font_id]}.pdf", type: 'application/pdf'
  end

  helper_method :download

  def results
    @linkpair = find_pair(params[:slider1], params[:slider2], params[:slider3], params[:category])
    case params[:slider1]
        when at_limit?(params[:slider1])
            if params[:slider1] == 1
                @linkpair2 = find_pair(params[:slider1].to_i + 1, params[:slider2], params[:slider3],params[:category])
                @linkpair3 = find_pair(params[:slider1].to_i + 2, params[:slider2], params[:slider3],params[:category])
            else
                @linkpair2 = find_pair(params[:slider1].to_i - 1, params[:slider2], params[:slider3],params[:category])
                @linkpair3 = find_pair(params[:slider1].to_i - 2, params[:slider2], params[:slider3],params[:category])
            end
        else
                @linkpair2 = find_pair(params[:slider1].to_i + 1, params[:slider2], params[:slider3],params[:category])
                @linkpair3 = find_pair(params[:slider1].to_i - 1, params[:slider2], params[:slider3],params[:category])
    end
    @linkpair2 ||= @linkpair
    @linkpair3 ||= @linkpair

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

    private

        def at_limit?(slider)
            slider == 1 || slider == 5 ? true : false
        end

        def find_pair(slider1, slider2, slider3, category)
          Pair.find_by(slider1: slider1, slider2: slider2, slider3: slider3, category_id: Category.find_by_name(category))
        end
end

