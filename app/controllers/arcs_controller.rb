class ArcsController < ApplicationController
  def new
    @arc = Arc.new
  end

  def edit
    @arc = Arc.find(params[:id])
  end

  def update
    @arc = Arc.find(params[:id])
    @arc.update(arc_params)
    redirect_to @arc
  end

  def show
    @arc = Arc.find(params[:id])
  end

  def create
    @arc = Arc.new(arc_params)

    if @arc.save
      redirect_to @arc
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
