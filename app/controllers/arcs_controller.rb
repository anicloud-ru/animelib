class ArcsController < ApplicationController
  def new
    @arc = Arc.new(anime_id: params[:id])
  end

  def create
    @arc = Arc.new(arc_params)

    if @arc.save
      redirect_to arcs_animes
    else
      render 'arcs/new'
    end
  end

  private
  def arc_params
    params.require(:anime).permit(
      :name,
      :number,
      :series,
      :anime_id
    )
  end
end
