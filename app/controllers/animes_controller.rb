class AnimesController < ApplicationController
  def index
    @pagy, @animes = pagy(
      Animes::Query.fetch(scope: Anime, params: params),
      items: 12
    )
  end

  def show
    anime
  end

  def new
    @anime = Anime.new
  end

  def edit
    anime
  end

  def update
    anime
    @anime.update(anime_params)
    redirect_to @anime
  end

  def arc
    anime
  end

  def arcs
    anime
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
  def anime
    @anime = Anime.find(params[:id])
  end

  def anime_params
    params.require(:anime).permit(
      :canonical,
      :russian,
      :optionally,
      :kind,
      :status,
      :episodes_number,
      :age_rating,
      :description_ru,
      :description_en,
      :duration,
      :score,
      :franchise
    )
  end
end
