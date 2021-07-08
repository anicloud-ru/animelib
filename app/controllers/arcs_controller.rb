class ArcsController < ApplicationController
  def new
    @arc = Arc.new(anime_id: params[:id])
  end

  def edit
    @arc = Arc.find(params[:id])
  end

  def update
    @arc = Arc.find(params[:id])
    @arc.update(arc_params)
    redirect_to arcs_anime_path(:id => @arc.anime_id)
  end

  def show
    @arc = Arc.find(params[:id])
  end

  def create
    @arc = Arc.new(arc_params)

    if @arc.save
      redirect_to arcs_anime_path(:id => @arc.anime_id)
    else
      render 'arcs/new'
    end
  end

  private
  def arc_params
    params.require(:arc).permit(
      :canonical,
      :russian,
      :number,
      :episodes,
      :anime_id
    )
  end
end
