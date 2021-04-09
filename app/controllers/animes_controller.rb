class AnimesController < ApplicationController
  def index
    @pagy, @animes = pagy(
      Animes::Query.fetch(scope: Anime, params: params),
      items: 12
    )
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)

    if @anime.save
      redirect_to @anime
    else
      render 'animes/new'
    end
  end

  private
  def anime_params
    params.require(:anime).permit(
      :canonical,
      :russian,
      :optionally
    )
  end
end
