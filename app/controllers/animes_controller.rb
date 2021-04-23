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
    if @anime.update(anime_params) && params[:anime][:poster].size < Anime::MAX_SIZE_OF_POSTER && params[:anime][:poster].headers.match?(/(Content-Type: image\/(jpeg|png))/)
      if @anime.poster_upload(@anime.poster)
        redirect_to @anime
      end
    end
  end

  def arc
    anime
    @arc = Arc.where(anime_id: params[:id], number: params[:number]).first
  end

  def arcs
    anime
  end

  def create
    @anime = Anime.new(anime_params)
    if params[:anime][:poster].size < Anime::MAX_SIZE_OF_POSTER && params[:anime][:poster].headers.match?(/(Content-Type: image\/(jpeg|png))/)
      if @anime.save
        if @anime.poster_upload(@anime.poster)
          @arc = Arc.new(anime_id: @anime.id, canonical: "First Arc", russian: "Первая арка", episodes: "{0, 0}", number: 1)
          @arc.save
          redirect_to @anime
        end
      else
        render 'animes/new'
      end
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
      :franchise,
      :poster
    )
  end
end
